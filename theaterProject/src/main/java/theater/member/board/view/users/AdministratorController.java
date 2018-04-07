package theater.member.board.view.users;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			return "adminCharts.jsp";
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
		Calendar cal = Calendar.getInstance(); 
		
		SimpleDateFormat df = new SimpleDateFormat("YYYYMMDD");
		System.out.println(df.format(cal.getTime()));
		int thisYear = Integer.parseInt(df.format(cal.getTime()));
		
		mvo.setSelectYear(thisYear);
		model.addAttribute("audience", movieService.getAudience(mvo)); 
		model.addAttribute("selectYear", cal.get(Calendar.YEAR));
		model.addAttribute("users", usersService.usersList(uvo));

		return "adminDashBoard.jsp";
	}

}
