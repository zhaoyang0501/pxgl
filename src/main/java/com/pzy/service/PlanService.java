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
import com.pzy.entity.Plan;
import com.pzy.repository.PlanRepository;

@Service
public class PlanService {
	@Autowired
	private PlanRepository planRepository;
	public List<Plan> findAll() {
		return (List<Plan>) planRepository.findAll(new Sort(Direction.DESC, "createDate"));
	}
	public List<Plan> findAll(final Date start,final Date end) {
		Specification<Plan> spec = new Specification<Plan>() {
			public Predicate toPredicate(Root<Plan> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (start != null) {
					predicate.getExpressions().add(
							cb.greaterThan(root.get("date").as(Date.class), start));
				}
				if (end != null) {
					predicate.getExpressions().add(
							cb.lessThan(root.get("date").as(Date.class), end));
				}
				return predicate;
			}
		};
		return planRepository.findAll(spec);
	}

	public Page<Plan> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Plan> spec = new Specification<Plan>() {
			public Predicate toPredicate(Root<Plan> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("lesson").get("name").as(String.class), "%"
									+ name + "%"));
				}
				return predicate;
			}
		};
		Page<Plan> result = (Page<Plan>) planRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<Plan> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<Plan> spec = new Specification<Plan>() {
			public Predicate toPredicate(Root<Plan> root,
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
		Page<Plan> result = (Page<Plan>) planRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		planRepository.delete(id);
	}

	public Plan find(Long id) {
		return planRepository.findOne(id);
	}

	public void save(Plan plan) {
		planRepository.save(plan);
	}
}