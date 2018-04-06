package theater.member.board.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import theater.member.board.model.board.BoardService;
import theater.member.board.model.board.BoardVO;
import theater.member.board.model.board.CommentVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	//게시글 등록
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(BoardVO vo, HttpSession session) {
		System.out.println("글 등록전");
		boardService.insertBoard(vo);
		System.out.println("글 등록 성공");
		return "redirect:boardList.do";
	}

	//게시글 삭제
	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(BoardVO vo, HttpSession session) {
		System.out.println("Delete시작");
		System.out.println(vo);
		boardService.deleteBoard(vo);
		System.out.println("Delete종료");
		return "boardList.do";
	}

	//게시글 상세 보기
	@RequestMapping(value="/viewBoard.do")
	public String viewBoard(BoardVO vo, HttpSession session, Model model) {
		System.out.println(vo +"게시글 상세보기 전");
		model.addAttribute("board", boardService.getBoard(vo));

		//댓글 리스트보기.
		List<CommentVO> commentList = boardService.selectComment(vo);
		model.addAttribute("commentList", commentList);
		System.out.println(commentList +"댓글 리스트보기.");
		if (vo.isModify()) {
			return "updateBoard.jsp";
		} else {
			return "viewBoard.jsp";
		}
	}

	//게시글 수정
	@RequestMapping(value="/updateBoard.do")
	public String updateBoard(BoardVO vo, HttpSession session ) {
		System.out.println(vo +" 게시글 업데이트 전에 들어오는 놈");
		boardService.updateBoard(vo);
		System.out.println("업데이트 후");
		return "boardList.do";
	}

	//게시글 목록
	@RequestMapping(value="/boardList.do")
	public String boardList(BoardVO vo, HttpSession session, Model model) {
		//Null Check
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		//model 정보 저장

		List<BoardVO> adminboardList = boardService.selectadminBoard();
		List<BoardVO> boardList = boardService.selectBoard(vo);
		
		model.addAttribute("search", vo);

		session.setAttribute("adminboardList", adminboardList); // 관리자 게시글
		session.setAttribute("boardList", boardList); // 회원 게시글
		
		//페이징
		int boardCount = boardService.pagingList();
		int start = ((int)Math.ceil((double)vo.getSearchPageNumber()/5)*5-5)+1;
		int end = ((int)Math.ceil((double)boardCount/10));
		int realendpage = end;

		System.out.println(vo.getSearchPageNumber());
		if(start+4<end) {
			end = start+4;
		} 
		model.addAttribute("startPage", start);
		model.addAttribute("endPage", end);
		model.addAttribute("realEndPage", realendpage);

		return "boardList.jsp";
	}

	// 내가 쓴 게시글 목록
	@RequestMapping(value = "/myboardList.do", method = RequestMethod.GET)
	public String myboardList(BoardVO vo, HttpSession session, Model model) {
		System.out.println("(START) myboardList.do in");

		List<BoardVO> myBoardList = boardService.selectMyBoardList(vo);

			session.setAttribute("myBoardList", myBoardList);
			//페이징
			int boardCount = boardService.pagingList();
			int start = ((int)Math.ceil((double)vo.getSearchPageNumber()/5)*5-5)+1;
			int end = ((int)Math.ceil((double)boardCount/10));
			int realendpage = end;

			System.out.println(vo.getSearchPageNumber());
			if(start+4<end) {
				end = start+4;
			} 
			model.addAttribute("startPage", start);
			model.addAttribute("endPage", end);
			model.addAttribute("realEndPage", realendpage);
			
			return "myBoardList.jsp";
		}
		
	//검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String,String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	//코멘트 달기
	@RequestMapping(value="/insertComment.do")
	public String insertComment(CommentVO vo, HttpSession session, BoardVO bvo) {
		System.out.println("댓글 등록 준비");
		vo.setCbid(bvo.getId());

		boardService.insertComment(vo);
		System.out.println("댓글 등록 성공");
		return "redirect:viewBoard.do?id="+bvo.getId();
	}

	//댓글 수정
	@RequestMapping(value="/updateComment.do")
	public String updateComment(CommentVO vo, HttpSession session,
			@RequestParam(value="boardId", required = false)String boardId) {
		System.out.println(vo + "댓글 업데이트 전");
		boardService.updateComment(vo);
		System.out.println("댓글 업데이트 후");
		return "viewBoard.do?id="+boardId;
	}

	//게시글 삭제
	@RequestMapping(value="/deleteComment.do")
	public String deleteComment(CommentVO vo, HttpSession session, 
			@RequestParam(value="boardId", required = false)String boardId) {
		System.out.println("댓글 삭제전");
		boardService.deleteComment(vo);
		System.out.println("댓글 삭제후");
		return "viewBoard.do?id="+boardId;
	}

}

