package theater.member.board.model.board;

import java.util.List;

public interface BoardService {
	//게시판
	public void insertBoard(BoardVO vo);
	
	public List<BoardVO> selectBoard(BoardVO vo);
	
	public List<BoardVO> selectadminBoard();
	
	public BoardVO getBoard(BoardVO vo);

	public void deleteBoard(BoardVO vo);

	public void updateBoard(BoardVO vo);
	
	public List<BoardVO> selectMyBoardList(BoardVO vo);
	
	//댓글
	public void insertComment(CommentVO vo);
	
	public List<CommentVO> selectComment(BoardVO vo);

	public void updateComment(CommentVO vo);

	public void deleteComment(CommentVO vo);
	
	public int pagingList();


	
}
