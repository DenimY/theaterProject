package theater.member.board.model.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import theater.member.board.model.board.BoardVO;
import theater.member.board.model.board.CommentVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	//게시판
	public void insertBoard(BoardVO vo) {
		System.out.println(vo);
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	public List<BoardVO> selectBoard(BoardVO vo) {
		return mybatis.selectList("BoardDAO.selectBoard", vo);
	}
	
	public BoardVO selectGetBoard(BoardVO vo) {
				mybatis.update("BoardDAO.updatehitBoard", vo);
		return mybatis.selectOne("BoardDAO.selectGetBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public List<BoardVO> selectMyBoardList(BoardVO vo) {
		
		return mybatis.selectList("BoardDAO.selectMyBoardList", vo);
	}
	
	//관리자
	public List<BoardVO> selectadminBoard() {
		return mybatis.selectList("BoardDAO.selectadminBoard");
	}
	//댓글
	public void insertComment(CommentVO vo) {
		System.out.println(vo);
		mybatis.insert("BoardDAO.insertComment", vo);
	}

	public List<CommentVO> selectComment(BoardVO vo) {
		return mybatis.selectList("BoardDAO.selectComment", vo);
	}

	public void updateComment(CommentVO vo) {
		mybatis.update("BoardDAO.updateComment", vo);
		
	}

	public void deleteComment(CommentVO vo) {
		mybatis.delete("BoardDAO.deleteComment", vo);
		
	}
	
	public int selectRecords() {
		return mybatis.selectOne("BoardDAO.totalRecords"); 
	}
	
	public void deleteBoardId(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoardId", vo);
		
	}
	
}