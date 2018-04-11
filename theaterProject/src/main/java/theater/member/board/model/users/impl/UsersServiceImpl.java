package theater.member.board.model.users.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import theater.member.board.model.users.UsersService;
import theater.member.board.model.users.UsersVO;


@Service("usersService")
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDAO usersDAO;
	
	@Override
	public void insertUsers(UsersVO vo) {
		usersDAO.insertUsers(vo);
	}
	
	@Override
	public int idChk(UsersVO vo) {
		return usersDAO.idChk(vo);
	}
	
	@Override
	public UsersVO login(UsersVO vo) {
		return usersDAO.login(vo);
	}
	
	@Override
	public void update(UsersVO vo) {
		usersDAO.update(vo);
	}
	
	@Override
	public UsersVO selectTestUserCount(UsersVO vo) {
		return usersDAO.selectTestUserCount(vo);
	}

	@Override
	public UsersVO seleteUser(UsersVO vo) {

		return usersDAO.seleteUser(vo);
	}
	
	@Override
	public void usersUpdate(UsersVO vo) {
		usersDAO.usersUpdate(vo);
	}

	@Override
	public List<UsersVO> usersList(UsersVO vo) {
		return usersDAO.usersList(vo);
	}

	@Override
	public void updateUserphoto(UsersVO vo) {
		usersDAO.updateUserphoto(vo);
	}

	@Override
	public void deleteUser(UsersVO vo) {
		
		usersDAO.deleteUser(vo);
	}

	@Override
	public int pwChk(UsersVO vo) {
		System.out.println("쿼리문실행전");
		return usersDAO.pwChk(vo);
	}

}
