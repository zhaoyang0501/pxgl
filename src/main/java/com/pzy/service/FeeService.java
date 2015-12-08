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

import com.pzy.entity.Fee;
import com.pzy.repository.FeeRepository;

@Service
public class FeeService {
	@Autowired
	private FeeRepository feeRepository;
	public List<Fee> findAll() {
		return (List<Fee>) feeRepository.findAll(new Sort(Direction.DESC, "id"));
	}

	public Page<Fee> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Fee> spec = new Specification<Fee>() {
			public Predicate toPredicate(Root<Fee> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("user").get("name").as(String.class), "%"
									+ name + "%"));
				}
				return predicate;
			}
		};
		Page<Fee> result = (Page<Fee>) feeRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<Fee> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<Fee> spec = new Specification<Fee>() {
			public Predicate toPredicate(Root<Fee> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (start != null) {
					predicate.getExpressions().add(
							cb.greaterThan(root.get("createDate")
									.as(Date.class), start));
				}
				if (end != null) {
					predicate.getExpressions().add(
							cb.lessThan(root.get("createDate").as(Date.class),
									end));
				}
				return predicate;
			}
		};
		Page<Fee> result = (Page<Fee>) feeRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		feeRepository.delete(id);
	}

	public Fee find(Long id) {
		return feeRepository.findOne(id);
	}

	public void save(Fee fee) {
		feeRepository.save(fee);
	}
}