package org.azadeh.service;

import java.util.List;

import org.azadeh.entity.FlowerModel;

public interface FlowerService {

	public void saveOrUpdate(FlowerModel flower) ;

    public FlowerModel getEntityById(long id) throws Exception;

	public List<FlowerModel> getEntityList() throws Exception;

	public boolean deleteEntity(long id) throws Exception;

}
