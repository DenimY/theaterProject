package theater.member.board.model.ticket.impl.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import theater.member.board.model.ticket.ScheduleVO;
import theater.member.board.model.ticket.SeatVO;
import theater.member.board.model.ticket.TicketVO;

@Repository
public class TicketDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<ScheduleVO> getAdtSchedule(HashMap<String, String> hm) {
		return mybatis.selectList("TicketDAO.getAdtSchedule",hm);
	}

	public SeatVO getSeatID(String ID) {
		return mybatis.selectOne("TicketDAO.getSeatID",ID);
	}

	
	public void createTicket(TicketVO tvo) {
		tvo.setId(mybatis.selectOne("TicketDAO.getNextSeqTnum"));
		mybatis.insert("TicketDAO.createTicket", tvo);
		
	}
}
