package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class License implements Serializable {
  private int license_no;
  
  private int license_list_code;
  
  private String license_list_name;
  
  private String acquisition_date;
  
  private int emp_no;
  
  public License() {}
  
  public License(int license_no, int license_list_code, String license_list_name, String acquisition_date, int emp_no) {
    this.license_no = license_no;
    this.license_list_code = license_list_code;
    this.license_list_name = license_list_name;
    this.acquisition_date = acquisition_date;
    this.emp_no = emp_no;
  }
  
  public int getLicense_no() {
    return this.license_no;
  }
  
  public void setLicense_no(int license_no) {
    this.license_no = license_no;
  }
  
  public int getLicense_list_code() {
    return this.license_list_code;
  }
  
  public void setLicense_list_code(int license_list_code) {
    this.license_list_code = license_list_code;
  }
  
  public String getLicense_list_name() {
    return this.license_list_name;
  }
  
  public void setLicense_list_name(String license_list_name) {
    this.license_list_name = license_list_name;
  }
  
  public String getAcquisition_date() {
    return this.acquisition_date;
  }
  
  public void setAcquisition_date(String acquisition_date) {
    this.acquisition_date = acquisition_date;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String toString() {
    return "License [license_no=" + this.license_no + ", license_list_code=" + this.license_list_code + ", license_list_name=" + 
      this.license_list_name + ", acquisition_date=" + this.acquisition_date + ", emp_no=" + this.emp_no + "]";
  }
}
