package com.nd.cms.employee.model.vo;

import java.io.Serializable;
import java.util.List;

public class Search_Employee implements Serializable {
  private int emp_no;
  
  private String emp_name;
  
  private String skill_type_name;
  
  private String grade;
  
  private String skill;
  
  private String address;
  
  private String status;
  
  private int currentPage;
  
  private int limit;
  
  private String gender;
  
  private List<String> gradeList;
  
  private List<String> stateList;
  
  private List<String> dept_codeList;
  
  private List<String> skill_typeList;
  
  private List<String> licenseList;
  
  private List<String> skill_codeList;
  
  private List<String> keyword_codeList;
  
  private List<String> etc_list;
  
  public Search_Employee() {}
  
  public Search_Employee(int emp_no, String emp_name, String skill_type_name, String grade, String skill, String address, String status, int currentPage, int limit, String gender, List<String> gradeList, List<String> stateList, List<String> dept_codeList, List<String> skill_typeList, List<String> licenseList, List<String> skill_codeList, List<String> keyword_codeList, List<String> etc_list) {
    this.emp_no = emp_no;
    this.emp_name = emp_name;
    this.skill_type_name = skill_type_name;
    this.grade = grade;
    this.skill = skill;
    this.address = address;
    this.status = status;
    this.currentPage = currentPage;
    this.limit = limit;
    this.gender = gender;
    this.gradeList = gradeList;
    this.stateList = stateList;
    this.dept_codeList = dept_codeList;
    this.skill_typeList = skill_typeList;
    this.licenseList = licenseList;
    this.skill_codeList = skill_codeList;
    this.keyword_codeList = keyword_codeList;
    this.etc_list = etc_list;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String getEmp_name() {
    return this.emp_name;
  }
  
  public void setEmp_name(String emp_name) {
    this.emp_name = emp_name;
  }
  
  public String getSkill_type_name() {
    return this.skill_type_name;
  }
  
  public void setSkill_type_name(String skill_type_name) {
    this.skill_type_name = skill_type_name;
  }
  
  public String getGrade() {
    return this.grade;
  }
  
  public void setGrade(String grade) {
    this.grade = grade;
  }
  
  public String getSkill() {
    return this.skill;
  }
  
  public void setSkill(String skill) {
    this.skill = skill;
  }
  
  public String getAddress() {
    return this.address;
  }
  
  public void setAddress(String address) {
    this.address = address;
  }
  
  public String getStatus() {
    return this.status;
  }
  
  public void setStatus(String status) {
    this.status = status;
  }
  
  public int getCurrentPage() {
    return this.currentPage;
  }
  
  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }
  
  public int getLimit() {
    return this.limit;
  }
  
  public void setLimit(int limit) {
    this.limit = limit;
  }
  
  public String getGender() {
    return this.gender;
  }
  
  public void setGender(String gender) {
    this.gender = gender;
  }
  
  public List<String> getGradeList() {
    return this.gradeList;
  }
  
  public void setGradeList(List<String> gradeList) {
    this.gradeList = gradeList;
  }
  
  public List<String> getStateList() {
    return this.stateList;
  }
  
  public void setStateList(List<String> stateList) {
    this.stateList = stateList;
  }
  
  public List<String> getDept_codeList() {
    return this.dept_codeList;
  }
  
  public void setDept_codeList(List<String> dept_codeList) {
    this.dept_codeList = dept_codeList;
  }
  
  public List<String> getSkill_typeList() {
    return this.skill_typeList;
  }
  
  public void setSkill_typeList(List<String> skill_typeList) {
    this.skill_typeList = skill_typeList;
  }
  
  public List<String> getLicenseList() {
    return this.licenseList;
  }
  
  public void setLicenseList(List<String> licenseList) {
    this.licenseList = licenseList;
  }
  
  public List<String> getSkill_codeList() {
    return this.skill_codeList;
  }
  
  public void setSkill_codeList(List<String> skill_codeList) {
    this.skill_codeList = skill_codeList;
  }
  
  public List<String> getKeyword_codeList() {
    return this.keyword_codeList;
  }
  
  public void setKeyword_codeList(List<String> keyword_codeList) {
    this.keyword_codeList = keyword_codeList;
  }
  
  public List<String> getEtc_list() {
    return this.etc_list;
  }
  
  public void setEtc_list(List<String> etc_list) {
    this.etc_list = etc_list;
  }
  
  public String toString() {
    return "Search_Employee [emp_no=" + this.emp_no + ", emp_name=" + this.emp_name + ", skill_type_name=" + this.skill_type_name + 
      ", grade=" + this.grade + ", skill=" + this.skill + ", address=" + this.address + ", status=" + this.status + 
      ", currentPage=" + this.currentPage + ", limit=" + this.limit + ", gender=" + this.gender + ", gradeList=" + 
      this.gradeList + ", stateList=" + this.stateList + ", dept_codeList=" + this.dept_codeList + ", skill_typeList=" + 
      this.skill_typeList + ", licenseList=" + this.licenseList + ", skill_codeList=" + this.skill_codeList + 
      ", keyword_codeList=" + this.keyword_codeList + ", etc_list=" + this.etc_list + "]";
  }
}
