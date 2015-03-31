package org.azadeh.controller;

import java.util.List;

import org.azadeh.entity.${object}Model;
import org.azadeh.service.${object}Service;
import org.azadeh.utils.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author azadeh.kosari@gmail.com
 * @version 0.1.20150330
 * @change 
 * @target
 * 
 */
 

@Controller
@RequestMapping("/${object?lower_case}")
public class ${object}Controller {
 
	@Autowired
	${object}Service ${object?lower_case}Service;

	 /* Submit form in Spring Restful Services */  	
	 @RequestMapping(value = "/create", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE) 
	 public @ResponseBody Status add${object}(@RequestBody ${object}Model ${object?lower_case}){
		try {
     		${object?lower_case}Service.saveOrUpdate(${object?lower_case});
     		   return new Status(1, "${object} added Successfully !");
 		  } catch (Exception e) {
 		   // e.printStackTrace();
 		   return new Status(0, e.toString());
 		  }
	 }
	 
	  /* Ger a single objct in Json form in Spring Rest Services */ 
	 @RequestMapping(value = "/{id}", method = RequestMethod.GET)
	 public @ResponseBody ${object}Model get${object}(@PathVariable("id") long id) {
		 ${object}Model ${object?lower_case} = null;
		 try {
			 ${object?lower_case}= ${object?lower_case}Service.getEntityById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 return ${object?lower_case};
	 }
	 
	  /* Getting List of objects in Json format in Spring Restful Services */ 
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public @ResponseBody List<${object}Model> get${object}List() {
		List<${object}Model> ${object?lower_case}s = null ;
		try{
			${object?lower_case}s = ${object?lower_case}Service.getEntityList();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ${object?lower_case}s;
	 }
	 
	  /* Delete an object from DB in Spring Restful Services */
	 @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	 public @ResponseBody Status delete${object}(@PathVariable("id") long id) {
		 try{
			 ${object?lower_case}Service.deleteEntity(id);
			 return new Status(1, "Employee deleted Successfully !");
		 }
		 catch(Exception e){
			 return new Status(0, e.toString());
		 }
		 
	 }
	 
}

