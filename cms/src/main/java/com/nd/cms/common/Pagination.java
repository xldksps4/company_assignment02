package com.nd.cms.common;

public class Pagination {
  public static PageInfo getPageInfo(int currentPage, int listCount, int limit) {
    PageInfo pi = null;
    int buttonCount = 5;
    int maxPage = (int)(listCount / limit + 0.9D);
//    int startPage = ((int)(currentPage / buttonCount + 0.9D) - 1) * buttonCount + 1;  //페이징 계산식이 문제가 있어보임.
    int startPage = 1;
    int endPage = startPage + buttonCount - 1;
    if (maxPage < endPage)
      endPage = maxPage; 
    boolean prev = !(currentPage == 1);
    boolean next = !(currentPage >= maxPage);
    int limitStart = (currentPage - 1) * limit;
    pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, limitStart, prev, next);
    return pi;
  }
}
