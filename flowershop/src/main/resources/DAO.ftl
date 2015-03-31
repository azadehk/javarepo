package org.azadeh.dao;

import java.util.List;

import org.azadeh.entity.${object}Model;

public interface ${object}DAO {
	
	public void saveOrUpdate(${object}Model category);
	 
    public ${object}Model getEntityById(long id) throws Exception;
    
	public List<${object}Model> getEntityList() throws Exception;
	
	public boolean deleteEntity(long id) throws Exception;
	
}
