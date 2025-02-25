package com.project.weekend.board.festi.festiQna;

import java.sql.Date;
import java.util.ArrayList;

import com.project.weekend.file.FileDTO;

public class FestiQnaDTO {
	private String qnum;
	private String num;
	private String title;
	private String writer;
	private String contents;
	private Date reg_date;
	private String ref;
	private int step;
	private int depth;
	private String pw;
	private int answer;
	private ArrayList<FileDTO> fileDTOs;
	
	public String getQnum() {
		return qnum;
	}
	public void setQnum(String qnum) {
		this.qnum = qnum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public ArrayList<FileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(ArrayList<FileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
}
