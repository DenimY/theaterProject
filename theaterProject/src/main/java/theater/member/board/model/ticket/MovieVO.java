package theater.member.board.model.ticket;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

@XmlAccessorType(XmlAccessType.FIELD)
public class MovieVO {
	
	@XmlAttribute
	private int id;
	private String title;
	private String type;
	private String singlePlot;
	private Date openingDay;
	private String director;
	private String actor;
	private String content;
	private String age;
	private String time;
	private int audience;
	private int selectYear;
	@XmlTransient
	private String searchCondition;
	@XmlTransient
	private String searchKeyword;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSinglePlot() {
		return singlePlot;
	}
	public void setSinglePlot(String singlePlot) {
		this.singlePlot = singlePlot;
	}
	public Date getOpeningDay() {
		return openingDay;
	}
	public void setOpeningDay(Date openingDay) {
		this.openingDay = openingDay;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public int getAudience() {
		return audience;
	}
	public void setAudience(int audience) {
		this.audience = audience;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getSelectYear() {
		return selectYear;
	}
	public void setSelectYear(int selectYear) {
		this.selectYear = selectYear;
	}
}
