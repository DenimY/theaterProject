package theater.member.board.model.ticket;


public class ScheduleVO {
	private int id;             
	private int auditoriumId;         
	private int movieID;  
	private String time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(int auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
