package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Plan;
public interface PlanRepository extends PagingAndSortingRepository<Plan, Long>,JpaSpecificationExecutor<Plan>{
}

