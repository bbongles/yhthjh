package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.pageutil.PageCriteria;

@Repository
public class QnADAOImple implements QnADAO {
	
	private static final String NAMESPACE = "com.online.shop.QnAMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertQnA(QnaVO vo) {
		return session.insert(NAMESPACE + ".insert-qna", vo);
	}
	
	@Override
		public List<QnaVO> selectQna(int p_no) {
			return session.selectList(NAMESPACE + ".select-qna", p_no);
		}

	@Override
	public int insertQnAR(QnaRVO vo) {
		int result = 0;
		int result1 = session.insert(NAMESPACE+".insert-qnar", vo);
		System.out.println("imple result1:"+result1);
		if(result1 != 0){
			vo.setQna_reply(1);
			int result2 = session.update(NAMESPACE+".update-insert-qnar", vo);
			System.out.println("imple result2:"+result2);
			result = result2;
		}
		return result;
	}
	
/*	@Override
	public List<QnaRVO> selectQnaR(QnaVO vo) {
		return session.selectList(NAMESPACE+".select-qnar", vo);
	}*/
	
	@Override
	public QnaRVO selectQnaR(QnaVO vo) {
		return session.selectOne(NAMESPACE+".select-qnar", vo);
	}
	
	@Override
	public int updateQnAR(QnaRVO vo) {
		return session.update(NAMESPACE+".update-qnar", vo);
	}
	
	@Override
	public int deleteQnAR(QnaRVO vo) {
		int result = session.delete(NAMESPACE+".delete-qnar", vo);
		if(result == 1) {
			vo.setQna_reply(0);
			result = session.update(NAMESPACE+".update-insert-qnar", vo);
		}
		return result;
	}
	
	@Override
	public int getNumOfRecordsQna() {
		return session.selectOne(NAMESPACE + ".qnaTotalCount");
	}
	
	@Override
	public List<QnaVO> selectQna(PageCriteria cri) {
		return session.selectList(NAMESPACE + ".qnaListPage", cri);
	}
	
}
