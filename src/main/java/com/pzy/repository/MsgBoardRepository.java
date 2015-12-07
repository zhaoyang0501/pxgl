package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.MsgBoard;
public interface MsgBoardRepository extends PagingAndSortingRepository<MsgBoard, Long>,JpaSpecificationExecutor<MsgBoard>{
}

