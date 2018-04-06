package theater.member.board.model.ticket;

public class SeatVO {
	private int id;
	private String name;
	private int auditoriumId;
	private int locX;
	private int locY;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(int auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
	public int getLocX() {
		return locX;
	}
	public void setLocX(int locX) {
		this.locX = locX;
	}
	public int getLocY() {
		return locY;
	}
	public void setLocY(int locY) {
		this.locY = locY;
	}
	
}
