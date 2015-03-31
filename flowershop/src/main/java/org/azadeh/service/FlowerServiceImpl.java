package org.azadeh.service;

import java.util.List;

import org.azadeh.dao.FlowerDAO;
import org.azadeh.entity.FlowerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * @author azadeh.kosari@gmail.com
 * @version 0.1.20150330
 * @change 
 * @target
 * 
 */
 

@Service
public class FlowerServiceImpl implements FlowerService {

	@Autowired
	FlowerDAO flowerDAO; 
	
	@Override
	public void saveOrUpdate(FlowerModel flower) {
		flowerDAO.saveOrUpdate(flower);

	}

	@Override
	public FlowerModel getEntityById(long id) throws Exception {
		FlowerModel flower = flowerDAO.getEntityById(id);
		return flower ;
	}

	@Override
	public List<FlowerModel> getEntityList() throws Exception {
		List<FlowerModel> flowers = flowerDAO.getEntityList();
		return flowers;
	}

	@Override
	public boolean deleteEntity(long id) throws Exception {
		flowerDAO.deleteEntity(id);
		return false;
	}
	
	

}
