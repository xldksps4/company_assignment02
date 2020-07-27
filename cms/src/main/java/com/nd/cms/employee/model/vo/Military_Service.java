package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Military_Service implements Serializable {
  private int military_service_code;
  
  private String military_service_name;
  
  public Military_Service() {}
  
  public Military_Service(int military_service_code, String military_service_name) {
    this.military_service_code = military_service_code;
    this.military_service_name = military_service_name;
  }
  
  public int getMilitary_service_code() {
    return this.military_service_code;
  }
  
  public void setMilitary_service_code(int military_service_code) {
    this.military_service_code = military_service_code;
  }
  
  public String getMilitary_service_name() {
    return this.military_service_name;
  }
  
  public void setMilitary_service_name(String military_service_name) {
    this.military_service_name = military_service_name;
  }
  
  public String toString() {
    return "Military_Service [military_service_code=" + this.military_service_code + ", military_service_name=" + 
      this.military_service_name + "]";
  }
}
