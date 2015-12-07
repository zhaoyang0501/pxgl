package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Teacher;
public interface TeacherRepository extends PagingAndSortingRepository<Teacher, Long>,JpaSpecificationExecutor<Teacher>{
    public List<Teacher> findByIdAndPassword(String id,String password);
    public List<Teacher> findByUsernameAndPassword(String userName,String password);
}

