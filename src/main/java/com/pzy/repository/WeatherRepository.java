package com.pzy.repository;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Weather;
public interface WeatherRepository extends PagingAndSortingRepository<Weather, Long>,JpaSpecificationExecutor<Weather>{
	@Query("select weather from Weather weather where nowDate>=?1 and nowDate <=?2 and city.id=?3 order by nowDate")
	public List<Weather> findWeather(Date start, Date end, Integer cityid);
	@Query(value="delete from t_weather where now_date=?1)",nativeQuery=true)
	public void deleteWeather(Date start);
	
	public List<Weather> findByNowDate(Date date);
}

