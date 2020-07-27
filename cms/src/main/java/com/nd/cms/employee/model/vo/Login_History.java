package com.nd.cms.employee.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Login_History implements Serializable {
  private int login_history_no;
  
  private int emp_no;
  
  private Date login_date;
  
  private String login_ip;
  
  public Login_History() {}
  
  public Login_History(int login_history_no, int emp_no, Date login_date, String login_ip) {
    this.login_history_no = login_history_no;
    this.emp_no = emp_no;
    this.login_date = login_date;
    this.login_ip = login_ip;
  }
  
  public int getLogin_history_no() {
    return this.login_history_no;
  }
  
  public void setLogin_history_no(int login_history_no) {
    this.login_history_no = login_history_no;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public Date getLogin_date() {
    return this.login_date;
  }
  
  public void setLogin_date(Date login_date) {
    this.login_date = login_date;
  }
  
  public String getLogin_ip() {
    return this.login_ip;
  }
  
  public void setLogin_ip(String login_ip) {
    this.login_ip = login_ip;
  }
  
  public String toString() {
    return "Login_History [login_history_no=" + this.login_history_no + ", emp_no=" + this.emp_no + ", login_date=" + 
      this.login_date + ", login_ip=" + this.login_ip + "]";
  }
}
