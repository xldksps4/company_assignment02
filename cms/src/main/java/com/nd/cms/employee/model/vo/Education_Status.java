package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Education_Status implements Serializable {
  private int edu_status_code;
  
  private String edu_status_name;
  
  public Education_Status() {}
  
  public Education_Status(int edu_status_code, String edu_status_name) {
    this.edu_status_code = edu_status_code;
    this.edu_status_name = edu_status_name;
  }
  
  public int getEdu_status_code() {
    return this.edu_status_code;
  }
  
  public void setEdu_status_code(int edu_status_code) {
    this.edu_status_code = edu_status_code;
  }
  
  public String getEdu_status_name() {
    return this.edu_status_name;
  }
  
  public void setEdu_status_name(String edu_status_name) {
    this.edu_status_name = edu_status_name;
  }
  
  public String toString() {
    return "Education_Status [edu_status_code=" + this.edu_status_code + ", edu_status_name=" + this.edu_status_name + "]";
  }
}
