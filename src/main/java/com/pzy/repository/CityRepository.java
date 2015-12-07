package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.City;
public interface CityRepository extends PagingAndSortingRepository<City, Long>,JpaSpecificationExecutor<City>{
}

