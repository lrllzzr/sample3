package kr.co.hta.login.vo;

import java.util.Date;

public class User {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String used;
	private Date createDdate;
	
	public User() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	public Date getCreateDdate() {
		return createDdate;
	}

	public void setCreateDdate(Date createDdate) {
		this.createDdate = createDdate;
	}
	
	
}
