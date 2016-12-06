package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.pageutil.PageCriteria;

public interface QnADAO {

	public abstract int insertQnA(QnaVO vo);
	public abstract List<QnaVO> selectQna(int p_no);
	public abstract int insertQnAR(QnaRVO vo);
/*	public abstract List<QnaRVO> selectQnaR(QnaVO vo);*/
	public abstract QnaRVO selectQnaR(QnaVO vo);
	public abstract int updateQnAR(QnaRVO vo);
	public abstract int deleteQnAR(QnaRVO vo);
	
	public abstract List<QnaVO> selectQna(PageCriteria cri);
	
	public abstract int getNumOfRecordsQna();
	
	
	
}
