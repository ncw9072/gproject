package service;

import java.util.List;

import vo.MusicVO;

public interface MusicService {
	
	public List<MusicVO> genreList(MusicVO vo);
	public List<MusicVO> selectList();
	public MusicVO selectOne(MusicVO vo);
	public void musicCount(MusicVO vo);
	public List<MusicVO> selectdailyRank();
	
	
}// interface
