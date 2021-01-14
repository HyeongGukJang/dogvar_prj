package org.comstudy21.myapp.message;

import java.io.Serializable;

public class MessageVO implements Serializable{
	private int seq;
	private String recv_id;
	private String send_id;
	private String name;
	private String content;
	private String send_date;
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public MessageVO() {
		this(0, "", "", "", "", "", 1, 5);
	}

	public MessageVO(int seq) {
		this(seq, "", "", "", "", "", 1, 5);
	}

	public MessageVO(int seq, String recv_id, String send_id, String name, String content,
			String send_date, int page, int perPageNum) {
		this.seq = seq;
		this.recv_id = recv_id;
		this.send_id = send_id;
		this.name = name;
		this.content = content;
		this.send_date = send_date;
		this.page = page;
		this.perPageNum = perPageNum;

	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	@Override
	public String toString() {
		return "MessageVO [seq=" + seq + ", recv_id=" + recv_id + ", send_id=" + send_id + ", name=" + name
				+ ", content=" + content + ", send_date=" + send_date + ", page=" + page + ", perPageNum=" + perPageNum
				+ ", rowStart=" + rowStart + ", rowEnd=" + rowEnd + "]";
	}
}
