package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;

public interface RevDAO {
	public abstract int insertRev(ReviewVO vo);
	public abstract List<ReviewVO> selectRev(int p_no);
	public abstract int insertRevReply(ReviewRVO vo);
	public abstract ReviewRVO selectRevReply(int rev_no);
	public abstract int updateRevReply(ReviewRVO vo);
	public abstract int deleteRevReply(ReviewRVO vo);
	
	public abstract int getNumOfPageReview();
	
	public abstract List<ReviewVO> selectRev(PageCriteria cri);
	
}
