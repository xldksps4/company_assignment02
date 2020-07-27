package com.nd.cms.board.model.service;

import com.nd.cms.board.model.dao.BoardDao;
import com.nd.cms.board.model.vo.Board;
import com.nd.cms.common.Attachment;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
  private BoardDao bd;
  
  public BoardServiceImpl(BoardDao bd) {
    this.bd = bd;
  }
  
  public int boardInsert(Board board) {
    return this.bd.boardInsert(board);
  }
  
  public void modyAttachment(Attachment attachment) {
    this.bd.modyAttachment(attachment);
  }
  
  public Board selectBoardDetail(int board_no) {
    return this.bd.selectBoardDetail(board_no);
  }
  
  public List<Board> selectBoardList(Map<String, Object> map) {
    return this.bd.selectBoardList(map);
  }
  
  public int getBoardListCount(Board board) {
    return this.bd.getBoardListCount(board);
  }
  
  public void deleteAttachment(int file_no) {
    this.bd.deleteAttachment(file_no);
  }
  
  public void deleteBoard(int board_no) {
    this.bd.deleteBoard(board_no);
  }
  
  public List<Board> selectmainNotice() {
    return this.bd.selectmainNotice();
  }
}
