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
        msg = "ȸ������ ���� ���� ���Դϴ�.";
        btn = "�α��� �������� �̵�";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 2:
        url = "index.jsp";
        msg = "���� ������ �����ϴ�.";
        btn = "���� �������� �̵�";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 3:
        url = "index.jsp";
        msg = "�߸��� ��η� �����Ͽ��ϴ�.";
        btn = "���� �������� �̵�";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
      case 4:
        url = "signinForm.em";
        msg = "�α����� �ʿ��� ����Դϴ�.";
        btn = "�α��� �������� �̵�";
        model.addAttribute("url", url);
        model.addAttribute("msg", msg);
        model.addAttribute("btn", btn);
        return "error/errorPage";
    } 
    url = "index.jsp";
    msg = "�� �� ���� ������ �߻��߽��ϴ�.";
    btn = "���� �������� �̵�";
    model.addAttribute("url", url);
    model.addAttribute("msg", msg);
    model.addAttribute("btn", btn);
    return "error/errorPage";
  }
}
