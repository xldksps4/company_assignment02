package com.nd.cms.board.model.vo;

import com.nd.cms.common.Attachment;
import java.io.Serializable;
import java.util.List;

public class Board implements Serializable {
	private int board_no;
	private String board_title;
	private String board_content;
	private String board_enroll_date;
	private String board_modify_date;
	private String board_status;
	private int board_type_code;
	private String board_type_name;
	private int emp_no;
	private String emp_name;
	private List<Attachment> files;

	public Board() {
	}

	public Board(int board_no, String board_title, String board_content, String board_enroll_date,
			String board_modify_date, String board_status, int board_type_code, String board_type_name, int emp_no,
			String emp_name, List<Attachment> files) {
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_enroll_date = board_enroll_date;
		this.board_modify_date = board_modify_date;
		this.board_status = board_status;
		this.board_type_code = board_type_code;
		this.board_type_name = board_type_name;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.files = files;
	}

	public int getBoard_no() {
		return this.board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return this.board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return this.board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_enroll_date() {
		return this.board_enroll_date;
	}

	public void setBoard_enroll_date(String board_enroll_date) {
		this.board_enroll_date = board_enroll_date;
	}

	public String getBoard_modify_date() {
		return this.board_modify_date;
	}

	public void setBoard_modify_date(String board_modify_date) {
		this.board_modify_date = board_modify_date;
	}

	public String getBoard_status() {
		return this.board_status;
	}

	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}

	public int getBoard_type_code() {
		return this.board_type_code;
	}

	public void setBoard_type_code(int board_type_code) {
		this.board_type_code = board_type_code;
	}

	public String getBoard_type_name() {
		return this.board_type_name;
	}

	public void setBoard_type_name(String board_type_name) {
		this.board_type_name = board_type_name;
	}

	public int getEmp_no() {
		return this.emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_name() {
		return this.emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public List<Attachment> getFiles() {
		return this.files;
	}

	public void setFiles(List<Attachment> files) {
		this.files = files;
	}

	public String toString() {
		return "Board [board_no=" + this.board_no + ", board_title=" + this.board_title + ", board_content="
				+ this.board_content + ", board_enroll_date=" + this.board_enroll_date + ", board_modify_date="
				+ this.board_modify_date + ", board_status=" + this.board_status + ", board_type_code="
				+ this.board_type_code + ", board_type_name=" + this.board_type_name + ", emp_no=" + this.emp_no
				+ ", emp_name=" + this.emp_name + ", files=" + this.files + "]";
	}

	
}