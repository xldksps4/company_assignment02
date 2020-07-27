package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Emp_Skill implements Serializable {
  private int emp_skill_no;
  
  private int skill_code;
  
  private String skill_name;
  
  private int skill_type_code;
  
  private String skill_type_name;
  
  private int keyword_code;
  
  private String keyword_name;
  
  private String etc;
  
  private int emp_no;
  
  public Emp_Skill() {}
  
  public Emp_Skill(int emp_skill_no, int skill_code, String skill_name, int skill_type_code, String skill_type_name, int keyword_code, String keyword_name, String etc, int emp_no) {
    this.emp_skill_no = emp_skill_no;
    this.skill_code = skill_code;
    this.skill_name = skill_name;
    this.skill_type_code = skill_type_code;
    this.skill_type_name = skill_type_name;
    this.keyword_code = keyword_code;
    this.keyword_name = keyword_name;
    this.etc = etc;
    this.emp_no = emp_no;
  }
  
  public int getEmp_skill_no() {
    return this.emp_skill_no;
  }
  
  public void setEmp_skill_no(int emp_skill_no) {
    this.emp_skill_no = emp_skill_no;
  }
  
  public int getSkill_code() {
    return this.skill_code;
  }
  
  public void setSkill_code(int skill_code) {
    this.skill_code = skill_code;
  }
  
  public String getSkill_name() {
    return this.skill_name;
  }
  
  public void setSkill_name(String skill_name) {
    this.skill_name = skill_name;
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
  
  public int getKeyword_code() {
    return this.keyword_code;
  }
  
  public void setKeyword_code(int keyword_code) {
    this.keyword_code = keyword_code;
  }
  
  public String getKeyword_name() {
    return this.keyword_name;
  }
  
  public void setKeyword_name(String keyword_name) {
    this.keyword_name = keyword_name;
  }
  
  public String getEtc() {
    return this.etc;
  }
  
  public void setEtc(String etc) {
    this.etc = etc;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String toString() {
    return "Emp_Skill [emp_skill_no=" + this.emp_skill_no + ", skill_code=" + this.skill_code + ", skill_name=" + this.skill_name + 
      ", skill_type_code=" + this.skill_type_code + ", skill_type_name=" + this.skill_type_name + ", keyword_code=" + 
      this.keyword_code + ", keyword_name=" + this.keyword_name + ", etc=" + this.etc + ", emp_no=" + this.emp_no + "]";
  }
}
