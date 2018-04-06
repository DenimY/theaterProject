package theater.member.board.view.ticket;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import theater.member.board.model.ticket.ScheduleVO;
import theater.member.board.model.ticket.TicketService;
import theater.member.board.model.ticket.TicketVO;
import theater.member.board.model.users.UsersVO;


@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;
	
	private String refererPage; 
	
	@RequestMapping("/selectAdt.do")
	@ResponseBody
	public List<ScheduleVO> selectAdt(@RequestParam(value="id", required = false)String id,
			@RequestParam(value="title", required = false)String title) {
		return ticketService.getAdtSchedule(id,title);
	}
	
	
	@RequestMapping("/createTicket.do")
	public String createTicket(@RequestParam(value="schID", required = false)String schID,
			@RequestParam(value="result", required = false)String[] result,
			@RequestParam(value="auditoriumID", required = false)String auditoriumID,
			HttpSession session,HttpServletRequest request,Model model) {
		refererPage = request.getHeader("referer");
		String returnPage = new String();
	
		//임시(가격 명세되면 impl로 이동)
		UsersVO uvo = (UsersVO) session.getAttribute("users");
		TicketVO tvo = new TicketVO();
		tvo.setUsersId(uvo.getId());

		//임시 가격(가격 정해지면 수정)
		int total = 8000 * result.length;
		tvo.setPrice(total);
		
		try {
			returnPage = "success.jsp";
			ticketService.createTicket(tvo,schID, total, result, auditoriumID);	
		}catch (Exception e) {
			returnPage = "redirect:errorTicket.do";
		}
		
		model.addAttribute("msg", "예약되었습니다."); 
		model.addAttribute("url", "home.do"); 
		return returnPage;
		
	}
	
	@RequestMapping("/UnderConstruction.do")
	public String getTicket(Model model) {
		model.addAttribute("msg1", "현재 공사중입니다. 죄송합니다.");
		model.addAttribute("msg2", "메인 화면으로 돌아갑니다.");
		model.addAttribute("url", "home.do");
		return "UnderConstruction.jsp";
	}
	
	@RequestMapping("/errorTicket.do")
	public String errorTicket(Model model) {
		model.addAttribute("msg", "이미 예약되어 있습니다."); 
		model.addAttribute("url", refererPage); 
		return "redirectreferer.jsp";
	}                                                                                                 
	
}
