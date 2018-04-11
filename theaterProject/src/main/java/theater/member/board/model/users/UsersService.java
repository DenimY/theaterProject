package theater.member.board.model.users;

import java.util.List;

public interface UsersService {
	
		public void insertUsers(UsersVO vo);
		
		public int idChk(UsersVO vo);
		
		public UsersVO login(UsersVO vo);
		
		public void update(UsersVO vo);
		
		public UsersVO selectTestUserCount(UsersVO vo);

		public UsersVO seleteUser(UsersVO vo);
		
		public void usersUpdate(UsersVO vo);
		
		public List<UsersVO> usersList(UsersVO vo);

		public void updateUserphoto(UsersVO vo);

		public void deleteUser(UsersVO vo);

		public int pwChk(UsersVO vo);

}
