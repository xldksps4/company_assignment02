package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Department implements Serializable {
  private int dept_code;
  
  private String dept_name;
  
  public Department() {}
  
  public Department(int dept_code, String dept_name) {
    this.dept_code = dept_code;
    this.dept_name = dept_name;
  }
  
  public int getDept_code() {
    return this.dept_code;
  }
  
  public void setDept_code(int dept_code) {
    this.dept_code = dept_code;
  }
  
  public String getDept_name() {
    return this.dept_name;
  }
  
  public void setDept_name(String dept_name) {
    this.dept_name = dept_name;
  }
  
  public String toString() {
    return "Department [dept_code=" + this.dept_code + ", dept_name=" + this.dept_name + "]";
  }
}
