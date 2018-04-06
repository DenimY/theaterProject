package theater.member.board.model.board;

import java.util.Date;

public class CommentVO {
	private int id; //댓글 id
	private int cbid; //댓글이 달릴 게시판 id
	private String contents; // 댓글
	private String writer; // 댓글 작성자 아이디
	private Date writedate; // 댓글쓴 시간
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCbid() {
		return cbid;
	}
	public void setCbid(int cbid) {
		this.cbid = cbid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", cbid=" + cbid + ", contents=" + contents + ", writer=" + writer
				+ ", register=" + writedate + "]";
	}
	
	
	
}
	