package org.azadeh.dao;

import java.util.List;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.azadeh.entity.${object}Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author azadeh.kosari@gmail.com
 * @version 0.1.20150330
 * @change 
 * @target
 * 
 */
 
 
@Repository
public class ${object}DAOImpl implements ${object}DAO {

	Logger logger = Logger.getLogger(${object}DAOImpl.class);
	
	Transaction tx = null;  
	Session session ;
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void saveOrUpdate(${object}Model ${object?lower_case}) {
		session=  sessionFactory.openSession();
		tx = session.beginTransaction(); 
	    try {
	    	
	        session.saveOrUpdate(${object?lower_case});
	        
	      } catch (Exception ex) {
	      
	        logger.fatal("Failed to save the entity ["+${object?lower_case}.toString()+"] due to an exception ["+ex.getMessage()+"]", ex);
	        
	        if (tx!=null && tx.isActive()){
	          tx.rollback();
	          tx = null;
	        }
	        
	      } finally {
	        
	        if (tx!=null && tx.isActive()) {
	          tx.commit();
	        }
	        session.close();
	      }

	}


	@Override
	public ${object}Model getEntityById(long id) throws Exception {
		session = sessionFactory.openSession();
		${object}Model ${object?lower_case} = (${object}Model) session.get(${object}Model.class, id);
		try {
			tx = session.beginTransaction();
			tx.commit();
		
		} catch (Exception ex){
			  logger.fatal("Failed to fetch a record ${object} due to an exception ["+ex.getMessage()+"]", ex);
			  if (tx!=null && tx.isActive())
		        tx.rollback();
		      throw new SQLException ("Getting a record failed due an exception ["+ ex.getMessage() +"]");
		} finally {
			session.close();
		}
		return ${object?lower_case};
	}


	@Override
	public List<${object}Model> getEntityList() throws Exception {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		List<${object}Model> ${object?lower_case}s=null;
		
		try {
			${object?lower_case}s = session.createCriteria(${object}Model.class).list();
			tx.commit();
		} catch (Exception ex){
			  logger.fatal("Failed to fetch list ${object} due to an exception ["+ex.getMessage()+"]", ex);
			  if (tx!=null && tx.isActive())
		        tx.rollback();
		      throw new SQLException ("Getting the list failed due an exception ["+ ex.getMessage() +"]");
		} finally {
			session.close();
		}
		return ${object?lower_case}s;
	}


	@Override
	public boolean deleteEntity(long id) throws Exception {
		Boolean retFlag= false;
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		
		try {
			${object}Model ${object?lower_case} = (${object}Model) session.load(${object}Model.class, id);
			tx = session.beginTransaction();
			session.delete(${object?lower_case});
			retFlag = true;
		
		} catch (Exception ex) {
		      logger.fatal("Failed to delete all entities of ${object} due to an exception ["+ex.getMessage()+"]", ex);;
		      
		      if (tx!=null && tx.isActive())
		        tx.rollback();
		      throw new SQLException ("deleteAll failed due an exception ["+ ex.getMessage() +"]");
		      
		} finally {
		      if (tx!=null && tx.isActive())
		        tx.commit();
		      session.close();
		}
		return retFlag;
	}	

}
