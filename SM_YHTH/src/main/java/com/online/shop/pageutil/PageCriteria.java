package com.online.shop.pageutil;

public class PageCriteria {

	private int page;
	private int perPage;

	public PageCriteria() {
		this.page = 1;
		this.perPage = 5;
	}

	public PageCriteria(int page, int perPage) {
		this.page = page;
		this.perPage = perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getStart() {
		int start = (page - 1) * perPage + 1;
		return start;
	}
	
	public int getEnd() {
		int end = page * perPage;
		return end;
	}

}
