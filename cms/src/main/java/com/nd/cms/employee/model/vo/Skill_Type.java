package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Skill_Type implements Serializable {
  private int skill_type_code;
  
  private String skill_type_name;
  
  public Skill_Type() {}
  
  public Skill_Type(int skill_type_code, String skill_type_name) {
    this.skill_type_code = skill_type_code;
    this.skill_type_name = skill_type_name;
  }
  
  public int getSkill_type_code() {
    return this.skill_type_code;
  }
  
  public void setSkill_type_code(int skill_type_code) {
    this.skill_type_code = skill_type_code;
  }
  
  public String getSkill_type_name() {
    return this.skill_type_name;
  }
  
  public void setSkill_type_name(String skill_type_name) {
    this.skill_type_name = skill_type_name;
  }
  
  public String toString() {
    return "Skill_Type [skill_type_code=" + this.skill_type_code + ", skill_type_name=" + this.skill_type_name + "]";
  }
}
