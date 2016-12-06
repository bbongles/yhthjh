package com.online.shop.pageutil;

public class PageMaker {
	private PageCriteria criteria;
	// 전체 게시글 개수
	private int totalCount;
	// 화면에서 보여지는 시작 페이지 링크의 번호
	private int startPageNum;
	// 화면에서 보여지는 끝 페이지 링크의 번호
	private int endPageNum;
	// 화면에서 보여질 페이지 링크의 개수
	private int numOfPageLink;
	// 이전, 다음 페이지 링크가 있는 지
	private boolean hasPrev;
	private boolean hasNext;

	public PageMaker() {
		numOfPageLink = 5;
	}

	public PageCriteria getCriteria() {
		return criteria;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getNumOfPageLink() {
		return numOfPageLink;
	}

	public boolean isHasPrev() {
		return hasPrev;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setCrieria(PageCriteria criteria) {
		this.criteria = criteria;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public void setPageData() {
		int maxPageLink = (int) Math.ceil((double) totalCount / criteria.getPerPage());

		int temp = (int) (Math.ceil(criteria.getPage() / (double) numOfPageLink) * numOfPageLink);
		if (temp < maxPageLink) {
			endPageNum = temp;
		} else {
			endPageNum = maxPageLink;
		}

		startPageNum = ((endPageNum - 1) / numOfPageLink) * numOfPageLink + 1;

		// startPageNum = endPageNum - numOfPageLink + 1;

		if (startPageNum == 1) {
			hasPrev = false;
		} else {
			hasPrev = true;
		}

		if (endPageNum * criteria.getPerPage() < totalCount) {
			hasNext = true;
		} else {
			hasNext = false;
		}
	}	
	
	
}
