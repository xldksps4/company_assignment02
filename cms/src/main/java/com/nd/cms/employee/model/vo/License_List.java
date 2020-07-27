package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class License_List implements Serializable {
  private int license_list_code;
  
  private String license_list_name;
  
  public License_List() {}
  
  public License_List(int license_list_code, String license_list_name) {
    this.license_list_code = license_list_code;
    this.license_list_name = license_list_name;
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
  
  public String toString() {
    return "License_List [license_list_code=" + this.license_list_code + ", license_list_name=" + this.license_list_name + 
      "]";
  }
}
