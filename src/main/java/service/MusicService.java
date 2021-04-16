package service;

import java.util.List;

import criteria.Criteria;
import vo.MusicVO;

public interface MusicService {

	public List<MusicVO> releasedateList(Criteria cri);
	public int releasedateRowCount(); // 해당장르의 곡 수 찾기

	public List<MusicVO> genreList(Criteria cri);
	public int genreRowCount(MusicVO vo); // 해당장르의 곡 수 찾기
	public List<MusicVO> selectList();
	public MusicVO selectOne(MusicVO vo);
	public void musicCount(MusicVO vo);
	
	
}// interface
