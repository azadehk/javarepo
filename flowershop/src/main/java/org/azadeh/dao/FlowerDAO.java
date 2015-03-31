package org.azadeh.dao;

import java.util.List;

import org.azadeh.entity.FlowerModel;

public interface FlowerDAO {
	
	public void saveOrUpdate(FlowerModel category);
	 
    public FlowerModel getEntityById(long id) throws Exception;
    
	public List<FlowerModel> getEntityList() throws Exception;
	
	public boolean deleteEntity(long id) throws Exception;
	
}
