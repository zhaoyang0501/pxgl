package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.pzy.entity.Fee;
public interface FeeRepository extends PagingAndSortingRepository<Fee, Long>,JpaSpecificationExecutor<Fee>{
}

