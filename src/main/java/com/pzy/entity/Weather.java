package com.pzy.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
/***
 *
 */
@Entity
@Table(name = "t_weather")
public class Weather implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date nowDate;
	@ManyToOne(fetch = FetchType.EAGER)
	private City city;
	private String type;
	private Double temmax;
	private Double temmin;
	private Double aqi;
	private Double pm25;
	private Double sd;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getNowDate() {
		return nowDate;
	}
	public void setNowDate(Date nowDate) {
		this.nowDate = nowDate;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getTemmax() {
		return temmax;
	}
	public void setTemmax(Double temmax) {
		this.temmax = temmax;
	}
	public Double getTemmin() {
		return temmin;
	}
	public void setTemmin(Double temmin) {
		this.temmin = temmin;
	}
	public Double getAqi() {
		return aqi;
	}
	public void setAqi(Double aqi) {
		this.aqi = aqi;
	}
	public Double getPm25() {
		return pm25;
	}
	public void setPm25(Double pm25) {
		this.pm25 = pm25;
	}
	public Double getSd() {
		return sd;
	}
	public void setSd(Double sd) {
		this.sd = sd;
	}
	
}