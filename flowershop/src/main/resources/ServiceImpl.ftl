package org.azadeh.service;

import java.util.List;

import org.azadeh.dao.${object}DAO;
import org.azadeh.entity.${object}Model;
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
public class ${object}ServiceImpl implements ${object}Service {

	@Autowired
	${object}DAO ${object?lower_case}DAO; 
	
	@Override
	public void saveOrUpdate(${object}Model ${object?lower_case}) {
		${object?lower_case}DAO.saveOrUpdate(${object?lower_case});

	}

	@Override
	public ${object}Model getEntityById(long id) throws Exception {
		${object}Model ${object?lower_case} = ${object?lower_case}DAO.getEntityById(id);
		return ${object?lower_case} ;
	}

	@Override
	public List<${object}Model> getEntityList() throws Exception {
		List<${object}Model> ${object?lower_case}s = ${object?lower_case}DAO.getEntityList();
		return ${object?lower_case}s;
	}

	@Override
	public boolean deleteEntity(long id) throws Exception {
		${object?lower_case}DAO.deleteEntity(id);
		return false;
	}
	
	

}
