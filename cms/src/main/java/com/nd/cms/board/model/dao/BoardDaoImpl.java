package com.nd.cms.board.model.dao;

import com.nd.cms.board.model.vo.Board;
import com.nd.cms.common.Attachment;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {
  private SqlSessionTemplate session;
  
  public BoardDaoImpl(SqlSessionTemplate session) {
    this.session = session;
  }
  
  public int boardInsert(Board board) {
    return this.session.insert("Board.boardInsert", board);
  }
  
  public void modyAttachment(Attachment attachment) {
    this.session.insert("Board.modyAttachment", attachment);
  }
  
  public Board selectBoardDetail(int board_no) {
    return (Board)this.session.selectOne("Board.selectBoardDetail", Integer.valueOf(board_no));
  }
  
  public List<Board> selectBoardList(Map<String, Object> map) {
    return this.session.selectList("Board.selectBoardList", map);
  }
  
  public int getBoardListCount(Board board) {
    return ((Integer)this.session.selectOne("Board.getBoardListCount", board)).intValue();
  }
  
  public void deleteAttachment(int file_no) {
    this.session.update("Board.deleteAttachment", Integer.valueOf(file_no));
  }
  
  public void deleteBoard(int board_no) {
    this.session.update("Board.deleteBoard", Integer.valueOf(board_no));
  }
  
  public List<Board> selectmainNotice() {
    return this.session.selectList("Board.selectmainNotice");
  }
}
