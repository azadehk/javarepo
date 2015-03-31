package org.azadeh.dao;

import java.util.List;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.azadeh.entity.FlowerModel;
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
public class FlowerDAOImpl implements FlowerDAO {

	Logger logger = Logger.getLogger(FlowerDAOImpl.class);
	
	Transaction tx = null;  
	Session session ;
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void saveOrUpdate(FlowerModel flower) {
		session=  sessionFactory.openSession();
		tx = session.beginTransaction(); 
	    try {
	    	
	        session.saveOrUpdate(flower);
	        
	      } catch (Exception ex) {
	      
	        logger.fatal("Failed to save the entity ["+flower.toString()+"] due to an exception ["+ex.getMessage()+"]", ex);
	        
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
	public FlowerModel getEntityById(long id) throws Exception {
		session = sessionFactory.openSession();
		FlowerModel flower = (FlowerModel) session.get(FlowerModel.class, id);
		try {
			tx = session.beginTransaction();
			tx.commit();
		
		} catch (Exception ex){
			  logger.fatal("Failed to fetch a record Flower due to an exception ["+ex.getMessage()+"]", ex);
			  if (tx!=null && tx.isActive())
		        tx.rollback();
		      throw new SQLException ("Getting a record failed due an exception ["+ ex.getMessage() +"]");
		} finally {
			session.close();
		}
		return flower;
	}


	@Override
	public List<FlowerModel> getEntityList() throws Exception {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		List<FlowerModel> flowers=null;
		
		try {
			flowers = session.createCriteria(FlowerModel.class).list();
			tx.commit();
		} catch (Exception ex){
			  logger.fatal("Failed to fetch list Flower due to an exception ["+ex.getMessage()+"]", ex);
			  if (tx!=null && tx.isActive())
		        tx.rollback();
		      throw new SQLException ("Getting the list failed due an exception ["+ ex.getMessage() +"]");
		} finally {
			session.close();
		}
		return flowers;
	}


	@Override
	public boolean deleteEntity(long id) throws Exception {
		Boolean retFlag= false;
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		
		try {
			FlowerModel flower = (FlowerModel) session.load(FlowerModel.class, id);
			tx = session.beginTransaction();
			session.delete(flower);
			retFlag = true;
		
		} catch (Exception ex) {
		      logger.fatal("Failed to delete all entities of Flower due to an exception ["+ex.getMessage()+"]", ex);;
		      
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
