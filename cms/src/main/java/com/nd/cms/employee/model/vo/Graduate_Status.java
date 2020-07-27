package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Graduate_Status implements Serializable {
  private int graduate_status_code;
  
  private String graduate_status_name;
  
  public Graduate_Status() {}
  
  public Graduate_Status(int graduate_status_code, String graduate_status_name) {
    this.graduate_status_code = graduate_status_code;
    this.graduate_status_name = graduate_status_name;
  }
  
  public int getGraduate_status_code() {
    return this.graduate_status_code;
  }
  
  public void setGraduate_status_code(int graduate_status_code) {
    this.graduate_status_code = graduate_status_code;
  }
  
  public String getGraduate_status_name() {
    return this.graduate_status_name;
  }
  
  public void setGraduate_status_name(String graduate_status_name) {
    this.graduate_status_name = graduate_status_name;
  }
  
  public String toString() {
    return "Graduate_Status [graduate_status_code=" + this.graduate_status_code + ", graduate_status_name=" + 
      this.graduate_status_name + "]";
  }
}
