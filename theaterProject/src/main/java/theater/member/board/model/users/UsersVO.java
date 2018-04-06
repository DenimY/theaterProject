package theater.member.board.model.users;

import java.sql.Date;

public class UsersVO {
	
	private String id;
	private String pw;
	private String name;
	private String gender;
	private Date birthday;
	private String address;
	private String email;
	private String tel;
	private int score;
	private int grade;
	private String userphoto;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getuserphoto() {
		return userphoto;
	}
	public void setuserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	
	@Override
	public String toString() {
		return "UsersVO [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", birthday=" + birthday
				+ ", address=" + address + ", email=" + email + ", tel=" + tel + ", score=" + score + ", grade=" + grade
				+ ", userphoto=" + userphoto + "]";
	}
	
	
	
}