package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MusicVO;

// ** Board CRUD 구현
@Repository
public class MusicDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NS = "com.ncs.MusicMapper.";
	
	// ** genreList
	public List<MusicVO> genreList(MusicVO vo) {
		return sqlSession.selectList(NS + "genreList", vo);
	} // genreList
	public int genreRowCount(MusicVO vo) {
		return sqlSession.selectOne(NS+ "genreRowCount",vo);
	}
	
	// ** selectList
	public List<MusicVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	} // selectList

	// ** selctOne
	public MusicVO selectOne(MusicVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	} // selctOne

	public void musicCount(MusicVO vo) {
		sqlSession.update(NS + "musicCount", vo);
	}

	public List<MusicVO> selectdailyRank() {
		return sqlSession.selectList(NS + "selectdailyRank");
	}

} // class
