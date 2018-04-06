package theater.member.board.model.ticket;

import java.util.List;


public interface FacilitiesService {
	public AuditoriumVO getAuditorium(AuditoriumVO vo);
	public List<TheaterVO> getListTheater();
	public List<AuditoriumVO> getListAuditorium();
	public List<SeatVO> getSeat(int id);
	public void insertSeat(SeatVO seat, AuditoriumVO avo);
	public TheaterVO getTheater(String id);
	public List<AuditoriumVO> getTheaterAuditorium(String id);
	public List<SeatVO> getTicketSeat(String id, String auditoriumId);
	
}
