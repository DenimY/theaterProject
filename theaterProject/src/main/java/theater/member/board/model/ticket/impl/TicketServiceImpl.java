package theater.member.board.model.ticket.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import theater.member.board.model.ticket.ScheduleVO;
import theater.member.board.model.ticket.TicketService;
import theater.member.board.model.ticket.TicketVO;
import theater.member.board.model.ticket.impl.DAO.TicketDAO;
import theater.member.board.model.ticket.impl.DAO.facilitiesDAO;

@Service("ticketService")
public class TicketServiceImpl implements TicketService {
	@Autowired
	private TicketDAO dao;
	@Autowired
	private facilitiesDAO fdao;
	@Override
	public List<ScheduleVO> getAdtSchedule(String id, String title) {
		HashMap<String,String> hm = new HashMap<>();
		hm.put("id", id);
		hm.put("title", title);
		return dao.getAdtSchedule(hm);
	}

	@Override
	public void createTicket(TicketVO tvo, String schID, int total, String[] result, String auditoriumID) {
		//티켓 생성
		for(String seat : result) {
			
			tvo.setScheduleId(Integer.parseInt(schID));
			tvo.setSeatId(fdao.TicketSeatID(seat,auditoriumID));
			tvo.setPrice(total / result.length);
			dao.createTicket(tvo);
		}
		
	}



}

	
