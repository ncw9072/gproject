package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MusicDAO;
import vo.MusicVO;

@Service
public class MusicServiceimpl implements MusicService {

	@Autowired
	MusicDAO dao;

	@Override
	public List<MusicVO> genreList(MusicVO vo) {
		return dao.genreList(vo);
	} // genreList
	@Override
	public int genreRowCount(MusicVO vo) {
		return dao.genreRowCount(vo);
	}
	
	public List<MusicVO> selectList() {
		return dao.selectList();
	} // selectList

	public MusicVO selectOne(MusicVO vo) {
		return dao.selectOne(vo);
	} // selectOne

	public void musicCount(MusicVO vo) {
	
		dao.musicCount(vo);

	}

	public List<MusicVO> selectdailyRank() {
		// TODO Auto-generated method stub
		return dao.selectdailyRank();
	}
	
}
