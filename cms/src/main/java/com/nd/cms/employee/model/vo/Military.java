package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Military implements Serializable {
  private int military_no;
  
  private int military_service_code;
  
  private String military_service_name;
  
  private String enroll_date;
  
  private String discharge_date;
  
  private int military_group_code;
  
  private String military_group_name;
  
  private int military_rank_code;
  
  private String military_rank_name;
  
  private int discharge_code;
  
  private String discharge_name;
  
  private int emp_no;
  
  public Military() {}
  
  public Military(int military_no, int military_service_code, String military_service_name, String enroll_date, String discharge_date, int military_group_code, String military_group_name, int military_rank_code, String military_rank_name, int discharge_code, String discharge_name, int emp_no) {
    this.military_no = military_no;
    this.military_service_code = military_service_code;
    this.military_service_name = military_service_name;
    this.enroll_date = enroll_date;
    this.discharge_date = discharge_date;
    this.military_group_code = military_group_code;
    this.military_group_name = military_group_name;
    this.military_rank_code = military_rank_code;
    this.military_rank_name = military_rank_name;
    this.discharge_code = discharge_code;
    this.discharge_name = discharge_name;
    this.emp_no = emp_no;
  }
  
  public int getMilitary_no() {
    return this.military_no;
  }
  
  public void setMilitary_no(int military_no) {
    this.military_no = military_no;
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
  
  public String getEnroll_date() {
    return this.enroll_date;
  }
  
  public void setEnroll_date(String enroll_date) {
    this.enroll_date = enroll_date;
  }
  
  public String getDischarge_date() {
    return this.discharge_date;
  }
  
  public void setDischarge_date(String discharge_date) {
    this.discharge_date = discharge_date;
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
  
  public int getMilitary_rank_code() {
    return this.military_rank_code;
  }
  
  public void setMilitary_rank_code(int military_rank_code) {
    this.military_rank_code = military_rank_code;
  }
  
  public String getMilitary_rank_name() {
    return this.military_rank_name;
  }
  
  public void setMilitary_rank_name(String military_rank_name) {
    this.military_rank_name = military_rank_name;
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
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String toString() {
    return "Military [military_no=" + this.military_no + ", military_service_code=" + this.military_service_code + 
      ", military_service_name=" + this.military_service_name + ", enroll_date=" + this.enroll_date + 
      ", discharge_date=" + this.discharge_date + ", military_group_code=" + this.military_group_code + 
      ", military_group_name=" + this.military_group_name + ", military_rank_code=" + this.military_rank_code + 
      ", military_rank_name=" + this.military_rank_name + ", discharge_code=" + this.discharge_code + 
      ", discharge_name=" + this.discharge_name + ", emp_no=" + this.emp_no + "]";
  }
}
