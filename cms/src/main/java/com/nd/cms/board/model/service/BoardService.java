package com.nd.cms.board.model.service;

import com.nd.cms.board.model.vo.Board;
import com.nd.cms.common.Attachment;
import java.util.List;
import java.util.Map;

public interface BoardService {
  int boardInsert(Board paramBoard);
  
  void modyAttachment(Attachment paramAttachment);
  
  Board selectBoardDetail(int paramInt);
  
  List<Board> selectBoardList(Map<String, Object> paramMap);
  
  int getBoardListCount(Board paramBoard);
  
  void deleteAttachment(int paramInt);
  
  void deleteBoard(int paramInt);
  
  List<Board> selectmainNotice();
}
