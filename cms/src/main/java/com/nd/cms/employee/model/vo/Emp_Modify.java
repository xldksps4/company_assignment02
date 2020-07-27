package com.nd.cms.employee.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Emp_Modify implements Serializable {
  private int emp_modify_no;
  
  private int emp_no;
  
  private Date emp_modify_date;
  
  public Emp_Modify() {}
  
  public Emp_Modify(int emp_modify_no, int emp_no, Date emp_modify_date) {
    this.emp_modify_no = emp_modify_no;
    this.emp_no = emp_no;
    this.emp_modify_date = emp_modify_date;
  }
  
  public int getEmp_modify_no() {
    return this.emp_modify_no;
  }
  
  public void setEmp_modify_no(int emp_modify_no) {
    this.emp_modify_no = emp_modify_no;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public Date getEmp_modify_date() {
    return this.emp_modify_date;
  }
  
  public void setEmp_modify_date(Date emp_modify_date) {
    this.emp_modify_date = emp_modify_date;
  }
  
  public String toString() {
    return "Emp_Modify [emp_modify_no=" + this.emp_modify_no + ", emp_no=" + this.emp_no + ", emp_modify_date=" + 
      this.emp_modify_date + "]";
  }
}
