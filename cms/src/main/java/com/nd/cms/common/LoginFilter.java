package com.nd.cms.common;

import com.nd.cms.employee.model.vo.Employee;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginFilter implements Filter {
  private static final Logger logger = LoggerFactory.getLogger(LoginFilter.class);
  
  public void destroy() {}
  
  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest)req;
    HttpServletResponse response = (HttpServletResponse)resp;
    Employee loginEmp = (Employee)request.getSession().getAttribute("loginEmp");
    String uri = ((HttpServletRequest)req).getRequestURI();
    if ((uri.contains("/sign") || uri.contains("/find")) && loginEmp != null && 
      loginEmp.getEmp_level_code() != 1)
      req.getRequestDispatcher("index.jsp").forward(req, resp); 
    if (loginEmp == null && uri.contains(".ma"))
      req.getRequestDispatcher("index.jsp").forward(req, resp); 
    chain.doFilter(req, resp);
  }
  
  public void init(FilterConfig arg0) throws ServletException {}
}
