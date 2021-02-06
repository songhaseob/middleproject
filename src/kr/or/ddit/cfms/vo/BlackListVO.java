package kr.or.ddit.cfms.vo;

public class BlackListVO {
	private String list_num;
	private String title;
	private String writer;
	private String wr_dt;
	private String cont;
	private String reported_cus;
	private String cus_id;
	private int prod_num;
	
	
	
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getList_num() {
		return list_num;
	}
	public void setList_num(String list_num) {
		this.list_num = list_num;
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
	public String getWr_dt() {
		return wr_dt;
	}
	public void setWr_dt(String wr_dt) {
		this.wr_dt = wr_dt;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getReported_cus() {
		return reported_cus;
	}
	public void setReported_cus(String reported_cus) {
		this.reported_cus = reported_cus;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	
	
}
