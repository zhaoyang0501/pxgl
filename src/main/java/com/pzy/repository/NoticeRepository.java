package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Notice;
public interface NoticeRepository extends PagingAndSortingRepository<Notice, Long>,JpaSpecificationExecutor<Notice>{
}

