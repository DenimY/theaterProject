package theater.member.board.model.ticket;

import java.util.List;

import theater.member.board.model.users.UsersVO;


public interface TicketService {
	public List<ScheduleVO> getAdtSchedule(String id,String m_title);
	public void createTicket(TicketVO tvo, String schID, int total, String[] result, String auditoriumID);
}
