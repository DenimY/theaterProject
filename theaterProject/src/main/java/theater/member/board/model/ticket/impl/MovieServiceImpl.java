package theater.member.board.model.ticket.impl;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import theater.member.board.model.ticket.MovieService;
import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.ticket.UploadFileVO;
import theater.member.board.model.ticket.impl.DAO.MovieDAO;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDAO dao;
	private final String ATTACH_PATH = "image\\";
	

	@Override
	public int getSeqMovieID() {
		return dao.getSeqMovieID();
	}
	
	@Override
	public void insertMovie(MovieVO vo, String[] type,int time) {
		StringBuilder allType = new StringBuilder();

		/*
		 * type 안에있는 리스트들을 
		 * 쪼개어서 allType에 append 
		 */

		for(String a : type) {
			allType.append(a);
			if(a != type[type.length-1]) {
				allType.append(",");
			}
		}

		//vo에 오브젝트 저장
		vo.setTime(time+"");
		vo.setType(allType.toString());

		dao.insertMovie(vo);
	}

	@Override
	public void fileUpload(MovieVO vo, MultipartHttpServletRequest multi, HttpServletRequest request) {

		// 저장 경로 설정
		String root_path = request.getSession().getServletContext().getRealPath("/")+ ATTACH_PATH;
		String path = root_path+ multi.getParameter("title") + "\\";
		createFile(root_path);
		createFile(path);

		Iterator<String> files = multi.getFileNames();


		String newFileName = ""; // 업로드 되는 파일명

		

		while(files.hasNext()){
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName= mFile.getOriginalFilename();
			
			if(fileName != "") {
				System.out.println("실제 파일 이름 : " +fileName);
				
				//실제 이미지 파일 이름 따오기
				int index = fileName.indexOf(".");
				String realName = fileName;
				fileName = fileName.substring(0, index);
				
				//중복 검사 처리
				newFileName = System.currentTimeMillis()+"."
						+realName.substring(realName.lastIndexOf(".")+1);
				
//				System.out.println("DisPlayName : " + fileName);
				
				try {
					//파일 을 지정된 경로에 전송
					mFile.transferTo(new File(path+newFileName));
					
					//hashMap을 이용하여 정보들을 저장
					HashMap<String, Object> hm = new HashMap<>();
					hm.put("MID", vo.getId());
					hm.put("title", vo.getTitle());
					hm.put("oname", fileName);
					hm.put("newFileName", newFileName);
					
					dao.fileUpload(hm);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void deleteMovie(MovieVO vo, HttpServletRequest request) {
		 String root_path = request.getSession().getServletContext().getRealPath("/");
	      
	      String path = root_path + ATTACH_PATH + vo.getTitle() +"\\";
	      File file = new File(path);
	      File[] tempFile = file.listFiles();
	      
	     if(tempFile != null) {
	      for(File a : tempFile) {
	         if(a.isFile()) {
	            a.delete();
	         }
	         a.delete();
	      }
	      file.delete();
	     }
		dao.deleteMovie(vo);
	}

	@Override
	public void updateMovie(MovieVO vo) {
	}

	@Override
	public MovieVO getMovie(MovieVO vo) {
		return dao.getMovie(vo);
	}
	@Override
	public List<UploadFileVO> getMovieImage(MovieVO vo) {
		return dao.getMovieImage(vo);
	}

	@Override
	public UploadFileVO getMovieTitle(MovieVO vo) {
		return dao.getMovieTitle(vo);
	}

	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {
		return dao.getMovieList(vo);
	}

	@Override
	public List<MovieVO> searchMovie(MovieVO vo) {
		return dao.searchMovie(vo);
	}
	@Override
	public void  getNotOpeningMovie(MovieVO vo,Model model) {
     List<MovieVO> mvo = dao.getNotOpeningMovie(vo);
		model.addAttribute("notShowing" ,mvo);
	      List<UploadFileVO> listOpeningMovieTitle = new ArrayList<>();
      for(MovieVO fmvo : mvo) {
    	  listOpeningMovieTitle.add(dao.getMovieTitle(fmvo));
      }
      model.addAttribute("notShowingFile", listOpeningMovieTitle);
	}
	
	@Override
	public void  getOpeningMovie(MovieVO vo,Model model) {
		
		 List<MovieVO> mvo = dao.getOpeningMovie(vo);
			model.addAttribute("showing" ,mvo);
		      List<UploadFileVO> listNotOpeningMovieTitle = new ArrayList<>();
	      for(MovieVO fmvo : mvo) {
	    	  listNotOpeningMovieTitle.add(dao.getMovieTitle(fmvo));
	      }
	      model.addAttribute("showingFile", listNotOpeningMovieTitle);
	}
	
	@Override
	public List<MovieVO> getMovieSlide() {
		return dao.getMovieSlide();
	}

	@Override
	public UploadFileVO getMovieSildeImage(MovieVO vo) {
		return dao.getMovieSlideImage(vo);
	}

	//메소드

	private void createFile(String path) {
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
	}
	@Override
	public List<MovieVO> getAudience(MovieVO vo) {
		return dao.getAudience(vo);
	}

}
