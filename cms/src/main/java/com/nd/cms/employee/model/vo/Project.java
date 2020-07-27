package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Project implements Serializable {
  private int project_no;
  
  private int career_num;
  
  private String project_name;
  
  private String start_date;
  
  private String end_date;
  
  private String client;
  
  private String workplace;
  
  private String part;
  
  private String os;
  
  private String language;
  
  private String db;
  
  private String tool;
  
  private String was;
  
  private String etc;
  
  public Project() {}
  
  public Project(int project_no, int career_num, String project_name, String start_date, String end_date, String client, String workplace, String part, String os, String language, String db, String tool, String was, String etc) {
    this.project_no = project_no;
    this.career_num = career_num;
    this.project_name = project_name;
    this.start_date = start_date;
    this.end_date = end_date;
    this.client = client;
    this.workplace = workplace;
    this.part = part;
    this.os = os;
    this.language = language;
    this.db = db;
    this.tool = tool;
    this.was = was;
    this.etc = etc;
  }
  
  public int getProject_no() {
    return this.project_no;
  }
  
  public void setProject_no(int project_no) {
    this.project_no = project_no;
  }
  
  public int getCareer_num() {
    return this.career_num;
  }
  
  public void setCareer_num(int career_num) {
    this.career_num = career_num;
  }
  
  public String getProject_name() {
    return this.project_name;
  }
  
  public void setProject_name(String project_name) {
    this.project_name = project_name;
  }
  
  public String getStart_date() {
    return this.start_date;
  }
  
  public void setStart_date(String start_date) {
    this.start_date = start_date;
  }
  
  public String getEnd_date() {
    return this.end_date;
  }
  
  public void setEnd_date(String end_date) {
    this.end_date = end_date;
  }
  
  public String getClient() {
    return this.client;
  }
  
  public void setClient(String client) {
    this.client = client;
  }
  
  public String getWorkplace() {
    return this.workplace;
  }
  
  public void setWorkplace(String workplace) {
    this.workplace = workplace;
  }
  
  public String getPart() {
    return this.part;
  }
  
  public void setPart(String part) {
    this.part = part;
  }
  
  public String getOs() {
    return this.os;
  }
  
  public void setOs(String os) {
    this.os = os;
  }
  
  public String getLanguage() {
    return this.language;
  }
  
  public void setLanguage(String language) {
    this.language = language;
  }
  
  public String getDb() {
    return this.db;
  }
  
  public void setDb(String db) {
    this.db = db;
  }
  
  public String getTool() {
    return this.tool;
  }
  
  public void setTool(String tool) {
    this.tool = tool;
  }
  
  public String getWas() {
    return this.was;
  }
  
  public void setWas(String was) {
    this.was = was;
  }
  
  public String getEtc() {
    return this.etc;
  }
  
  public void setEtc(String etc) {
    this.etc = etc;
  }
  
  public String toString() {
    return "Project [project_no=" + this.project_no + ", career_num=" + this.career_num + ", project_name=" + this.project_name + 
      ", start_date=" + this.start_date + ", end_date=" + this.end_date + ", client=" + this.client + ", workplace=" + 
      this.workplace + ", part=" + this.part + ", os=" + this.os + ", language=" + this.language + ", db=" + this.db + ", tool=" + 
      this.tool + ", was=" + this.was + ", etc=" + this.etc + "]";
  }
}
