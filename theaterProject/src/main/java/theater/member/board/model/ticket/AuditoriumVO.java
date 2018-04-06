package theater.member.board.model.ticket;

public class AuditoriumVO {
	
	private int id;
	private int theaterId; 
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(int theaterId) {
		this.theaterId = theaterId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	@Override
	public String toString() {
		return "AuditoriumVO [id=" + id + ", theaterId=" + theaterId + ", type=" + type + "]";
	}
	
}
