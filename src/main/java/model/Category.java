package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "danhmuc")
public class Category implements Serializable {
	
	private static final long serialVersionUID = 8640752176670851785L;

	@Id
	@Column(name = "madm")
	private String madm;

	@Column(name = "tendanhmuc")
	private String tendanhmuc;
	
	@Column(name = "ghichu")
	private String ghichu;

	public Category() {
	}

	public Category(String madm, String tendanhmuc, String ghichu) {
		this.madm = madm;
		this.tendanhmuc = tendanhmuc;
		this.ghichu = ghichu;
	}

	public String getMadm() {
		return madm;
	}

	public void setMadm(String madm) {
		this.madm = madm;
	}

	public String getTendanhmuc() {
		return tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	public String getGhichu() {
		return ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}
}
