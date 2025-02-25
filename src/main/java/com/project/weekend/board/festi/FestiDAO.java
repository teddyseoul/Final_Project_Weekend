package com.project.weekend.board.festi;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.weekend.util.PageMaker;

@Repository
public class FestiDAO{
	
	@Inject
	private SqlSession SqlSession;
	private static final String NAMESPACE = "FestiMapper.";
	
	public int getNum() throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getNum");
	}

	public int setWrite(FestiDTO festiDTO) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.insert(NAMESPACE+"setWrite", festiDTO);
	}
	
	public List<FestiDTO> getList(PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int getCount(Integer category) throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getCount", category);
	}
	
	public FestiDTO getSelect(String num) throws Exception{

		FestiDTO festiDTO = SqlSession.selectOne(NAMESPACE+"getSelect", num);

		return festiDTO;
	}
	
	public List<FestiDTO> getTop() throws Exception{
		return SqlSession.selectList(NAMESPACE+"getTop");
	}
	
	public int setUpdate(FestiDTO festiDTO) throws Exception{
		return SqlSession.update(NAMESPACE+"setUpdate", festiDTO);
	}
	
	public int setDelete(String num) throws Exception{
		return SqlSession.delete(NAMESPACE+"setDelete", num);
	}
	
	public int setHitUpdate(String num) throws Exception{
		return SqlSession.update(NAMESPACE+"setHitUpdate", num);
	}
	
	public double getPointAvg(PageMaker pageMaker) throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getPointAvg", pageMaker);
	}
	
	// 상혁;
	// 관리자용;
	// 종류별 게시글 가져오기;
	// w추천, 유저추천, 공연, 축제, 대학로;
	// w 추천, 유저 추천은 아래에서 메서드 사용;
	// 공연 리스트;
	public List<FestiDTO> getCate1List(HttpSession session, PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getCate1List", pageMaker);
	}
	// 축제 리스트;
	public List<FestiDTO> getCate2List(HttpSession session, PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getCate2List", pageMaker);
	}
	// 대학로 리스트;
	public List<FestiDTO> getCate3List(HttpSession session, PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getCate3List", pageMaker);
	}
	// 내가 쓴 글 가져오기;
	// 2레벨;
	public List<FestiDTO> getListMy(PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getListMy", pageMaker);
	}
	// w추천;
	// 리스트;
	public List<FestiDTO> getWeekRecoList(HttpSession session, PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getWeekRecoList", pageMaker);
	}
	// 글선택;
	public FestiDTO getWeekRecoSelect(String num) throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getWeekRecoSelect", num);
	}
	// 글쓰기;
	public int setWeekRecoWrite(FestiDTO festiDTO) throws Exception{
		return SqlSession.insert(NAMESPACE+"setWeekRecoWrite", festiDTO);
	}
	// 글수정;
	public int setWeekRecoUpdate(FestiDTO festiDTO) throws Exception{
		return SqlSession.update(NAMESPACE+"setWeekRecoUpdate", festiDTO);
	}
	// 글삭제;
	public int setWeekRecoDelete(String num) throws Exception{
		return SqlSession.delete(NAMESPACE+"setWeekRecoDelete", num);
	}
	// 유저 추천;
	// 리스트;
	public List<FestiDTO> getUserRecoList(HttpSession session, PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getUserRecoList", pageMaker);
	}
	// 글선택;
	public FestiDTO getUserRecoSelect(String num) throws Exception{
		return SqlSession.selectOne(NAMESPACE+"getUserRecoSelect", num);
	}
	// 글쓰기;
	public int  setUserRecoWrite(FestiDTO festiDTO) throws Exception{
		return SqlSession.insert(NAMESPACE+"setUserRecoWrite", festiDTO);
	}
	// 글수정;
	public int setUserRecoUpdate(FestiDTO festiDTO) throws Exception{
		return SqlSession.update(NAMESPACE+"setUserRecoUpdate", festiDTO);
	}
	// 글삭제;
	public int setUserRecoDelete(String num) throws Exception{
		return SqlSession.delete(NAMESPACE+"setUserRecoDelete", num);
	}
	// 랭크;
	// 리스트;
	public List<FestiDTO> getRankList(PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getRankList", pageMaker);
	}
	// 상혁 끝;
	// 원식 홈 랭크;
	public List<FestiDTO> getHomeRankList() throws Exception{
		return SqlSession.selectList(NAMESPACE+"getHomeRankList");
	}
	public List<FestiDTO> getHomeRankList2() throws Exception{
		return SqlSession.selectList(NAMESPACE+"getHomeRankList2");
	}
	// 원식 홈 베스트;
	public List<FestiDTO> getBestList(PageMaker pageMaker) throws Exception{
		return SqlSession.selectList(NAMESPACE+"getBestList", pageMaker);
	}

}

