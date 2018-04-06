package theater.member.board.model.board.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import theater.member.board.model.board.BoardService;
import theater.member.board.model.board.BoardVO;
import theater.member.board.model.board.CommentVO;

@Service("boardService")
public class BoardServiceimpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	//게시판
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	//getBoardList
	public List<BoardVO> selectBoard(BoardVO vo) {
		List<BoardVO> boardList = boardDAO.selectBoard(vo);
		return boardList;
	}
	
	//관리자
	public List<BoardVO> selectadminBoard() {
		return boardDAO.selectadminBoard();
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.selectGetBoard(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoardId(vo);
		boardDAO.deleteBoard(vo);
	}
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectMyBoardList(BoardVO vo) {
		return boardDAO.selectMyBoardList(vo);
	}
	//댓글
	@Override
	public void insertComment(CommentVO vo) {
		boardDAO.insertComment(vo);
	}
	@Override
	public List<CommentVO> selectComment(BoardVO vo) {
		return boardDAO.selectComment(vo);
	}
	@Override
	public void updateComment(CommentVO vo) {
		boardDAO.updateComment(vo);
	}
	@Override
	public void deleteComment(CommentVO vo) {
		boardDAO.deleteComment(vo);

	}
	@Override
	public int pagingList() {
		int totalRecords = boardDAO.selectRecords();
		
		return totalRecords;
	}

	
}
