package theater.member.board.model.ticket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MovieService {
	public int getSeqMovieID();
	public void insertMovie(MovieVO vo, String[] type, int time);
	public void fileUpload(MovieVO vo, MultipartHttpServletRequest multi, HttpServletRequest request);
	public void updateMovie(MovieVO vo);
	public MovieVO getMovie(MovieVO vo);
	public UploadFileVO getMovieTitle(MovieVO vo);
	public List<UploadFileVO> getMovieImage(MovieVO vo);
	public List<MovieVO> getMovieList(MovieVO vo);
	public List<MovieVO> searchMovie(MovieVO vo);
	public void getNotOpeningMovie(MovieVO vo, Model model);
	public void getOpeningMovie(MovieVO vo,Model model);
	public void deleteMovie(MovieVO vo, HttpServletRequest request);
	public List<MovieVO> getAudience(MovieVO vo);
	public List<MovieVO> getMovieSlide();
	public UploadFileVO getMovieSildeImage(MovieVO mvo);
}
