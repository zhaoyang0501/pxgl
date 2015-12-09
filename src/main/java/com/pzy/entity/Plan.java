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
@Table(name = "t_plan")
public class Plan {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	private Date date;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
	private Date  start;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm" ,timezone="GMT+8")
	private Date end;
	@ManyToOne(fetch = FetchType.EAGER)
	private Lesson lesson;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	private Date createDate;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
