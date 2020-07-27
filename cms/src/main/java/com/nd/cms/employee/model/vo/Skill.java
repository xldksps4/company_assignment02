package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Skill implements Serializable {
  private int skill_code;
  
  private int skill_type_code;
  
  private String skill_type_name;
  
  private String skill_name;
  
  public Skill() {}
  
  public Skill(int skill_code, int skill_type_code, String skill_type_name, String skill_name) {
    this.skill_code = skill_code;
    this.skill_type_code = skill_type_code;
    this.skill_type_name = skill_type_name;
    this.skill_name = skill_name;
  }
  
  public int getSkill_code() {
    return this.skill_code;
  }
  
  public void setSkill_code(int skill_code) {
    this.skill_code = skill_code;
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
  
  public String getSkill_name() {
    return this.skill_name;
  }
  
  public void setSkill_name(String skill_name) {
    this.skill_name = skill_name;
  }
  
  public String toString() {
    return "Skill [skill_code=" + this.skill_code + ", skill_type_code=" + this.skill_type_code + ", skill_type_name=" + 
      this.skill_type_name + ", skill_name=" + this.skill_name + "]";
  }
}
