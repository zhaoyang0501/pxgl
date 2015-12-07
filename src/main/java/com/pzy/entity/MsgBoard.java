package com.pzy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@Table(name = "t_msgboard")
public class MsgBoard {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private MsgBoard replyfor;
	
	private String msg;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date createDate;
	
	
	public void setReplyfor(MsgBoard replyfor) {
		this.replyfor = replyfor;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public MsgBoard getReplyfor() {
		return replyfor;
	}
}
