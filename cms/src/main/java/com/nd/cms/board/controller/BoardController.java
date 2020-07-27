package com.nd.cms.board.controller;

import com.nd.cms.board.model.service.BoardService;
import com.nd.cms.board.model.vo.Board;
import com.nd.cms.common.Attachment;
import com.nd.cms.common.ChangeFileName;
import com.nd.cms.common.FileDownload;
import com.nd.cms.common.PageInfo;
import com.nd.cms.common.Pagination;
import com.nd.cms.employee.model.vo.Employee;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
  private BoardService bs;
  
  public BoardController(BoardService bs) {
    this.bs = bs;
  }
  
  @RequestMapping({"mainNotice.bo"})
  public String mainNotice(Model model) {
    List<Board> boardList = this.bs.selectmainNotice();
    model.addAttribute("boardList", boardList);
    return "main/main";
  }
  
  @RequestMapping({"notice.bo"})
  public String showNoticeList(Model model, @RequestParam(defaultValue = "1") int page) {
    Board board = new Board();
    board.setBoard_type_code(1);
    int listCount = this.bs.getBoardListCount(board);
    int limit = 10;
    PageInfo pi = Pagination.getPageInfo(page, listCount, limit);
    Map<String, Object> map = new HashMap();
    map.put("board", board);
    map.put("pi", pi);
    List<Board> boardList = this.bs.selectBoardList(map);
    model.addAttribute("boardList", boardList);
    model.addAttribute("pi", pi);
    return "board/notice/noticeList";
  }
  
  @RequestMapping({"noticeWrite.bo"})
  public String noticeWrite(Model model, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam(defaultValue = "0") int board_no) {
    Employee emp = (Employee)session.getAttribute("loginEmp");
    String page = "";
    if (emp == null)
      return "redirect:/signinForm.em"; 
    if (emp.getEmp_level_code() == 1) {
      if (board_no > 0) {
        Board board = this.bs.selectBoardDetail(board_no);
        model.addAttribute("board", board);
      } 
      page = "board/notice/noticeForm";
    } else {
      redirectAttributes.addAttribute("type", Integer.valueOf(2));
      page = "redirect:/error";
    } 
    return page;
  }
  
  @RequestMapping({"boardInsert.bo"})
  public String boardInsert(Model model, HttpSession session, Board board, HttpServletRequest request, RedirectAttributes redirectAttributes, @RequestParam(name = "newFile", required = false) MultipartFile newFile) {
    Employee emp = (Employee)session.getAttribute("loginEmp");
    String page = "";
    int result = 0;
    if (emp == null)
      return "redirect:/signinForm.em"; 
    if (emp.getEmp_level_code() == 1) {
      board.setEmp_no(emp.getEmp_no());
      result = this.bs.boardInsert(board);
      String origin_name = newFile.getOriginalFilename();
      if (origin_name != null && !origin_name.equals("")) {
        Attachment attachment = new Attachment();
        String root = request.getSession().getServletContext().getRealPath("resources");
        String file_path = String.valueOf(root) + "\\uploadFiles";
        if (board.getBoard_type_code() == 1)
          file_path = String.valueOf(file_path) + "\\noticeFile"; 
        String ext = origin_name.substring(origin_name.lastIndexOf("."));
        String change_name = ChangeFileName.getChangeFileName();
        attachment.setBoard_no(board.getBoard_no());
        attachment.setEmp_no(board.getEmp_no());
        attachment.setFile_path(file_path);
        attachment.setOrigin_name(origin_name);
        attachment.setChange_name(String.valueOf(change_name) + ext);
        try {
          newFile.transferTo(new File(String.valueOf(file_path) + "\\" + change_name + ext));
          this.bs.modyAttachment(attachment);
        } catch (IllegalStateException e) {
          e.printStackTrace();
          (new File(String.valueOf(file_path) + "\\" + change_name + ext)).delete();
        } catch (java.io.IOException e) {
    	  e.printStackTrace();
    	  (new File(String.valueOf(file_path) + "\\" + change_name + ext)).delete();
	    } 
      } 
      page = "redirect:/detailNotice.bo?board_no=" + board.getBoard_no();
    } else {
      redirectAttributes.addAttribute("type", Integer.valueOf(2));
      page = "redirect:/error";
    } 
    if (result <= 0)
      page = "redirect:/error"; 
    return page;
  }
  
  @RequestMapping({"detailNotice.bo"})
  public String detailNotice(Model model, int board_no) {
    Board board = this.bs.selectBoardDetail(board_no);
    model.addAttribute("board", board);
    return "board/notice/noticeDetail";
  }
  
  @RequestMapping({"deleteFile.bo"})
  public ModelAndView deleteFile(ModelAndView mav, HttpSession session, int file_no) {
    this.bs.deleteAttachment(file_no);
    mav.setViewName("jsonView");
    return mav;
  }
  
  @RequestMapping({"deleteBoard.bo"})
  public String deleteBoard(int board_no) {
    this.bs.deleteBoard(board_no);
    return "redirect:/notice.bo";
  }
  
  @RequestMapping({"downloadFile.bo"})
  public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    System.out.println(String.valueOf(request.getParameter("changeName")) + " : " + request.getParameter("originName"));
    try {
      FileDownload fileDown = new FileDownload();
      String root = request.getSession().getServletContext().getRealPath("resources");
      String file_path = String.valueOf(root) + "\\uploadFiles\\noticeFile";
      fileDown.filDown(request, response, String.valueOf(file_path) + "\\", request.getParameter("changeName"), request.getParameter("originName"));
    } catch (Exception e) {
      e.printStackTrace();
    } 
  }
}
