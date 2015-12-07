
package com.pzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pzy.entity.City;
import com.pzy.repository.CityRepository;
/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class CityService {
     @Autowired
     private CityRepository cityRepository;
     public List<City> findAll() {
         return (List<City>) cityRepository.findAll();
     }
    
	 public City find(Long id){
		 return cityRepository.findOne(id);
	 }
		
}