package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Keyword implements Serializable {
  private int keyword_code;
  
  private String keyword_name;
  
  public Keyword() {}
  
  public Keyword(int keyword_code, String keyword_name) {
    this.keyword_code = keyword_code;
    this.keyword_name = keyword_name;
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
  
  public String toString() {
    return "Keyword [keyword_code=" + this.keyword_code + ", keyword_name=" + this.keyword_name + "]";
  }
}
