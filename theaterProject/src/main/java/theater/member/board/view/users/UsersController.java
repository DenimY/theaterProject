package theater.member.board.view.users;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import theater.member.board.model.board.BoardService;
import theater.member.board.model.board.BoardVO;
import theater.member.board.model.users.UsersService;
import theater.member.board.model.users.UsersVO;

@Controller
public class UsersController {

	@Autowired
	UsersService usersService;

	// 회원가입
	@RequestMapping(value = "/join.do")
	public String join(UsersVO vo, HttpSession session) {
		System.out.println("회원가입 전");
		usersService.insertUsers(vo);
		System.out.println("회원가입 후");
		return "redirect:/home.do";
	}

	// 아이디체크
	@RequestMapping(value = "/idchk.do")
	@ResponseBody
	public String idChk(UsersVO vo, HttpSession session) {
		System.out.println(vo);
		int chk = usersService.idChk(vo);
		System.out.println(usersService.idChk(vo));
		System.out.println("사용 가능한 아이디입니다.");
		return chk + "";

	}

	// 로그인
	@RequestMapping(value = "/login.do")
	public String login(UsersVO vo, HttpSession session) {

		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("로그인실패.");
		}
		UsersVO users = usersService.login(vo);
		if (users != null) {

			session.setAttribute("users", users);
			System.out.println(users);
			System.out.println("로그인 성공");
		} else {
			return "login.jsp";
		}
		return "redirect:/home.do";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}

	// 03 회원 상세정보 조회
	@RequestMapping("userView.do")
	public String usersView(UsersVO vo, HttpSession session) {

		System.out.println("클릭한 아이디 확인 : " + vo);
		return "myProfileUpdate.jsp";
	}

	// 04. 회원 정보 수정 처리
	@RequestMapping("Myupdate.do")
	public String usersUpdate(UsersVO vo, HttpSession session) {
		System.out.println(vo + "수정해주세요");
		usersService.usersUpdate(vo);
		System.out.println(vo + "수정이완료되었습니다.");
		session.setAttribute("users", usersService.seleteUser(vo));
		System.out.println("세션이 바뀌었습니다.");
		return "redirect:userView.do";
	}

	// 파일 업로드
	@RequestMapping("imgUpdate.do")
	public String fileUpload(UsersVO vo, HttpServletRequest req, HttpServletResponse rep, HttpSession session) {
		// 파일이 저장될 path생성
		String path = req.getSession().getServletContext().getRealPath("/") + "usersphoto/";

		// MultipartHttpServletRequest 생성
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;

			Iterator<String> iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";

			// 디레토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			// 값이 나올때 까지
			while (iter.hasNext()) {
				fieldName = iter.next();// 내용을 가져와서
				mfile = mhsr.getFile(fieldName);
				String origName;

				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // 한글깨짐방지

				// 파일이 없다면
				if ("".equals(origName)) {
					continue;
				}

				// 파일명 변경(uuid로 암호화)
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
				String saveFileName = getUuid() + ext;

				// 설정한 Path에 파일저장
				File serverFile = new File(path + File.separator + saveFileName);

				mfile.transferTo(serverFile);

				vo.setuserphoto(saveFileName);

				HashMap<String, String> file = new HashMap<>();
				file.put("origName", origName);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(vo);
		usersService.updateUserphoto(vo);

		session.setAttribute("users", usersService.seleteUser(vo));
		System.out.println("세션이 바뀌었습니다.");

		return "UserMyPageIndex.jsp";

	}

	// uuid생성
	private String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	@RequestMapping(value = "/UserPage.do", method = RequestMethod.GET)
	public String UserPage(UsersVO vo, Model model, @RequestParam("userId") String id,
			@RequestParam("type") String type) {
		System.out.println("UserPage In");
		System.out.println("UserPage id :" + id + ", type : " + type);
		System.out.println("vo id :" + vo.getId());
		vo.setId(id);
		model.addAttribute("users", usersService.seleteUser(vo));
		System.out.println("vo id :" + vo.getId());
		if (type.equals("userInfo")) {

			return "myProfileUpdate2.jsp";

		} else if (type.equals("userBoard")) {
			return "myboardList.do?writer=" + id;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(UsersVO vo, Model model) {
		System.out.println("delete user id :" + vo.getId());
		usersService.deleteUser(vo);
		return "redirect:userInfotables.do";
	}

}
