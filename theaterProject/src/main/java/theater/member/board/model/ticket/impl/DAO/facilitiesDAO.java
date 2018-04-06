package theater.member.board.model.ticket.impl.DAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import theater.member.board.model.ticket.AuditoriumVO;
import theater.member.board.model.ticket.SeatVO;
import theater.member.board.model.ticket.TheaterVO;

@Repository
public class facilitiesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AuditoriumVO getAuditorium(AuditoriumVO vo) {
		return mybatis.selectOne("facilitiesDAO.getAuditorium",vo);
	}
	public List<TheaterVO> getListTheater() {
		return mybatis.selectList("facilitiesDAO.listTheater");
	}
	public TheaterVO getTheater(HashMap<String, String> hm) {
		return mybatis.selectOne("facilitiesDAO.getTheater",hm);
	}
	public List<AuditoriumVO> getListAuditorium() {
		return mybatis.selectList("facilitiesDAO.getListAuditorium");
	}

	public List<SeatVO> getSeat(int id) {
		return mybatis.selectList("facilitiesDAO.getSeat", id);
	}
	
	public void insertSeat(SeatVO seat) {
		mybatis.insert("facilitiesDAO.insertSeat",seat);
	}
	public List<AuditoriumVO> getTheaterAdt(HashMap<String, String> hm) {
		return mybatis.selectList("facilitiesDAO.getTheaterAdt", hm);
	}
	public List<SeatVO> getTicketSeat(HashMap<String, String> hm) {
		return mybatis.selectList("facilitiesDAO.getTicketSeat",hm);
	}
	public int getSeatID() {
		return mybatis.selectOne("facilitiesDAO.getSeatID");
	}
	public int TicketSeatID(String seat, String auditoriumID) {
		HashMap<String,String> hm = new HashMap<>();
		hm.put("name", seat);
		hm.put("auditoriumID",auditoriumID);
		return mybatis.selectOne("facilitiesDAO.TicketSeatID",hm);
	}
}
