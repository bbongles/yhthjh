package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;

@Repository
public class RevDAOImple implements RevDAO {

	private static final String NAMESPACE = "com.online.shop.RevMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertRev(ReviewVO vo) {
		System.out.println("daoImple" + vo.getRev_cont());
		return session.insert(NAMESPACE + ".insert-rev", vo);
	}
	
	@Override
	public List<ReviewVO> selectRev(int p_no) {
		return session.selectList(NAMESPACE + ".select-rev", p_no);
	}

	@Override
	public int insertRevReply(ReviewRVO vo) {
		int result = session.insert(NAMESPACE + ".insert-revReply", vo);
		
		if(result == 1){
			vo.setRev_reply(1);
			int result1 = session.update(NAMESPACE+".update-insert-revR", vo);

			result = result1;
		}
		
		return result;
	}
	
	@Override
	public ReviewRVO selectRevReply(int rev_no) {
		return session.selectOne(NAMESPACE+".select-revReply", rev_no);
	}
	
	@Override
	public int updateRevReply(ReviewRVO vo) {
		return session.update(NAMESPACE+".update-revR", vo);
	}
	
	@Override
	public int deleteRevReply(ReviewRVO vo) {
		int result = session.delete(NAMESPACE+".delete-revR", vo);
		if(result == 1) {
			vo.setRev_reply(0);
			result = session.update(NAMESPACE+".update-insert-revR", vo);
		}
		return result;
	}
	
	@Override
	public int getNumOfPageReview() {
		return session.selectOne(NAMESPACE + ".reviewTotalCount");
	}
	
	@Override
	public List<ReviewVO> selectRev(PageCriteria cri) {
		return session.selectList(NAMESPACE + ".reviewListPage", cri);
	}
	
	
}
