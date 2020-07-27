package com.nd.cms.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ErrorPage {
  @RequestMapping({"error"})
  public String errorPage(Model model, @RequestParam(name = "type", defaultValue = "0") int type) {
    String url = "";
    String msg = "";
    String btn = "";
    switch (type) {
      case 1:
        url = "signinForm.em";
        msg = "회원가입 승인 여부 중입니다.";
        btn = "로그인 페이지로 이동";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 2:
        url = "index.jsp";
        msg = "접근 권한이 없습니다.";
        btn = "메인 페이지로 이동";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 3:
        url = "index.jsp";
        msg = "잘못된 경로로 접근하였니다.";
        btn = "메인 페이지로 이동";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 4:
        url = "signinForm.em";
        msg = "로그인이 필요한 기능입니다.";
        btn = "로그인 페이지로 이동";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
    } 
    url = "index.jsp";
    msg = "알 수 없는 에러가 발생했습니다.";
    btn = "메인 페이지로 이동";
    model.addAttribute("url", url);
    model.addAttribute("msg", msg);
    model.addAttribute("btn", btn);
    return "error/errorPage";
  }
}
