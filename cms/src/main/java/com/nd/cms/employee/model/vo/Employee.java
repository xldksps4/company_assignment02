package com.nd.cms.employee.model.vo;

import com.nd.cms.common.Attachment;
import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable {
  private int emp_no;
  
  private String emp_id;
  
  private String emp_pwd;
  
  private String emp_name;
  
  private String birth;
  
  private String gender;
  
  private String phone;
  
  private String email;
  
  private String address;
  
  private Date join_date;
  
  private Date withdraw_date;
  
  private String emp_status;
  
  private int dept_code;
  
  private String dept_name;
  
  private int emp_level_code;
  
  private String emp_level_name;
  
  private Attachment profileImg;
  
  private Login_History login;
  
  private Emp_Modify mody;
  
  private String school_name;
  
  private String major;
  
  private String grade;
  
  private String total_career;
  
  private String status;
  
  private String skill_name;
  
  private String keyword_name;
  
  private String etc;
  
  public Employee() {}
  
  public Employee(int emp_no, String emp_id, String emp_pwd, String emp_name, String birth, String gender, String phone, String email, String address, Date join_date, Date withdraw_date, String emp_status, int dept_code, String dept_name, int emp_level_code, String emp_level_name, Attachment profileImg, Login_History login, Emp_Modify mody, String school_name, String major, String grade, String total_career, String status, String skill_name, String keyword_name, String etc) {
    this.emp_no = emp_no;
    this.emp_id = emp_id;
    this.emp_pwd = emp_pwd;
    this.emp_name = emp_name;
    this.birth = birth;
    this.gender = gender;
    this.phone = phone;
    this.email = email;
    this.address = address;
    this.join_date = join_date;
    this.withdraw_date = withdraw_date;
    this.emp_status = emp_status;
    this.dept_code = dept_code;
    this.dept_name = dept_name;
    this.emp_level_code = emp_level_code;
    this.emp_level_name = emp_level_name;
    this.profileImg = profileImg;
    this.login = login;
    this.mody = mody;
    this.school_name = school_name;
    this.major = major;
    this.grade = grade;
    this.total_career = total_career;
    this.status = status;
    this.skill_name = skill_name;
    this.keyword_name = keyword_name;
    this.etc = etc;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String getEmp_id() {
    return this.emp_id;
  }
  
  public void setEmp_id(String emp_id) {
    this.emp_id = emp_id;
  }
  
  public String getEmp_pwd() {
    return this.emp_pwd;
  }
  
  public void setEmp_pwd(String emp_pwd) {
    this.emp_pwd = emp_pwd;
  }
  
  public String getEmp_name() {
    return this.emp_name;
  }
  
  public void setEmp_name(String emp_name) {
    this.emp_name = emp_name;
  }
  
  public String getBirth() {
    return this.birth;
  }
  
  public void setBirth(String birth) {
    this.birth = birth;
  }
  
  public String getGender() {
    return this.gender;
  }
  
  public void setGender(String gender) {
    this.gender = gender;
  }
  
  public String getPhone() {
    return this.phone;
  }
  
  public void setPhone(String phone) {
    this.phone = phone;
  }
  
  public String getEmail() {
    return this.email;
  }
  
  public void setEmail(String email) {
    this.email = email;
  }
  
  public String getAddress() {
    return this.address;
  }
  
  public void setAddress(String address) {
    this.address = address;
  }
  
  public Date getJoin_date() {
    return this.join_date;
  }
  
  public void setJoin_date(Date join_date) {
    this.join_date = join_date;
  }
  
  public Date getWithdraw_date() {
    return this.withdraw_date;
  }
  
  public void setWithdraw_date(Date withdraw_date) {
    this.withdraw_date = withdraw_date;
  }
  
  public String getEmp_status() {
    return this.emp_status;
  }
  
  public void setEmp_status(String emp_status) {
    this.emp_status = emp_status;
  }
  
  public int getDept_code() {
    return this.dept_code;
  }
  
  public void setDept_code(int dept_code) {
    this.dept_code = dept_code;
  }
  
  public String getDept_name() {
    return this.dept_name;
  }
  
  public void setDept_name(String dept_name) {
    this.dept_name = dept_name;
  }
  
  public int getEmp_level_code() {
    return this.emp_level_code;
  }
  
  public void setEmp_level_code(int emp_level_code) {
    this.emp_level_code = emp_level_code;
  }
  
  public String getEmp_level_name() {
    return this.emp_level_name;
  }
  
  public void setEmp_level_name(String emp_level_name) {
    this.emp_level_name = emp_level_name;
  }
  
  public Attachment getProfileImg() {
    return this.profileImg;
  }
  
  public void setProfileImg(Attachment profileImg) {
    this.profileImg = profileImg;
  }
  
  public Login_History getLogin() {
    return this.login;
  }
  
  public void setLogin(Login_History login) {
    this.login = login;
  }
  
  public Emp_Modify getMody() {
    return this.mody;
  }
  
  public void setMody(Emp_Modify mody) {
    this.mody = mody;
  }
  
  public String getSchool_name() {
    return this.school_name;
  }
  
  public void setSchool_name(String school_name) {
    this.school_name = school_name;
  }
  
  public String getMajor() {
    return this.major;
  }
  
  public void setMajor(String major) {
    this.major = major;
  }
  
  public String getGrade() {
    return this.grade;
  }
  
  public void setGrade(String grade) {
    this.grade = grade;
  }
  
  public String getTotal_career() {
    return this.total_career;
  }
  
  public void setTotal_career(String total_career) {
    this.total_career = total_career;
  }
  
  public String getStatus() {
    return this.status;
  }
  
  public void setStatus(String status) {
    this.status = status;
  }
  
  public String getSkill_name() {
    return this.skill_name;
  }
  
  public void setSkill_name(String skill_name) {
    this.skill_name = skill_name;
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
  
  public String toString() {
    return "Employee [emp_no=" + this.emp_no + ", emp_id=" + this.emp_id + ", emp_pwd=" + this.emp_pwd + ", emp_name=" + this.emp_name + 
      ", birth=" + this.birth + ", gender=" + this.gender + ", phone=" + this.phone + ", email=" + this.email + ", address=" + 
      this.address + ", join_date=" + this.join_date + ", withdraw_date=" + this.withdraw_date + ", emp_status=" + 
      this.emp_status + ", dept_code=" + this.dept_code + ", dept_name=" + this.dept_name + ", emp_level_code=" + 
      this.emp_level_code + ", emp_level_name=" + this.emp_level_name + ", profileImg=" + this.profileImg + ", login=" + 
      this.login + ", mody=" + this.mody + ", school_name=" + this.school_name + ", major=" + this.major + ", grade=" + this.grade + 
      ", total_career=" + this.total_career + ", status=" + this.status + ", skill_name=" + this.skill_name + 
      ", keyword_name=" + this.keyword_name + ", etc=" + this.etc + "]";
  }
}
