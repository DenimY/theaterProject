package theater.member.board.view.users;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.util.resources.cldr.ak.CalendarData_ak_GH;
import theater.member.board.model.board.BoardService;
import theater.member.board.model.ticket.MovieService;
import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.users.UsersService;
import theater.member.board.model.users.UsersVO;
import theater.member.board.util.poi.DataModel;
import theater.member.board.util.poi.MakeExcel;
import theater.member.board.util.poi.MakeExcelOneSheet;

@Controller
public class AdministratorController {

	@Autowired
	UsersService usersService;
	@Autowired
	MovieService movieService;
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/adminMenu.do", method = RequestMethod.GET)
	public String adminMenu(@RequestParam("menuType") String type) {
		System.out.println("(START)charts in, type " + type);
		if (type.equals("dashBoard")) {
			return "adminDashBoard.do";
		} else if (type.equals("charts")) {
			return "chartPackage.do";
		} else if (type.equals("userInfo")) {
			return "userInfotables.do";
		} else if (type.equals("movieRegistration")) {
			return "insertMovie.jsp";
		} else {
			System.out.println("[ERROR] Menu type is wrong, type is : " + type);
			return null;
		}
	}

	// 최초 창 페이지
	@RequestMapping(value = "/adminDashBoard.do", method = RequestMethod.GET)
	public String adminDashBoard(MovieVO mvo, UsersVO uvo, Model model) {
		System.out.println("(START) adminDashBoard.do In");
		Calendar cal = Calendar.getInstance();

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		int thisYear = Integer.parseInt(df.format(cal.getTime()));

		mvo.setSelectYear(thisYear);
		model.addAttribute("audience", movieService.getAudience(mvo));
		model.addAttribute("selectYear", cal.get(Calendar.YEAR));
		model.addAttribute("users", usersService.usersList(uvo));
		System.out.println("(START) adminDashBoard.do END");

		return "adminDashBoard.jsp";
	}

	@RequestMapping(value = "/chartCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Integer> chartCheck(MovieVO vo, Model model, @RequestParam("year") int year) {
		System.out.println("(START) ChartCheck.do");
		year = (year * 10000) + 101;
		vo.setSelectYear(year);
		System.out.println(year);
		movieService.getAudience(vo);
		List<Integer> audienceList = new ArrayList<Integer>();

		for (MovieVO mvo : movieService.getAudience(vo)) {
			audienceList.add(mvo.getAudience());
		}
		System.out.println(audienceList);
		if (audienceList.size() < 12) {
			for (int i = audienceList.size(); i < 12; i++) {
				audienceList.add(0);
			}
		}
		System.out.println(audienceList);
		System.out.println("getselectYear : " + vo.getSelectYear());
		System.out.println("getAudience : " + movieService.getAudience(vo));
		System.out.println("(END) admin");

		return audienceList;
	}

	@RequestMapping(value = "/chartUpdate.do", method = RequestMethod.GET)
	public String chartUpdate(MovieVO mvo, UsersVO uvo, Model model) {
		System.out.println("(START) ChartUpdate.do");
		model.addAttribute("selectYear", mvo.getSelectYear());
		model.addAttribute("audience", movieService.getAudience(mvo));
		model.addAttribute("users", usersService.usersList(uvo));

		return "adminChart.jsp";
	}

	@RequestMapping(value = "/chartPackage.do", method = RequestMethod.GET)
	public String chartPackage(MovieVO mvo, UsersVO uvo, Model model) {

		Calendar cal = Calendar.getInstance();

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		int thisYear = Integer.parseInt(df.format(cal.getTime()));

		mvo.setSelectYear(thisYear);

		model.addAttribute("selectYear", cal.get(Calendar.YEAR));
		model.addAttribute("audience", movieService.getAudience(mvo));
		model.addAttribute("users", usersService.usersList(uvo));

		return "adminCharts.jsp";

	}

	@RequestMapping(value = "/userInfotables.do")
	public String UserInfotables(UsersVO vo, Model model) {
		model.addAttribute("users", usersService.usersList(vo));
		return "userInfotables.jsp";
	}

	@RequestMapping(value = "/modifyUserInfo.do", method = RequestMethod.GET)
	public String modifyUserInfo(UsersVO vo, Model model, @RequestParam("id") String id) {
		vo.setId(id);
		model.addAttribute("users", usersService.seleteUser(vo));
		return "myProfileUpdate.jsp";
	}

	@RequestMapping(value = "outOfData.do", method = RequestMethod.POST)
	@ResponseBody
	public String outOfData(MovieVO mvo, @RequestParam("year") int year) {
		System.out.println("outofdata year : " + year);
		String filePath = "c/:";
		String fileName = year + "년 매출 내역"; 
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		int thisYear = Integer.parseInt(df.format(cal.getTime()));
		mvo.setSelectYear(thisYear);
		
		List<String[]> data = new ArrayList<String[]>();
		
		int month = 1; 
		for (MovieVO vo : movieService.getAudience(mvo)) {
			data.add(new String[] { month+"월", Integer.toString(vo.getAudience())});
			month++;
		}
		if (data.size() < 13) {
			for (int i = data.size(); i < 12; i++) {
				data.add(new String[] {  data.size()+"월", "0"});
			}
		}
		
		data.add(new String[] { "YEAR", Integer.toString(year)});
		cal = Calendar.getInstance();
		df = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String today = df.format(cal.getTime()); 
		data.add(new String[] { "저장일", "" + today});
		fileName += "_" + today;  
		
		System.out.println("vo" + mvo.toString());
		System.out.println("data" + data.toString());
		DataModel dataModel = new DataModel(data);
		MakeExcel makeExcel = new MakeExcelOneSheet(dataModel);
		makeExcel.setDocumentTitle();
		makeExcel.setDocumentBody();
		makeExcel.saveToFile(fileName);
		System.out.println(fileName);
		return null; 
	}
}
