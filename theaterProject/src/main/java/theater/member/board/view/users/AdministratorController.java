package theater.member.board.view.users;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import theater.member.board.model.board.BoardService;
import theater.member.board.model.ticket.MovieService;
import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.users.UsersService;
import theater.member.board.model.users.UsersVO;

@Controller
public class AdministratorController {

	@Autowired
	UsersService usersService;
	@Autowired
	MovieService movieService;  
	@Autowired
	BoardService boardService; 
	
	@RequestMapping(value = "/adminMenu.do", method = RequestMethod.GET)
	public String adminMenu(@RequestParam("menuType") String type) {
		System.out.println("(START)charts in, type " + type);
		if(type.equals("dashBoard")) {
			return "adminDashBoard.do"; 
		}else if(type.equals("charts")) {
			return "adminChart.jsp";
		}
		else if(type.equals("userInfo")) {
			return "userInfotables.do";
		}else if(type.equals("movieRegistration")) {
			return "insertMovie.jsp";
		}
		else{
			System.out.println("[ERROR] Menu type is wrong, type is : " + type);
			return null; 
		}
	}
	// 최초 창 페이지 
	@RequestMapping(value = "/adminDashBoard.do", method = RequestMethod.GET)
	public String adminDashBoard(MovieVO mvo, UsersVO uvo, Model model) {
		System.out.println("(START) adminDashBoard.do In");
		Calendar cal = Calendar.getInstance(); 
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		int thisYear = Integer.parseInt(df.format(cal.getTime()));
		
		mvo.setSelectYear(thisYear);
		model.addAttribute("audience", movieService.getAudience(mvo)); 
		model.addAttribute("selectYear", cal.get(Calendar.YEAR));
		model.addAttribute("users", usersService.usersList(uvo));
		System.out.println("(START) adminDashBoard.do END");

		return "adminDashBoard.jsp";
	}
	
//	@RequestMapping(value = "/chartCheck.do", method = RequestMethod.GET)
//	@ResponseBody
//	public List<Integer> chartCheck(MovieVO vo, Model model, UsersVO userVO, @RequestParam("year") int year) {
//		System.out.println("(START) ChartCheck.do");
//		year = (year * 10000) + 101;
//		vo.setSelectYear(year);
//		System.out.println(year);
//		movieService.getAudience(vo);
//		List<Integer> audienceList = new ArrayList<Integer>();
//
//		for (MovieVO mvo : movieService.getAudience(vo)) {
//			audienceList.add(mvo.getAudience());
//		}
//		System.out.println(audienceList);
//		if (audienceList.size() < 12) {
//			for (int i = audienceList.size(); i < 12; i++) {
//				audienceList.add(0);
//			}
//		}
//		System.out.println(audienceList);
//		model.addAttribute("selectYear", vo.getSelectYear());
//		model.addAttribute("audience", movieService.getAudience(vo));
//		model.addAttribute("users", usersService.usersList(userVO));
//		System.out.println("getselectYear : " + vo.getSelectYear());
//		System.out.println("getAudience : " + movieService.getAudience(vo));
//		System.out.println("(END) ChartCheck.do");
//
//		return audienceList;
////		return "adminChart.jsp?audienceList = " + audienceList ;
//	}
	
	@RequestMapping(value = "/chartCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Integer> chartCheck(MovieVO vo, Model model, @RequestParam("year") int year) {
		System.out.println("(START) ChartCheck.do");
		year = (year * 10000) + 101;
		vo.setSelectYear(year);
		System.out.println(year);
		movieService.getAudience(vo);
		List<Integer> audienceList = new ArrayList<Integer>();

		for (MovieVO mvo : movieService.getAudience(vo)) {
			audienceList.add(mvo.getAudience());
		}
		System.out.println(audienceList);
		if (audienceList.size() < 12) {
			for (int i = audienceList.size(); i < 12; i++) {
				audienceList.add(0);
			}
		}
		System.out.println(audienceList);
//		model.addAttribute("selectYear", vo.getSelectYear());
//		model.addAttribute("audience", movieService.getAudience(vo));
//		model.addAttribute("users", usersService.usersList(userVO));
		System.out.println("getselectYear : " + vo.getSelectYear());
		System.out.println("getAudience : " + movieService.getAudience(vo));
		System.out.println("(END) admin");

		return audienceList;
	}
	
	@RequestMapping(value = "/chartUpdate.do", method = RequestMethod.GET)
	public String chartUpdate(MovieVO mvo, UsersVO uvo, Model model ) {
		System.out.println("(START) ChartUpdate.do");
		model.addAttribute("selectYear", mvo.getSelectYear());
		model.addAttribute("audience", movieService.getAudience(mvo));
		model.addAttribute("users", usersService.usersList(uvo));

		return "adminChart.jsp";
	}
	

}
