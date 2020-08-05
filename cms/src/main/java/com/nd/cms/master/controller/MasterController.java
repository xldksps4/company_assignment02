package com.nd.cms.master.controller;

import com.nd.cms.master.model.service.MasterService;
import com.nd.cms.common.MailService;
import com.nd.cms.common.PageInfo;
import com.nd.cms.common.Pagination;
import com.nd.cms.employee.model.service.EmployeeService;
import com.nd.cms.employee.model.vo.Department;
import com.nd.cms.employee.model.vo.Employee;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MasterController {
  private static final Logger logger = LoggerFactory.getLogger(MasterController.class);
  
  private static final int master_no = 1;
  
  private MasterService ms;
  
  private EmployeeService es;
  
  private MailService mailService;
  
  public MasterController(MasterService ms, EmployeeService es, MailService mailService) {
    this.ms = ms;
    this.es = es;
    this.mailService = mailService;
  }
  
  @RequestMapping({"masterForm.ma"})
  public String showMasterForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");	//no, id, level_code
    String pageLink = "";
    if (loginEmp != null) {
      if (loginEmp.getEmp_level_code() == 1) {
        pageLink = "master/masterForm";
      } else {
        redirectAttributes.addAttribute("type", Integer.valueOf(2));
        pageLink = "redirect:/error";
      } 
    } else {
      pageLink = "redirect:/signinForm.em";
    } 
    return pageLink;
  }
  
  @RequestMapping({"masterPage.ma"})
//  @ResponseBody
  public String searchMasterList(HttpSession session, Model model, 
		  RedirectAttributes redirectAttributes, Employee emp, 
		  @RequestParam(defaultValue = "1") int page
		  ) {
	  logger.info("[Controller]__회원 등급 페이지 입니다.");  
	  logger.info("[Ajax]__"+ page);

	  
	  Employee loginEmp = (Employee)session.getAttribute("loginEmp");
      String pageLink = "";
    if (loginEmp != null) {
      if (loginEmp.getEmp_level_code() == 1) {
        pageLink = "master/masterList";
        int listCount = this.ms.getMasterListCount(emp);
        PageInfo pi = Pagination.getPageInfo(page, listCount, 5);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("emp", emp);
        map.put("pi", pi);
        List<Employee> empList = this.ms.getMasterList(map);
        map.put("empList", empList);
        
        /* POST방식에선 주석 */
        model.addAttribute("pi", pi);
        model.addAttribute("empList", empList);
        
        logger.info("[result]__pi >>>>"+ pi);
        logger.info("[result]__empList"+ empList);
      } else {
        redirectAttributes.addAttribute("type", Integer.valueOf(2));
        pageLink = "redirect:/error";
      } 
    } else {
      pageLink = "redirect:/signinForm.em";
    } 
    return pageLink;
  }
  
  @RequestMapping({"changeLevel.ma"})
  public ModelAndView changeEmpLevel(ModelAndView mav, Employee emp) {
    int result = this.ms.changeEmpLevel(emp);
    String msg = "";
    if (result > 0) {
      msg = "권한이 변경되었습니다.";
      if (emp.getEmp_level_code() < 4) {
        emp = this.ms.empInfoSearch(emp.getEmp_no());
        this.mailService.sendMail(emp, 2);
      } 
    } else {
      msg = "권한이 변경되지 않았습니다."; 
    } 
    mav.addObject("msg", msg);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"newEmpAdd.ma"})
  public String newEmpAdd(Model model) {
    List<Department> deptList = this.es.selectDepartment();
    model.addAttribute("deptList", deptList);
    model.addAttribute("master", "Y");
    return "employee/signupForm";
  }
}
