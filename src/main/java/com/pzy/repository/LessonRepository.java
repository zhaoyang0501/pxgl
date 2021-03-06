package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Lesson;
public interface LessonRepository extends PagingAndSortingRepository<Lesson, Long>,JpaSpecificationExecutor<Lesson>{
}

