
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

import com.pzy.entity.MsgBoard;
import com.pzy.repository.MsgBoardRepository;

@Service
public class MsgBoardService {
	@Autowired
	private MsgBoardRepository msgboardRepository;
	public List<MsgBoard> findAll() {
		return (List<MsgBoard>) msgboardRepository.findAll();
	}

	public Page<MsgBoard> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<MsgBoard> spec = new Specification<MsgBoard>() {
			public Predicate toPredicate(Root<MsgBoard> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("msg").as(String.class), "%"
									+ name + "%"));
				}
				return predicate;
			}
		};
		Page<MsgBoard> result = (Page<MsgBoard>) msgboardRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public Page<MsgBoard> findAll(final int pageNumber, final int pageSize,
			final Date start, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));
		Specification<MsgBoard> spec = new Specification<MsgBoard>() {
			public Predicate toPredicate(Root<MsgBoard> root,
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
		Page<MsgBoard> result = (Page<MsgBoard>) msgboardRepository.findAll(spec,
				pageRequest);
		return result;
	}

	public void delete(Long id) {
		msgboardRepository.delete(id);
	}

	public MsgBoard find(Long id) {
		return msgboardRepository.findOne(id);
	}

	public void save(MsgBoard msgboard) {
		msgboardRepository.save(msgboard);
	}
}