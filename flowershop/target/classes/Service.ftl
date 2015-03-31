package org.azadeh.service;

import java.util.List;

import org.azadeh.entity.${object}Model;

public interface ${object}Service {

	public void saveOrUpdate(${object}Model ${object?lower_case}) ;

    public ${object}Model getEntityById(long id) throws Exception;

	public List<${object}Model> getEntityList() throws Exception;

	public boolean deleteEntity(long id) throws Exception;

}
