package com.pzy.service;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Weather;
import com.pzy.repository.WeatherRepository;

@Service
public class WeatherService {
	@Autowired
	private WeatherRepository weatherRepository;

	public List<Weather> findAll() {
		return (List<Weather>) weatherRepository.findAll();
	}
	public List<Weather> findAll(final Date start,final Date end,final Integer cityid) {
		Specification<Weather> spec = new Specification<Weather>() {
			public Predicate toPredicate(Root<Weather> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (start != null) {
					predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("nowDate").as(Date.class), start));
				}
				if (end != null) {
					predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("nowDate").as(Date.class), end));
				}
				if (cityid != null) {
					predicate.getExpressions().add(cb.equal(root.get("city").get("id").as(Integer.class), cityid));
				}
				return predicate;
			}
		};
		return  weatherRepository.findAll(spec,new Sort(Direction.DESC, "nowDate"));
	}
	public Page<Weather> findAll(final int pageNumber, final int pageSize, final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
		Specification<Weather> spec = new Specification<Weather>() {
			public Predicate toPredicate(Root<Weather> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(cb.like(root.get("city").get("name").as(String.class), "%" + name + "%"));
				}
				return predicate;
			}
		};
		Page<Weather> result = (Page<Weather>) weatherRepository.findAll(spec, pageRequest);
		return result;
	}

	public Page<Weather> findAll(final int pageNumber, final int pageSize, final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
		Specification<Weather> spec = new Specification<Weather>() {
			public Predicate toPredicate(Root<Weather> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (start != null) {
					predicate.getExpressions().add(cb.greaterThan(root.get("createDate").as(Date.class), start));
				}
				if (end != null) {
					predicate.getExpressions().add(cb.lessThan(root.get("createDate").as(Date.class), end));
				}
				return predicate;
			}
		};
		Page<Weather> result = (Page<Weather>) weatherRepository.findAll(spec, pageRequest);
		return result;
	}

	public void delete(Long id) {
		weatherRepository.delete(id);
	}

	public Weather find(Long id) {
		return weatherRepository.findOne(id);
	}

	public void save(Weather weather) {
		weatherRepository.save(weather);
	}
	public void deleteall(Date	 date) {
		weatherRepository.deleteWeather(date);
	}
	public List<Weather> findAll(Date date) {
		return (List<Weather>) weatherRepository.findByNowDate(date);
	}
}