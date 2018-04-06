package theater.member.board.model.ticket.impl.DAO;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import theater.member.board.model.ticket.MovieVO;
import theater.member.board.model.ticket.UploadFileVO;


@Repository
public class MovieDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	public int getSeqMovieID() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MovieDAO.getNextSeqMovieID");
	}
	
	public void insertMovie(MovieVO vo) {
		
		//추가
		mybatis.insert("MovieDAO.insertMovie",vo);
	}
	
	public void fileUpload(HashMap<String, Object> hm) {
		//MID와 ID를 생성
		int ID = mybatis.selectOne("MovieDAO.getNextSeqFileID");
		//HM에 PUT
		hm.put("ID", ID);
		
		mybatis.insert("MovieDAO.fileUpload",hm);
	}
	
	public void deleteMovie(MovieVO vo) {
		mybatis.delete("MovieDAO.deleteFile",vo);
		mybatis.delete("MovieDAO.deleteMovie",vo);
	}
	
	public void updateMovie(MovieVO vo) {
	}
	
	public MovieVO getMovie(MovieVO vo) {
		return mybatis.selectOne("MovieDAO.getMovie",vo);
	}
	
	public List<UploadFileVO> getMovieImage(MovieVO vo) {
		return mybatis.selectList("MovieDAO.getMovieImage", vo);
	}
	public UploadFileVO getMovieTitle(MovieVO vo) {
		return mybatis.selectOne("MovieDAO.getMovieTitle", vo);
	}
	public List<MovieVO> getMovieList(MovieVO vo){
		return mybatis.selectList("MovieDAO.getMovieList", vo);
	}
	
	public List<MovieVO> searchMovie(MovieVO vo){
		return mybatis.selectList("MovieDAO.searchMovie", vo);
	}
	public List<MovieVO> getNotOpeningMovie(MovieVO vo) {
		return mybatis.selectList("MovieDAO.getNotOpeningMovie",vo);
	}
	public List<MovieVO> getOpeningMovie(MovieVO vo) {
		return mybatis.selectList("MovieDAO.getOpeningMovie", vo);
	}
	public List<MovieVO> getAudience(MovieVO vo){
		return mybatis.selectList("MovieDAO.getAudience", vo);
	}
	
	public List<MovieVO> getMovieSlide() {
		return mybatis.selectList("MovieDAO.getMovieSlide");
	}
	

	public UploadFileVO getMovieSlideImage(MovieVO vo) {
		return mybatis.selectOne("MovieDAO.getMovieSlideImage",vo);
	}
	
}

