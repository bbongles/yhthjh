package com.online.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;

@Controller
@RequestMapping(value="/seller")
public class QnRController {

	@Autowired
	private QnADAO dao;
	
	@Autowired
	private RevDAO daoR;
	
	//최초화면에서 qna와 review 리스트를 가져와 화면에 출력
	@RequestMapping(value="qnr", method=RequestMethod.GET)
	public void qaMain(Integer page, QnaVO vo, Model model) {
		
		//System.out.println("qnrController");
		// 페이지 criteria 생성자 만들기
		PageCriteria c = new PageCriteria();
		if (page != null){
			c.setPage(page);
		}
		
		List<QnaVO> list = dao.selectQna(c);

		List<QnaRVO> listR = new ArrayList<>();
		for(QnaVO volist : list) {
			if(volist.getQna_reply() == 1) {
			QnaRVO rvo = dao.selectQnaR(volist);
			listR.add(rvo);
			}
		}

		
		List<ReviewVO>list1 = daoR.selectRev(c);
		List<ReviewRVO> list2 = new ArrayList<>();
		for(ReviewVO volist : list1) {
			if(volist.getRev_reply() == 1) {
			ReviewRVO vo1 = daoR.selectRevReply(volist.getRev_no());
			list2.add(vo1);
			
			}
		}
		
		model.addAttribute("listQnA", list);
		model.addAttribute("listQnAR", listR);
				
		model.addAttribute("listRev", list1);
		model.addAttribute("listReply", list2);
		
		// 페이지 메이커 생성
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfRecordsQna());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}
	
	//구매자가 qna를 등록하기위한 페이지 띄움
	@RequestMapping(value="insertQnA", method=RequestMethod.GET)
	public void insertQnA(int p_no, String b_id, Model model) {
		model.addAttribute("p_no", p_no);
		model.addAttribute("b_id", b_id);
	}
	
	//구매자가 qna를 작성하고 등록버튼을 클릭했을때 처리
	@RequestMapping(value="insertQnA", method=RequestMethod.POST)
	public void insertQnAPOST(QnaVO vo) {
		System.out.println("insert qna Post");
		//System.out.println("vo:"+ vo.getB_email() + "/"+vo.getQna_cont());
		
		int result = dao.insertQnA(vo);
		//return "redirect:qnr";
	}
	
	//qna에 판매자가 답글을 등록하는 과정
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReplyPost(QnaRVO vo, RedirectAttributes attr) {
		int result=0;
		System.out.println("/////////////////"+vo.getQna_r_cont());

		if(!(vo.getQna_r_cont().equals(""))) {
			result = dao.insertQnAR(vo);
			System.out.println("result cont:"+result);
		} else{
			result = 0;
		}

		if (result == 1) {
			attr.addFlashAttribute("insert_reply", "success");
		} else {
			attr.addFlashAttribute("insert_reply", "fail");
		}
		
		return "redirect:pDetail?p_no="+vo.getP_no();
	}
	
	//qna 답글을 수정하는 과정
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public String updateReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.updateQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:pDetail?p_no="+vo.getP_no();
	}
	
	//qna 답글을 삭제하는 과정
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public String deleteReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.deleteQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:pDetail?p_no="+vo.getP_no();
	}
	
	//구매자가 후기를 등록하기위한 페이지
	@RequestMapping(value="insertReview", method=RequestMethod.GET)
	public void insertReview(int p_no, String b_id, Model model) {
		//System.out.println("vovovovovovvovovo");
		model.addAttribute("p_no", p_no);
		model.addAttribute("b_id", b_id);
	}
	
	//구매자가 후기를 작성하고 저장하는 과정
	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public void insertReviewPOST(ReviewVO vo) {
		System.out.println("vo: "+ vo.getRev_score());
		System.out.println("vo: " + vo.getRev_cont());
		
		int result = daoR.insertRev(vo);
		//System.out.println("insert 결과: "+result);
		
	}
	
	//구매자가 작성한 후기에 판매자가 답글 등록
	@RequestMapping(value="insertrevReply", method=RequestMethod.POST)
	public String insertReplyPost(ReviewRVO vo, RedirectAttributes attr) {

		//int result = dao.insertRevReply(vo);
		int result=0;
		if(!(vo.getRev_r_cont().equals(""))) {
			result = daoR.insertRevReply(vo);
			System.out.println("result cont:"+result);
		} else{
			result = 0;
		}

		if (result == 1) {
			attr.addFlashAttribute("insert_review_reply", "success");
		} else {
			attr.addFlashAttribute("insert_review_reply", "fail");
		}

		return "redirect:pDetail?p_no="+vo.getP_no();
	}
	
	//구매자가 등록한 후기에 답글을 수정하는 과정
	@RequestMapping(value="updaterevReply", method=RequestMethod.POST)
	public String updateReplyPOST(ReviewRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = daoR.updateRevReply(vo);
		System.out.println("result: " +result);
		return "redirect:pDetail?p_no="+vo.getP_no();
	}
	
	//구매자가 등록한 후기에 답글을 삭제하는 과정
	@RequestMapping(value="deleterevReply", method=RequestMethod.POST)
	public String deleteReplyPOST(ReviewRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = daoR.deleteRevReply(vo);
		System.out.println("result: " +result);
		return "redirect:pDetail?p_no="+vo.getP_no();
	}
}
