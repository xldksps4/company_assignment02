package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class School implements Serializable {
  private int school_no;
  
  private String school_name;
  
  private String major;
  
  private String admission_date;
  
  private String graduate_date;
  
  private int graduate_status_code;
  
  private String graduate_status_name;
  
  private int degree_code;
  
  private String degree_name;
  
  private int emp_no;
  
  private String school_status;
  
  public School() {}
  
  public School(int school_no, String school_name, String major, String admission_date, String graduate_date, int graduate_status_code, String graduate_status_name, int degree_code, String degree_name, int emp_no, String school_status) {
    this.school_no = school_no;
    this.school_name = school_name;
    this.major = major;
    this.admission_date = admission_date;
    this.graduate_date = graduate_date;
    this.graduate_status_code = graduate_status_code;
    this.graduate_status_name = graduate_status_name;
    this.degree_code = degree_code;
    this.degree_name = degree_name;
    this.emp_no = emp_no;
    this.school_status = school_status;
  }
  
  public int getSchool_no() {
    return this.school_no;
  }
  
  public void setSchool_no(int school_no) {
    this.school_no = school_no;
  }
  
  public String getSchool_name() {
    return this.school_name;
  }
  
  public void setSchool_name(String school_name) {
    this.school_name = school_name;
  }
  
  public String getMajor() {
    return this.major;
  }
  
  public void setMajor(String major) {
    this.major = major;
  }
  
  public String getAdmission_date() {
    return this.admission_date;
  }
  
  public void setAdmission_date(String admission_date) {
    this.admission_date = admission_date;
  }
  
  public String getGraduate_date() {
    return this.graduate_date;
  }
  
  public void setGraduate_date(String graduate_date) {
    this.graduate_date = graduate_date;
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
  
  public int getDegree_code() {
    return this.degree_code;
  }
  
  public void setDegree_code(int degree_code) {
    this.degree_code = degree_code;
  }
  
  public String getDegree_name() {
    return this.degree_name;
  }
  
  public void setDegree_name(String degree_name) {
    this.degree_name = degree_name;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String getSchool_status() {
    return this.school_status;
  }
  
  public void setSchool_status(String school_status) {
    this.school_status = school_status;
  }
  
  public String toString() {
    return "School [school_no=" + this.school_no + ", school_name=" + this.school_name + ", major=" + this.major + 
      ", admission_date=" + this.admission_date + ", graduate_date=" + this.graduate_date + ", graduate_status_code=" + 
      this.graduate_status_code + ", graduate_status_name=" + this.graduate_status_name + ", degree_code=" + 
      this.degree_code + ", degree_name=" + this.degree_name + ", emp_no=" + this.emp_no + ", school_status=" + 
      this.school_status + "]";
  }
}
