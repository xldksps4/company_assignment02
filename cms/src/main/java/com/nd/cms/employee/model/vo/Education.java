package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Education implements Serializable {
  private int edu_no;
  
  private String edu_name;
  
  private String edu_institute_name;
  
  private String edu_start_date;
  
  private String edu_end_date;
  
  private int edu_status_code;
  
  private String edu_status_name;
  
  private int emp_no;
  
  public Education() {}
  
  public Education(int edu_no, String edu_name, String edu_institute_name, String edu_start_date, String edu_end_date, int edu_status_code, String edu_status_name, int emp_no) {
    this.edu_no = edu_no;
    this.edu_name = edu_name;
    this.edu_institute_name = edu_institute_name;
    this.edu_start_date = edu_start_date;
    this.edu_end_date = edu_end_date;
    this.edu_status_code = edu_status_code;
    this.edu_status_name = edu_status_name;
    this.emp_no = emp_no;
  }
  
  public int getEdu_no() {
    return this.edu_no;
  }
  
  public void setEdu_no(int edu_no) {
    this.edu_no = edu_no;
  }
  
  public String getEdu_name() {
    return this.edu_name;
  }
  
  public void setEdu_name(String edu_name) {
    this.edu_name = edu_name;
  }
  
  public String getEdu_institute_name() {
    return this.edu_institute_name;
  }
  
  public void setEdu_institute_name(String edu_institute_name) {
    this.edu_institute_name = edu_institute_name;
  }
  
  public String getEdu_start_date() {
    return this.edu_start_date;
  }
  
  public void setEdu_start_date(String edu_start_date) {
    this.edu_start_date = edu_start_date;
  }
  
  public String getEdu_end_date() {
    return this.edu_end_date;
  }
  
  public void setEdu_end_date(String edu_end_date) {
    this.edu_end_date = edu_end_date;
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
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String toString() {
    return "Education [edu_no=" + this.edu_no + ", edu_name=" + this.edu_name + ", edu_institute_name=" + this.edu_institute_name + 
      ", edu_start_date=" + this.edu_start_date + ", edu_end_date=" + this.edu_end_date + ", edu_status_code=" + 
      this.edu_status_code + ", edu_status_name=" + this.edu_status_name + ", emp_no=" + this.emp_no + "]";
  }
}
