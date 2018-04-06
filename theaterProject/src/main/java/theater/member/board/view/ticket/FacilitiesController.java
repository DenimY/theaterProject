package theater.member.board.view.ticket;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import theater.member.board.model.ticket.AuditoriumVO;
import theater.member.board.model.ticket.FacilitiesService;
import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.ticket.SeatVO;
import theater.member.board.model.ticket.TheaterVO;


@Controller
@SessionAttributes("Facilities")
public class FacilitiesController {
	@Autowired
	private FacilitiesService FacilitiesService;
	
	
	//ajax 
	@RequestMapping("/selectTheater.do")
	@ResponseBody
	public List<AuditoriumVO> selectTheater(@RequestParam(value="id", required = false)String id){
		return FacilitiesService.getTheaterAuditorium(id);
	}

	@RequestMapping("/getTicketSeat.do")
	@ResponseBody
	public List<SeatVO> getTicketSeat(@RequestParam(value="id", required = true)String id,
			@RequestParam(value="auditoriumId", required = true)String auditoriumId){
		
		
		return FacilitiesService.getTicketSeat(id,auditoriumId);
	}
	
	@RequestMapping("/selectSeat.do")
	@ResponseBody
	public List<SeatVO> selectSeat(@RequestParam(value="id", required = false)int id) {
		return FacilitiesService.getSeat(id);
	}
	
	
	//url
	@RequestMapping("/addSeat.do")
	public String addSeat(AuditoriumVO avo, SeatVO svo) {
		FacilitiesService.insertSeat(svo,avo);
			
			return "test.jsp";
		}
		
	
	@RequestMapping("/ts.do")
	public String ts(Model model,MovieVO vo) {
		
		List<TheaterVO> theater = FacilitiesService.getListTheater();
		
		model.addAttribute("movie",vo);
		model.addAttribute("theater",theater);
		return "Ticketing1.jsp";
	}
	
	@RequestMapping("/tt.do")
	public String tt(Model model,MovieVO vo) {
		model.addAttribute("adt",FacilitiesService.getListAuditorium());
		return "test3.jsp";
	}

}
