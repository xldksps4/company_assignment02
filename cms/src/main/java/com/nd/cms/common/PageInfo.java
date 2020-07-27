package com.nd.cms.common;

import java.io.Serializable;

public class PageInfo implements Serializable {
  private int currentPage;
  
  private int listCount;
  
  private int limit;
  
  private int maxPage;
  
  private int startPage;
  
  private int endPage;
  
  private int limitStart;
  
  private boolean prev;
  
  private boolean next;
  
  public PageInfo() {}
  
  public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage, int limitStart, boolean prev, boolean next) {
    this.currentPage = currentPage;
    this.listCount = listCount;
    this.limit = limit;
    this.maxPage = maxPage;
    this.startPage = startPage;
    this.endPage = endPage;
    this.limitStart = limitStart;
    this.prev = prev;
    this.next = next;
  }
  
  public int getCurrentPage() {
    return this.currentPage;
  }
  
  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }
  
  public int getListCount() {
    return this.listCount;
  }
  
  public void setListCount(int listCount) {
    this.listCount = listCount;
  }
  
  public int getLimit() {
    return this.limit;
  }
  
  public void setLimit(int limit) {
    this.limit = limit;
  }
  
  public int getMaxPage() {
    return this.maxPage;
  }
  
  public void setMaxPage(int maxPage) {
    this.maxPage = maxPage;
  }
  
  public int getStartPage() {
    return this.startPage;
  }
  
  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }
  
  public int getEndPage() {
    return this.endPage;
  }
  
  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }
  
  public int getLimitStart() {
    return this.limitStart;
  }
  
  public void setLimitStart(int limitStart) {
    this.limitStart = limitStart;
  }
  
  public boolean isPrev() {
    return this.prev;
  }
  
  public void setPrev(boolean prev) {
    this.prev = prev;
  }
  
  public boolean isNext() {
    return this.next;
  }
  
  public void setNext(boolean next) {
    this.next = next;
  }
  
  public String toString() {
    return "PageInfo [currentPage=" + this.currentPage + ", listCount=" + this.listCount + ", limit=" + this.limit + ", maxPage=" + 
      this.maxPage + ", startPage=" + this.startPage + ", endPage=" + this.endPage + ", limitStart=" + this.limitStart + 
      ", prev=" + this.prev + ", next=" + this.next + "]";
  }
}
