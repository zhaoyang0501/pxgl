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

import com.pzy.entity.Lesson;
import com.pzy.entity.Score;
import com.pzy.entity.User;
import com.pzy.repository.ScoreRepository;

@Service
public class ScoreService {
	@Autowired
	private ScoreRepository scoreRepository;
	public List<Score> findAll() {
		return (List<Score>) scoreRepository.findAll(new Sort(Direction.DESC, "id"));
	}
	public List<Score> findAll(final Lesson lesson,final User user) {
		Specification<Score> spec = new Specification<Score>() {
			public Predicate toPredicate(Root<Score> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (user != null) {
					predicate.getExpressions().add(cb.equal(root.get("user").as(User.class), user));
				}
				if (lesson != null) {
					predicate.getExpressions().add(cb.equal(root.get("lesson").as(Lesson.class), lesson));
				}
				return predicate;
			}
		};
		return scoreRepository.findAll(spec);
	}
	public Page<Score> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Score> spec = new Specification<Score>() {
			public Predicate toPredicate(Root<Score> root,CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(cb.like(root.get("user").get("name").as(String.class), "%"+ name + "%"));
				}
				return predicate;
			}
		};
		Page<Score> result = (Page<Score>) scoreRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<Score> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<Score> spec = new Specification<Score>() {
			public Predicate toPredicate(Root<Score> root,
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
		Page<Score> result = (Page<Score>) scoreRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		scoreRepository.delete(id);
	}

	public Score find(Long id) {
		return scoreRepository.findOne(id);
	}

	public void save(Score score) {
		scoreRepository.save(score);
	}
}