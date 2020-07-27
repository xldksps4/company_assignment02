package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Degree implements Serializable {
  private int degree_code;
  
  private String degree_name;
  
  public Degree() {}
  
  public Degree(int degree_code, String degree_name) {
    this.degree_code = degree_code;
    this.degree_name = degree_name;
  }
  
  public int getDegree_code() {
    return this.degree_code;
  }
  
  public void setDegree_code(int degree_code) {
    this.degree_code = degree_code;
  }
  
  public String getDegree_name() {
    return this.degree_name;
  }
  
  public void setDegree_name(String degree_name) {
    this.degree_name = degree_name;
  }
  
  public String toString() {
    return "Degree [degree_code=" + this.degree_code + ", degree_name=" + this.degree_name + "]";
  }
}
