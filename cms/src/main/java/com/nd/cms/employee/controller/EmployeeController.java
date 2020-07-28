package com.nd.cms.employee.controller;

import com.google.gson.Gson;
import com.nd.cms.employee.model.vo.Career;
import com.nd.cms.employee.model.vo.Degree;
import com.nd.cms.employee.model.vo.Department;
import com.nd.cms.employee.model.vo.Discharge;
import com.nd.cms.employee.model.vo.Education;
import com.nd.cms.employee.model.vo.Education_Status;
import com.nd.cms.employee.model.vo.Emp_Skill;
import com.nd.cms.employee.model.vo.Employee;
import com.nd.cms.employee.model.vo.Graduate_Status;
import com.nd.cms.employee.model.vo.Keyword;
import com.nd.cms.employee.model.vo.License;
import com.nd.cms.employee.model.vo.License_List;
import com.nd.cms.employee.model.vo.Military;
import com.nd.cms.employee.model.vo.Military_Group;
import com.nd.cms.employee.model.vo.Military_Service;
import com.nd.cms.employee.model.vo.Militaty_Rank;
import com.nd.cms.employee.model.vo.School;
import com.nd.cms.employee.model.vo.Search_Employee;
import com.nd.cms.employee.model.vo.Skill;
import com.nd.cms.employee.model.vo.Skill_Type;
import com.nd.cms.common.Attachment;
import com.nd.cms.common.ChangeFileName;
import com.nd.cms.common.MailService;
import com.nd.cms.common.PageInfo;
import com.nd.cms.common.Pagination;
import com.nd.cms.employee.model.service.EmployeeService;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmployeeController {
  private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
  
  private EmployeeService es;
  
  private MailService mailService;
  
  public EmployeeController(EmployeeService es, MailService mailService) {
    this.es = es;
    this.mailService = mailService;
  }
  
  @RequestMapping({"signinForm.em"})
  public String showSigninForm() {
    return "employee/signinForm";
  }
  
  @RequestMapping({"signin.em"})
  public String signin(Employee emp, RedirectAttributes redirectAttributes, HttpSession session) {
    int code = 0;
    try {
      Employee loginEmp = this.es.signin(emp);
      if (loginEmp != null && loginEmp.getEmp_level_code() < 4) {
        session.setAttribute("loginEmp", loginEmp);
        return "redirect:/index.jsp";
      } 
      if (loginEmp != null && loginEmp.getEmp_level_code() == 4) {
        code = 2;
      } else if (loginEmp != null && loginEmp.getEmp_level_code() == 5) {
        code = 3;
      } else {
        code = 1;
      } 
    } catch (Exception e) {
      code = 4;
    } 
    redirectAttributes.addFlashAttribute("code", Integer.valueOf(code));
    redirectAttributes.addFlashAttribute("emp_id", emp.getEmp_id());
    return "redirect:/signinForm.em";
  }
  
  @RequestMapping({"logout.em"})
  public ModelAndView logoutEmployee(HttpSession session, ModelAndView mav) {
    session.invalidate();
    mav.setViewName("redirect:/");
    return mav;
  }
  
  @RequestMapping({"passwordCheck.em"})
  public ModelAndView passwordCheck(ModelAndView mav, HttpSession session, String emp_pwd) {
    Employee emp = (Employee)session.getAttribute("loginEmp");
    emp.setEmp_pwd(emp_pwd);
    int result = this.es.passwordCheck(emp);
    mav.addObject("result", Integer.valueOf(result));
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"updatePwd.em"})
  public String updatePwd(Model model, HttpSession session, String emp_pwd) {
    Employee emp = (Employee)session.getAttribute("loginEmp");
    emp.setEmp_pwd(emp_pwd);
    int result = this.es.updatePwd(emp);
    int code = 0;
    if (result > 0)
      code = 1; 
    model.addAttribute("code", Integer.valueOf(code));
    return "employee/empInfo/passwordUpdateForm";
  }
  
  @RequestMapping({"signupForm.em"})
  public String showSignupForm(Model model) {
    List<Department> deptList = this.es.selectDepartment();
    model.addAttribute("deptList", deptList);
    return "employee/signupForm";
  }
  
  @RequestMapping({"idCheck.em"})
  public ModelAndView idCheck(ModelAndView mav, String emp_id) {
    Boolean check = Boolean.valueOf(false);
    int result = this.es.idCheck(emp_id);
    if (result <= 0)
      check = Boolean.valueOf(true); 
    mav.addObject("check", check);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"signup.em"})
  public String signup(Employee emp, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    String page = "";
    int result = this.es.signup(emp);
    if (loginEmp == null && result > 0) {
      this.mailService.sendMail(emp, 1);
      redirectAttributes.addAttribute("type", Integer.valueOf(1));
      page = "redirect:/error";
    } else if (loginEmp != null && loginEmp.getEmp_level_code() == 1) {
      redirectAttributes.addAttribute("emp_no", Integer.valueOf(emp.getEmp_no()));
      page = "redirect:/empInfoForm.em";
    } else {
      page = "employee/signupForm";
    } 
    return page;
  }
  
  @RequestMapping({"empInfoForm.em"})
  public String showEmpInfoForm(Model model, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no, @RequestParam(value = "info_code", defaultValue = "0") int info_code) {
    String pageLink = "";
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp == null) {
      redirectAttributes.addAttribute("type", Integer.valueOf(4));
      pageLink = "redirect:/error";
    } else {
      if (loginEmp.getEmp_level_code() < 3 && emp_no != 0) {
        model.addAttribute("emp_no", Integer.valueOf(emp_no));
      } else {
        emp_no = loginEmp.getEmp_no();
      } 
      pageLink = "employee/empInfoForm";
      Employee emp = this.es.myInfoSearch(emp_no);
      List<School> schoolList = this.es.selectSchoolList(emp_no);
      Military military = this.es.selectMilitary(emp_no);
      List<Education> eduList = this.es.selectEdu(emp_no);
      List<License> licenseList = this.es.selectLicense(emp_no);
      List<Emp_Skill> skillList = this.es.selectSkill(emp_no);
      List<Career> careerList = this.es.selectCareer(emp_no);
      model.addAttribute("emp", emp);
      model.addAttribute("schoolList", schoolList);
      model.addAttribute("military", military);
      model.addAttribute("eduList", eduList);
      model.addAttribute("licenseList", licenseList);
      model.addAttribute("skillList", skillList);
      model.addAttribute("careerList", careerList);
      List<Department> deptList = this.es.selectDepartment();
      List<Degree> degreeList = this.es.selectDegree();
      List<Graduate_Status> graduateList = this.es.selectGraduate();
      List<Military_Service> miliServiceList = this.es.selectMiliService();
      List<Military_Group> miliGroupList = this.es.selectMiliGroup();
      List<Militaty_Rank> miliRankList = this.es.selectMiliRank();
      List<Discharge> dischargeList = this.es.selectDischarge();
      List<Education_Status> eduStatusList = this.es.selectEduStatus();
      List<Skill> skills = this.es.selectSkills();
      List<Keyword> keywords = this.es.selectKeywords();
      model.addAttribute("deptList", deptList);
      model.addAttribute("degreeList", degreeList);
      model.addAttribute("graduateList", graduateList);
      model.addAttribute("miliServiceList", miliServiceList);
      model.addAttribute("miliGroupList", miliGroupList);
      model.addAttribute("miliRankList", miliRankList);
      model.addAttribute("dischargeList", dischargeList);
      model.addAttribute("eduStatusList", eduStatusList);
      model.addAttribute("skills", skills);
      model.addAttribute("keywords", keywords);
      if (info_code > 0)
        model.addAttribute("info_code", Integer.valueOf(1)); 
    } 
    return pageLink;
  }
  
  @RequestMapping({"myInfoModal.em"})
  public ModelAndView myInfoModal(ModelAndView mav, HttpSession session, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (emp_no == 0)
      emp_no = loginEmp.getEmp_no(); 
    Attachment profile = this.es.selectProfileImg(emp_no);
    mav.addObject("profile", profile);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"modyMyInfo.em"})
  public String modyMyInfo(Model model, HttpServletRequest request, HttpSession session, @ModelAttribute Employee emp) {
    int result = this.es.modyMyInfo(emp);
    if (result > 0) {
      int emp_no = emp.getEmp_no();
      emp = this.es.myInfoSearch(emp_no);
      model.addAttribute("emp", emp);
      Employee loginEmp = (Employee)session.getAttribute("loginEmp");
      if (emp_no != loginEmp.getEmp_no())
        model.addAttribute("emp_no", Integer.valueOf(emp_no)); 
    } else {
    
    } 
    List<Department> deptList = this.es.selectDepartment();
    model.addAttribute("deptList", deptList);
    return "employee/empInfo/myInfoForm";
  }
  
  @RequestMapping({"modyProfileImg.em"})
  public String modyProfileImg(HttpServletRequest request, HttpSession session, Model model, Attachment oldImg, @RequestParam(name = "newImg", required = false) MultipartFile newImg) {
    int emp_no = oldImg.getEmp_no();
    Employee emp = null;
    if (oldImg.getFile_no() > 0)
      this.es.modyFile(oldImg); 
    String origin_name = newImg.getOriginalFilename();
    if (origin_name != null && !origin_name.equals("")) {
      Attachment insertImg = new Attachment();
      String root = request.getSession().getServletContext().getRealPath("resources");
      String file_path = String.valueOf(root) + "/uploadFiles/profileImage/" + oldImg.getEmp_no();
      String ext = origin_name.substring(origin_name.lastIndexOf("."));
      String change_name = ChangeFileName.getChangeFileName();
      System.out.println(file_path);
      insertImg.setEmp_no(emp_no);
      insertImg.setFile_path(file_path);
      insertImg.setOrigin_name(origin_name);
      insertImg.setChange_name(String.valueOf(change_name) + ext);
      try {
        File Folder = new File(file_path);
        if (!Folder.exists()) {
          try {
            Folder.mkdir();
            logger.info("������ �����Ǿ����ϴ�.");
          } catch (Exception e) {
            e.getStackTrace();
          } 
        } else {
          logger.info("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
        } 
        newImg.transferTo(new File(String.valueOf(file_path) + "/" + change_name + ext));
        this.es.modyFile(insertImg);
      } catch (Exception e) {
        logger.error(e.getMessage());
        (new File(String.valueOf(file_path) + "\\" + change_name + ext)).delete();
      } 
    } 
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (emp_no != loginEmp.getEmp_no())
      model.addAttribute("emp_no", Integer.valueOf(emp_no)); 
    emp = this.es.myInfoSearch(emp_no);
    List<Department> deptList = this.es.selectDepartment();
    model.addAttribute("deptList", deptList);
    model.addAttribute("emp", emp);
    return "employee/empInfo/myInfoForm";
  }
  
  @RequestMapping({"deleteEmpRequest.em"})
  public ModelAndView deleteEmpRequest(ModelAndView mav, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee emp = this.es.myInfoSearch(emp_no);
    this.mailService.sendMail(emp, 3);
    mav.addObject("msg", "�����ڿ��� Ż�� ��û�� ���½��ϴ�.");
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"schoolMody.em"})
  public String schoolMody(Model model, HttpSession session, String param, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    JSONArray jsonArr = JSONArray.fromObject(param);
    List<School> schoolList = new ArrayList();
    Gson gson = new Gson();
    for (int i = 0; i < jsonArr.size(); i++) {
      School school = (School)gson.fromJson(jsonArr.get(i).toString(), School.class);
      school.setEmp_no(emp_no);
      if (school.getAdmission_date() != null) {
        school.setAdmission_date(String.valueOf(school.getAdmission_date().replace(".", "-")) + "-01");
        school.setGraduate_date(String.valueOf(school.getGraduate_date().replace(".", "-")) + "-01");
      } 
      schoolList.add(school);
    } 
    int result = this.es.schoolMody(schoolList);
    List<School> selectList = null;
    if (result > 0) {
      selectList = this.es.selectSchoolList(emp_no);
    } else {
    
    } 
    List<Degree> degreeList = this.es.selectDegree();
    List<Graduate_Status> graduateList = this.es.selectGraduate();
    model.addAttribute("schoolList", selectList);
    model.addAttribute("degreeList", degreeList);
    model.addAttribute("graduateList", graduateList);
    return "employee/empInfo/careerForm/schoolForm";
  }
  
  @RequestMapping({"deleteSchool.em"})
  public ModelAndView deleteSchool(ModelAndView mav, int school_no) {
    this.es.deleteSchool(school_no);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"militaryMody.em"})
  public String militaryMody(Model model, HttpSession session, Military military, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    military.setEmp_no(emp_no);
    int result = this.es.militaryMody(military);
    if (result > 0) {
      military = this.es.selectMilitary(emp_no);
    } else {
    
    } 
    List<Military_Service> miliServiceList = this.es.selectMiliService();
    List<Military_Group> miliGroupList = this.es.selectMiliGroup();
    List<Militaty_Rank> miliRankList = this.es.selectMiliRank();
    List<Discharge> dischargeList = this.es.selectDischarge();
    model.addAttribute("military", military);
    model.addAttribute("miliServiceList", miliServiceList);
    model.addAttribute("miliGroupList", miliGroupList);
    model.addAttribute("miliRankList", miliRankList);
    model.addAttribute("dischargeList", dischargeList);
    return "employee/empInfo/careerForm/militaryForm";
  }
  
  @RequestMapping({"eduMody.em"})
  public String eduMody(Model model, HttpSession session, String param, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    JSONArray jsonArr = JSONArray.fromObject(param);
    List<Education> eduList = new ArrayList();
    Gson gson = new Gson();
    for (int i = 0; i < jsonArr.size(); i++) {
      Education education = (Education)gson.fromJson(jsonArr.get(i).toString(), Education.class);
      education.setEmp_no(emp_no);
      eduList.add(education);
    } 
    int result = this.es.eduMody(eduList);
    if (result > 0) {
      eduList = this.es.selectEdu(emp_no);
    } else {
    
    } 
    List<Education_Status> eduStatusList = this.es.selectEduStatus();
    model.addAttribute("eduList", eduList);
    model.addAttribute("eduStatusList", eduStatusList);
    return "employee/empInfo/careerForm/eduForm";
  }
  
  @RequestMapping({"deleteEdu.em"})
  public ModelAndView deleteEdu(ModelAndView mav, int edu_no) {
    this.es.deleteEdu(edu_no);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"skillMody.em"})
  public String skillMody(Model model, HttpSession session, String[] skill_codes, String[] keyword_codes, String etc, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    Map<String, Object> map = new HashMap();
    if (skill_codes != null)
      map.put("skill_codes", skill_codes); 
    if (keyword_codes != null)
      map.put("keyword_codes", keyword_codes); 
    Emp_Skill emp_skill = new Emp_Skill();
    emp_skill.setEtc(etc);
    emp_skill.setEmp_no(emp_no);
    map.put("etc", etc);
    int result = this.es.skillMody(map, emp_no);
    List<Emp_Skill> skillList = null;
    if (result > 0) {
      skillList = this.es.selectSkill(emp_no);
    } else {
    
    } 
    model.addAttribute("skillList", skillList);
    List<Skill> skills = this.es.selectSkills();
    List<Keyword> keywords = this.es.selectKeywords();
    model.addAttribute("skills", skills);
    model.addAttribute("keywords", keywords);
    return "employee/empInfo/careerForm/skillForm";
  }
  
  @RequestMapping({"licenseMody.em"})
  public String licenseMody(Model model, HttpSession session, String param, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    JSONArray jsonArr = JSONArray.fromObject(param);
    List<License> licenseList = new ArrayList();
    Gson gson = new Gson();
    for (int i = 0; i < jsonArr.size(); i++) {
      License license = (License)gson.fromJson(jsonArr.get(i).toString(), License.class);
      license.setEmp_no(emp_no);
      licenseList.add(license);
    } 
    int result = this.es.licenseMody(licenseList, emp_no);
    if (result > 0) {
      licenseList = this.es.selectLicense(emp_no);
    } else {
    
    } 
    model.addAttribute("licenseList", licenseList);
    return "employee/empInfo/careerForm/licenseForm";
  }
  
  @RequestMapping({"deleteProject.em"})
  public ModelAndView deleteProject(ModelAndView mav, int project_no) {
    this.es.deleteProject(project_no);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"deleteCareer.em"})
  public ModelAndView deleteCareer(ModelAndView mav, int career_no) {
    this.es.deleteCareer(career_no);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"careerMody.em"})
  public String careerMody(Model model, HttpSession session, String param, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    JSONArray jsonArr = JSONArray.fromObject(param);
    List<Career> careerList = new ArrayList();
    Gson gson = new Gson();
    for (int i = 0; i < jsonArr.size(); i++) {
      Career career = (Career)gson.fromJson(jsonArr.get(i).toString(), Career.class);
      career.setEmp_no(emp_no);
      careerList.add(career);
    } 
    int result = this.es.careerMody(careerList);
    if (result > 0) {
      careerList = this.es.selectCareer(emp_no);
    } else {
    
    } 
    model.addAttribute("careerList", careerList);
    return "employee/empInfo/careerForm/careerForm";
  }
  
  @RequestMapping({"adminSearchForm.em"})
  public String adminSearchForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
    String page = "";
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    if (loginEmp == null || loginEmp.getEmp_level_code() > 2) {
      redirectAttributes.addAttribute("type", Integer.valueOf(2));
      page = "redirect:/error";
    } else {
      page = "admin/adminSearch";
    } 
    List<Department> deptList = this.es.selectDepartment();
    List<Skill_Type> skillTypeList = this.es.selectSkillType();
    List<License_List> liList = this.es.selectliList();
    model.addAttribute("deptList", deptList);
    model.addAttribute("skillTypeList", skillTypeList);
    model.addAttribute("liList", liList);
    List<Skill> skills = this.es.selectSkills();
    List<Keyword> keywords = this.es.selectKeywords();
    model.addAttribute("skills", skills);
    model.addAttribute("keywords", keywords);
    return page;
  }
  
  @RequestMapping({"adminSearch.em"})
  public String adminSearch(Model model, String params) {
    Gson gson = new Gson();
    Search_Employee search = (Search_Employee)gson.fromJson(params, Search_Employee.class);
    int currentPage = Integer.parseInt((new StringBuilder(String.valueOf(search.getCurrentPage()))).toString());
    int limit = Integer.parseInt((new StringBuilder(String.valueOf(search.getLimit()))).toString());
    int listCount = this.es.getAdminSearchCount(search);
    PageInfo pi = Pagination.getPageInfo(currentPage, listCount, limit);
    Map<String, Object> map = new HashMap();
    map.put("search", search);
    map.put("pi", pi);
    List<Search_Employee> empList = this.es.adminSearch(map);
    model.addAttribute("empList", empList);
    model.addAttribute("pi", pi);
    return "admin/adminSearchList";
  }
  
  @RequestMapping({"showDetailEmpForm.em"})
  public String showDetailEmpForm(Model model, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    String page = "";
    if (loginEmp == null || emp_no == 0 || (loginEmp.getEmp_level_code() > 2 && loginEmp.getEmp_no() != emp_no)) {
      redirectAttributes.addAttribute("type", Integer.valueOf(2));
      page = "redirect:/error";
    } else {
      page = "admin/adminEmpForm";
      Employee showEmp = this.es.selectDetailEmp(emp_no);
      List<School> schoolList = this.es.selectSchoolList(emp_no);
      Military military = this.es.selectMilitary(emp_no);
      List<Education> eduList = this.es.selectEdu(emp_no);
      List<License> licenseList = this.es.selectLicense(emp_no);
      List<Emp_Skill> skillList = this.es.selectSkill(emp_no);
      List<Career> careerList = this.es.selectCareer(emp_no);
      model.addAttribute("showEmp", showEmp);
      model.addAttribute("schoolList", schoolList);
      model.addAttribute("military", military);
      model.addAttribute("eduList", eduList);
      model.addAttribute("licenseList", licenseList);
      model.addAttribute("skillList", skillList);
      model.addAttribute("careerList", careerList);
    } 
    return page;
  }
  
  @RequestMapping({"deleteEmp.em"})
  public String deleteEmp(HttpSession session, Model model, ModelAndView mav, RedirectAttributes redirectAttributes, @RequestParam(value = "emp_no", defaultValue = "0") int emp_no) {
    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
    String page = "";
    if (loginEmp.getEmp_level_code() < 4 && emp_no <= 0)
      emp_no = loginEmp.getEmp_no(); 
    int result = this.es.deleteEmp(emp_no);
    if (result > 0) {
      if (loginEmp.getEmp_level_code() < 3 && emp_no > 0) {
        page = "admin/adminSearch";
      } else {
        page = "redirect:/index.jsp";
        logoutEmployee(session, mav);
        redirectAttributes.addFlashAttribute("msg", "Ż��ó�� �Ǿ����ϴ�.");
      } 
    } else {
      page = "redirect:/error";
    } 
    return page;
  }
  
  @RequestMapping({"findInfoForm.em"})
  public String findMyInfoForm() {
    return "employee/findMyInfoForm";
  }
  
  @RequestMapping({"findMyId.em"})
  public ModelAndView findMyId(ModelAndView mav, Employee emp) {
    emp = this.es.findMyId(emp);
    mav.addObject("result", emp);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"sendMyId.em"})
  public ModelAndView sendMyId(ModelAndView mav, Employee emp) {
    this.mailService.sendMail(emp, 4);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"findMyPwd.em"})
  public ModelAndView findMyPwd(ModelAndView mav, Employee emp) {
    emp = this.es.findMyPwd(emp);
    if (emp != null)
      this.mailService.sendMail(emp, 5); 
    mav.addObject("result", emp);
    mav.setViewName("jsonView");
    return mav;
  }
}
