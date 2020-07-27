package com.nd.cms.common;

import java.io.Serializable;
import java.util.Date;

public class Attachment implements Serializable {
  private int file_no;
  
  private String origin_name;
  
  private String change_name;
  
  private String file_path;
  
  private String file_status;
  
  private Date upload_date;
  
  private int board_no;
  
  private int emp_no;
  
  public Attachment() {}
  
  public Attachment(int file_no, String origin_name, String change_name, String file_path, String file_status, Date upload_date, int board_no, int emp_no) {
    this.file_no = file_no;
    this.origin_name = origin_name;
    this.change_name = change_name;
    this.file_path = file_path;
    this.file_status = file_status;
    this.upload_date = upload_date;
    this.board_no = board_no;
    this.emp_no = emp_no;
  }
  
  public int getFile_no() {
    return this.file_no;
  }
  
  public void setFile_no(int file_no) {
    this.file_no = file_no;
  }
  
  public String getOrigin_name() {
    return this.origin_name;
  }
  
  public void setOrigin_name(String origin_name) {
    this.origin_name = origin_name;
  }
  
  public String getChange_name() {
    return this.change_name;
  }
  
  public void setChange_name(String change_name) {
    this.change_name = change_name;
  }
  
  public String getFile_path() {
    return this.file_path;
  }
  
  public void setFile_path(String file_path) {
    this.file_path = file_path;
  }
  
  public String getFile_status() {
    return this.file_status;
  }
  
  public void setFile_status(String file_status) {
    this.file_status = file_status;
  }
  
  public Date getUpload_date() {
    return this.upload_date;
  }
  
  public void setUpload_date(Date upload_date) {
    this.upload_date = upload_date;
  }
  
  public int getBoard_no() {
    return this.board_no;
  }
  
  public void setBoard_no(int board_no) {
    this.board_no = board_no;
  }
  
  public int getEmp_no() {
    return this.emp_no;
  }
  
  public void setEmp_no(int emp_no) {
    this.emp_no = emp_no;
  }
  
  public String toString() {
    return "Attachment [file_no=" + this.file_no + ", origin_name=" + this.origin_name + ", change_name=" + this.change_name + 
      ", file_path=" + this.file_path + ", file_status=" + this.file_status + ", upload_date=" + this.upload_date + 
      ", board_no=" + this.board_no + ", emp_no=" + this.emp_no + "]";
  }
}
