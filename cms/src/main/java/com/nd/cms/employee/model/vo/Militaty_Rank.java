package com.nd.cms.employee.model.vo;

import java.io.Serializable;

public class Militaty_Rank implements Serializable {
  private int military_rank_code;
  
  private String military_rank_name;
  
  public Militaty_Rank() {}
  
  public Militaty_Rank(int military_rank_code, String military_rank_name) {
    this.military_rank_code = military_rank_code;
    this.military_rank_name = military_rank_name;
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
  
  public String toString() {
    return "Militaty_Rank [military_rank_code=" + this.military_rank_code + ", military_rank_name=" + this.military_rank_name + 
      "]";
  }
}
