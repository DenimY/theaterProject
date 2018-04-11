package theater.member.board.model.users.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import theater.member.board.model.users.UsersVO;



@Repository
public class UsersDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertUsers(UsersVO vo) {
		System.out.println(vo); 
		mybatis.insert("usersDAO.insertusers", vo);
		//selectTestUserCount(vo);

	}
	
	public int idChk(UsersVO vo) {
		return mybatis.selectOne("usersDAO.idChk", vo.getId());
	}
	
	//
	public UsersVO login(UsersVO vo) {
		return mybatis.selectOne("usersDAO.login", vo);
	}
	
	//
	public void update(UsersVO vo) {
		mybatis.update("usersDAO.update", vo);
	}
	
	// 
	public UsersVO selectTestUserCount(UsersVO vo) {
		return mybatis.selectOne("usersDAO.selectTestUserCount", vo);
		
	}

	public UsersVO seleteUser(UsersVO vo) {
		return mybatis.selectOne("usersDAO.selectUsers", vo);
	}
	
	public void usersUpdate(UsersVO vo) {
		mybatis.update("usersDAO.usersUpdate", vo);
	}
	
	public List<UsersVO> usersList(UsersVO vo){
		return mybatis.selectList("usersDAO.userInfo", vo);
	}

	public void updateUserphoto(UsersVO vo) {
		
		mybatis.update("usersDAO.updateUserphoto", vo);
	}

	public void deleteUser(UsersVO vo) {
		mybatis.delete("usersDAO.deleteUser", vo);
		
	}

	public int pwChk(UsersVO vo) {
		return mybatis.selectOne("usersDAO.pwChk", vo);
	}

}


