package com.online.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.ImageVO;
import com.online.shop.domain.OptionVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.service.ProductService;

@Controller // 스프링 프레임워크에 Controller bean 객체로 등록
@RequestMapping(value="/seller")
public class ProductController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductController.class);
	
	@Autowired 
	ProductService productService;
	
	@RequestMapping(value="pRegister", method=RequestMethod.GET)
	public void registerGET() {
		
	} // end registerGET()
	
	@RequestMapping(value="pRegister", method=RequestMethod.POST)
	public String registerPOST(ProductVO pVo, String[] o_title, String[] o_cont, int[] o_stock, 
			String[] i_img, String[] i_cont) {
		
		// 서비스 객체를 사용해서 DB insert
		
		// 상품 정보 insert
		logger.info("p_name: " + pVo.getP_name());
		
		int pResult = productService.createProduct(pVo);
		
		// 상품의 상품번호 받아오기
		int pno = productService.readProductNo(pVo.getS_id());
		logger.info("p_no: " + pno);
		
		// 옵션 정보 insert
		logger.info("o_title: " + o_title);
		
		for (int i = 0; i < o_title.length; i++) {
			
			OptionVO oVo = new OptionVO();
			
			oVo.setO_title(o_title[i]);
			oVo.setO_cont(o_cont[i]);
			oVo.setO_stock(o_stock[i]);
			oVo.setP_name(pVo.getP_name());
			oVo.setS_id(pVo.getS_id());
			oVo.setP_no(pno);
			
			int oResult = productService.createOption(oVo);
		}
		
		// 이미지 정보 insert
		logger.info("i_img: " + i_img);
		
		for (int i = 0; i < i_img.length; i++) {
			ImageVO iVo = new ImageVO();
			iVo.setI_img(i_img[i]);
			iVo.setI_cont(i_cont[i]);
			iVo.setP_name(pVo.getP_name());
			iVo.setS_id(pVo.getS_id());
			iVo.setP_no(pno);
			
			int iResult = productService.createImage(iVo);
		}
		
		return "redirect:pList?s_id=" + pVo.getS_id();
		
	} // end registerPOST()
	
	@RequestMapping(value="pDelete", method=RequestMethod.POST)
	public String pDelete(int p_no, RedirectAttributes attr) {
		logger.info("pDelete() 호출 : p_no = " + p_no);
		
		int oResult = productService.deleteOptionByPno(p_no);
		int iResult = productService.deleteImageByPno(p_no);
		int pResult = productService.deleteProductByPno(p_no);
		
		
		if (oResult == 1 && iResult == 1 && pResult == 1) {
			attr.addFlashAttribute("delete_result", "success");
		} else {
			attr.addFlashAttribute("delete_result", "fail");
		}
		attr.addFlashAttribute("p_no", p_no);
		
		return "redirect:pList";
	}

} // end class ProductController 
