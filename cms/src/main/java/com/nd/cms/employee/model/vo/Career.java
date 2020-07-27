package com.nd.cms.employee.model.vo;

import java.io.Serializable;
import java.util.List;

public class Career implements Serializable {
  private int career_no;
  
  private String company_name;
  
  private String position;
  
  private String hire_date;
  
  private String resignation_date;
  
  private int emp_no;
  
  private List<Project> projectList;
  
  public Career() {}
  
  public Career(int career_no, String company_name, String position, String hire_date, String resignation_date, int emp_no, List<Project> projectList) {
    this.career_no = career_no;
    this.company_name = company_name;
    this.position = position;
    this.hire_date = hire_date;
    this.resignation_date = resignation_date;
    this.emp_no = emp_no;
    this.projectList = projectList;
  }
  
  public int getCareer_no() {
    return this.career_no;
  }
  
  public void setCareer_no(int career_no) {
    this.career_no = career_no;
  }
  
  public String getCompany_name() {
    return this.company_name;
  }
  
  public void setCompany_name(String company_name) {
    this.company_name = company_name;
  }
  
  public String getPosition() {
    return this.position;
  }
  
  public void setPosition(String position) {
    this.position = position;
  }
  
  public String getHire_date() {
    return this.hire_date;
  }
  
  public void setHire_date(String hire_date) {
    this.hire_date = hire_date;
  }
  
  public String getResignation_date() {
    return this.resignation_date;
  }
  
  public void setResignation_date(String resignation_date) {
    this.resignation_date = resignation_date;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public List<Project> getProjectList() {
    return this.projectList;
  }
  
  public void setProjectList(List<Project> projectList) {
    this.projectList = projectList;
  }
  
  public String toString() {
    return "Career [career_no=" + this.career_no + ", company_name=" + this.company_name + ", position=" + this.position + 
      ", hire_date=" + this.hire_date + ", resignation_date=" + this.resignation_date + ", emp_no=" + this.emp_no + 
      ", projectList=" + this.projectList + "]";
  }
}
