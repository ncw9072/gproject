package service;

import java.util.List;

import vo.MusicVO;

public interface MusicService {
	
	public List<MusicVO> genreList(MusicVO vo);
	public List<MusicVO> selectList();
	public MusicVO selectOne(MusicVO vo);
	public void musicCount(MusicVO vo);
	public List<MusicVO> selectdailyRank();
	public int genreRowCount(MusicVO vo); // 해당장르의 곡 수 찾기
	
}// interface
