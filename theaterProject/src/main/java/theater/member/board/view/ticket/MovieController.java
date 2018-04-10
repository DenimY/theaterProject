package theater.member.board.view.ticket;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import theater.member.board.model.ticket.MovieService;
import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.ticket.UploadFileVO;
import theater.member.board.model.users.UsersService;
import theater.member.board.model.users.UsersVO;

@Controller
@SessionAttributes("movie")
public class MovieController {
   @Autowired
   private MovieService movieService;
   @Autowired
   private UsersService usersService;
  

   @ModelAttribute("conditionMap")
   public Map<String,String> searchConditionMap(){
      Map<String, String> conditionMap = new HashMap<String, String>();
      conditionMap.put("제목", "TITLE");
      conditionMap.put("내용", "CONTENT");
      conditionMap.put("작성자", "name");
      return conditionMap;
   }
   
   @RequestMapping(value="/home.do")
   public String index(Model model , MovieVO vo){
      List<MovieVO> movies = movieService.getMovieList(vo);
      
//      for(MovieVO mvo : movies) {
//         listMovieTitle.add(movieService.getMovieTitle(mvo));
//      }
      movieService.getOpeningMovie(vo,model);
      movieService.getNotOpeningMovie(vo,model);
//      model.addAttribute("showing" ,movieService.showing());
//      model.addAttribute("movieListImage", listMovieTitle);
//      model.addAttribute("notShowing" ,movieService.notShowing());
      //slide
      List<MovieVO> slide = movieService.getMovieSlide();
      List<UploadFileVO> slideFile = new ArrayList<>();
      for(MovieVO mvo : slide) {
    	  slideFile.add(movieService.getMovieSildeImage(mvo));
      }
      model.addAttribute("movie_slide",slide);
      model.addAttribute("movie_slideImage", slideFile);
      return "main.jsp";
   }
   
   
   
   
   
   @RequestMapping(value = "/fileUpload.do")
    public String fileUp(@RequestParam(value="checkType", required =false)String[] type,
          @RequestParam(value="time", required=false)int time,
          MultipartHttpServletRequest multi,
          MovieVO vo,HttpServletRequest request)throws IllegalStateException, IOException{
	   
	   int ID = movieService.getSeqMovieID();
	   vo.setId(ID);
	   
	   movieService.insertMovie(vo, type, time);
      
        movieService.fileUpload(vo, multi, request);
        
        
        return "redirect:searchMovie.do";
    }


   @RequestMapping("/deleteMovie.do")
   public String deleteMovie(HttpServletRequest request,MovieVO vo) {
     
      movieService.deleteMovie(vo,request);
      return "test3.jsp";
   }

   @RequestMapping("/updateMovie.do")
   public String updateMovie(MovieVO vo) {
      return null;

   }

   @RequestMapping("/getMovie.do")
   public String getMovieList(MovieVO vo,Model model) {

	   
	  model.addAttribute("movie", movieService.getMovie(vo));   
      model.addAttribute("image_title",movieService.getMovieTitle(vo));
      model.addAttribute("image_content",movieService.getMovieImage(vo));
      return "MovieInfo.jsp";

   }
   
   
   @RequestMapping("/searchMovie.do")
   public String searchMovieList(@RequestParam(value="searchCondition",defaultValue="TITLE", required=false)String condition,
         @RequestParam(value="searchKeyword",defaultValue="", required=false)String keyword,
         MovieVO vo, Model model) {
      if(vo.getSearchCondition() == null) {
         vo.setSearchCondition("TITLE");
      }
      if(vo.getSearchKeyword() == null) {
         vo.setSearchKeyword("");
      }

      vo.setSearchKeyword(keyword);

      model.addAttribute("condition", condition);
      model.addAttribute("searchKeyword", keyword);
      model.addAttribute("searchList", movieService.searchMovie(vo));
      
      return "searchMovie.jsp";

	}

	// adminPage
	@RequestMapping(value = "/adminPage.do")
	public String adminPage(MovieVO vo, UsersVO userVO, Model model) {
		// System.out.println(" adminPage Chart 占쎌읈");
		// System.out.println("vo :" + vo.toString());
		System.out.println("first selectyear value : " + vo.getSelectYear());
		if(vo.getSelectYear() == 0) {
			Calendar cal = Calendar.getInstance();
			System.out.println("cal : " + cal);
			System.out.println("cal : " + cal.get(Calendar.DATE));
			vo.setSelectYear(cal.get(Calendar.DATE));
			vo.setSelectYear(20170101);
		}
		else {
			System.out.println("seconde selectyear value : " + vo.getSelectYear());
		}
		
		System.out.println("Select Year : " + vo.getSelectYear());
		model.addAttribute("audience", movieService.getAudience(vo));
		model.addAttribute("selectYear", vo.getSelectYear());
		model.addAttribute("users", usersService.usersList(userVO));
//		model.addAttribute("movie", movieService.getMovie(vo));
		System.out.println(vo.toString());
//		System.out.println("adminPage Chart �썑");
		return "adminPage.jsp";
	}
	
	@RequestMapping(value = "/adminCharts.do")
	public String adminCharts(MovieVO vo, UsersVO userVO, Model model) {
		 System.out.println("(START) adminCharts.do IN");
		// System.out.println("vo :" + vo.toString());
		System.out.println("first selectyear value : " + vo.getSelectYear());
		if(vo.getSelectYear() == 0) {
			Calendar cal = Calendar.getInstance();
			System.out.println("cal : " + cal);
			System.out.println("cal : " + cal.get(Calendar.DATE));
			vo.setSelectYear(cal.get(Calendar.DATE));
			vo.setSelectYear(20170101);
		}
		else {
			System.out.println("seconde selectyear value : " + vo.getSelectYear());
		}
		
		System.out.println("Select Year : " + vo.getSelectYear());
		model.addAttribute("audience", movieService.getAudience(vo));
		model.addAttribute("selectYear", vo.getSelectYear());
		model.addAttribute("users", usersService.usersList(userVO));
//		model.addAttribute("movie", movieService.getMovie(vo));
		System.out.println(vo.toString());
//		System.out.println("adminPage Chart �썑");
		return "adminCharts.jsp";
	}
	
		
	@RequestMapping(value = "/movieRegistration.do", method = RequestMethod.GET)
	public String movieRegistration() {
		return "insertMovie.jsp";
		
	}
}