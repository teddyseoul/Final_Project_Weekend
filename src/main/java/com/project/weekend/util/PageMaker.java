package com.project.weekend.util;

import org.springframework.stereotype.Component;

@Component
public class PageMaker {
	private int perPage=10;
	private Integer curPage;
	private String kind;//title, writer, contents, all
	private String search;
	
	//rownum
	private int startRow;
	private int lastRow;
	
	//page
	private int totalBlock;
	private int curBlock;
	private int startNum;
	private int lastNum;
	
	
	/* 난슬 */
	private int category;	// festi/show 분류 때문에 추가
	private String num;		// after 분류
	private String region;
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getCategory() {
		if(category>6 || category<1) {
			this.category = 1;
		}
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	/* 난슬 끝*/
	
	
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public Integer getCurPage() {
		if(curPage == null) {
			this.curPage=1;
		}
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
		if(curPage == null) {
			this.curPage=1;
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if(search==null) {
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}

	
	//startRow, lastRow
	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.perPage+1;
		this.lastRow = this.curPage*perPage;
	}
	public void makePage(int totalCount) {
		//1. 전체 글의 갯수
		//2. totalPage 구하기
		int totalPage=totalCount/perPage;
		if(totalCount%perPage !=0) {
			totalPage++;
		}
		//3. totalBlock
		
		int perBlock=5;
		this.totalBlock=totalPage/perBlock;
		if(totalPage%perBlock !=0) {
			this.totalBlock++;
		}
		//4. curPage를 이용해서 curBlock
		this.curBlock=curPage/perBlock;
		if(this.curPage%perBlock !=0) {
			curBlock++;
		}
		//5. startNum, lastNum
		this.startNum=(this.curBlock-1)*perBlock+1;
		this.lastNum=this.curBlock*perBlock;
		//6. curBlock이 totalBlock일때
		if(this.curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
	}

}
