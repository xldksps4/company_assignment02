package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Discharge implements Serializable {
  private int discharge_code;
  
  private String discharge_name;
  
  public Discharge() {}
  
  public Discharge(int discharge_code, String discharge_name) {
    this.discharge_code = discharge_code;
    this.discharge_name = discharge_name;
  }
  
  public int getDischarge_code() {
    return this.discharge_code;
  }
  
  public void setDischarge_code(int discharge_code) {
    this.discharge_code = discharge_code;
  }
  
  public String getDischarge_name() {
    return this.discharge_name;
  }
  
  public void setDischarge_name(String discharge_name) {
    this.discharge_name = discharge_name;
  }
  
  public String toString() {
    return "Discharge [discharge_code=" + this.discharge_code + "]";
  }
}
