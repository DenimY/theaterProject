package theater.member.board.model.ticket.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import theater.member.board.model.ticket.AuditoriumVO;
import theater.member.board.model.ticket.FacilitiesService;
import theater.member.board.model.ticket.SeatVO;
import theater.member.board.model.ticket.TheaterVO;
import theater.member.board.model.ticket.impl.DAO.facilitiesDAO;



/**
 * 시설 관리
 * 		영화관, 상영관, 좌석에 대한 CRUD
 */
@Service("FacilitiesService")
public class FacilitiesServiceImpl implements FacilitiesService{
	@Autowired
	private facilitiesDAO dao;
	
	@Override
	public List<TheaterVO> getListTheater() {
		return dao.getListTheater();
	}

	@Override
	public TheaterVO getTheater(String id) {
		HashMap<String, String> hm = changeTheaterName(id);
		return dao.getTheater(hm);
	}
	@Override
	public AuditoriumVO getAuditorium(AuditoriumVO vo) {
		return dao.getAuditorium(vo);
	}

	@Override
	public List<AuditoriumVO> getListAuditorium() {
		return dao.getListAuditorium();
	}

	@Override
	public void insertSeat(SeatVO svo,AuditoriumVO avo) {
		
	
		char aString = 65;
		svo.setAuditoriumId(avo.getId());
		int x = svo.getLocX();
		int y = svo.getLocY();
		
		for(int i = 1; i<=y; i++) {
			for(int j = 1; j<=x; j++) {
				svo.setId(dao.getSeatID());
				//좌석 아이디 및 좌표 생성
				svo.setName(String.valueOf(j)+aString);
				svo.setLocX(i);
				svo.setLocY(j);
				dao.insertSeat(svo);
			}
			aString++;
		}
		
	}

	@Override
	public List<SeatVO> getSeat(int id) {
		return dao.getSeat(id);
	}

	@Override
	public List<AuditoriumVO> getTheaterAuditorium(String id) {
		HashMap<String, String> hm = changeTheaterName(id);
		return dao.getTheaterAdt(hm);
	}

	@Override
	public List<SeatVO> getTicketSeat(String id, String auditoriumId) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("id", id);
		hm.put("auditoriumId",auditoriumId);
		return dao.getTicketSeat(hm);
	}

	
	//	메소드
	private HashMap<String, String> changeTheaterName(String id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("name", id);
		return hm;
	}


}
