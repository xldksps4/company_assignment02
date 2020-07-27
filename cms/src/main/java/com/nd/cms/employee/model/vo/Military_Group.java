package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Military_Group implements Serializable {
  private int military_group_code;
  
  private String military_group_name;
  
  public Military_Group() {}
  
  public Military_Group(int military_group_code, String military_group_name) {
    this.military_group_code = military_group_code;
    this.military_group_name = military_group_name;
  }
  
  public int getMilitary_group_code() {
    return this.military_group_code;
  }
  
  public void setMilitary_group_code(int military_group_code) {
    this.military_group_code = military_group_code;
  }
  
  public String getMilitary_group_name() {
    return this.military_group_name;
  }
  
  public void setMilitary_group_name(String military_group_name) {
    this.military_group_name = military_group_name;
  }
  
  public String toString() {
    return "Military_Group_Code [military_group_code=" + this.military_group_code + ", military_group_name=" + 
      this.military_group_name + "]";
  }
}
