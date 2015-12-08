package com.pzy.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_fee")
public class Fee {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	
	private String year;
	private Double needa;
	private Double needb;
	private Double needc;
	private Double realb;
	private Double realc;
	
	private Double resta;
	private Double restb;
	private Double restc;
	
	
	private String state;
	private Double reala;
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public Double getNeeda() {
		return needa;
	}


	public void setNeeda(Double needa) {
		this.needa = needa;
	}


	public Double getNeedb() {
		return needb;
	}


	public void setNeedb(Double needb) {
		this.needb = needb;
	}


	public Double getNeedc() {
		return needc;
	}


	public void setNeedc(Double needc) {
		this.needc = needc;
	}


	public Double getReala() {
		return reala;
	}


	public void setReala(Double reala) {
		this.reala = reala;
	}


	public Double getRealb() {
		return realb;
	}


	public void setRealb(Double realb) {
		this.realb = realb;
	}


	public Double getRealc() {
		return realc;
	}


	public void setRealc(Double realc) {
		this.realc = realc;
	}


	public Double getResta() {
		return resta;
	}


	public void setResta(Double resta) {
		this.resta = resta;
	}


	public Double getRestb() {
		return restb;
	}


	public void setRestb(Double restb) {
		this.restb = restb;
	}


	public Double getRestc() {
		return restc;
	}


	public void setRestc(Double restc) {
		this.restc = restc;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	
}
