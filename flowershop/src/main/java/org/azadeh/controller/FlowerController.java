package org.azadeh.controller;

import java.util.List;

import org.azadeh.entity.FlowerModel;
import org.azadeh.service.FlowerService;
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
@RequestMapping("/flower")
public class FlowerController {
 
	@Autowired
	FlowerService flowerService;

	 /* Submit form in Spring Restful Services */  	
	 @RequestMapping(value = "/create", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE) 
	 public @ResponseBody Status addFlower(@RequestBody FlowerModel flower){
		try {
     		flowerService.saveOrUpdate(flower);
     		   return new Status(1, "Flower added Successfully !");
 		  } catch (Exception e) {
 		   // e.printStackTrace();
 		   return new Status(0, e.toString());
 		  }
	 }
	 
	  /* Ger a single objct in Json form in Spring Rest Services */ 
	 @RequestMapping(value = "/{id}", method = RequestMethod.GET)
	 public @ResponseBody FlowerModel getFlower(@PathVariable("id") long id) {
		 FlowerModel flower = null;
		 try {
			 flower= flowerService.getEntityById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 return flower;
	 }
	 
	  /* Getting List of objects in Json format in Spring Restful Services */ 
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public @ResponseBody List<FlowerModel> getFlowerList() {
		List<FlowerModel> flowers = null ;
		try{
			flowers = flowerService.getEntityList();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flowers;
	 }
	 
	  /* Delete an object from DB in Spring Restful Services */
	 @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	 public @ResponseBody Status deleteFlower(@PathVariable("id") long id) {
		 try{
			 flowerService.deleteEntity(id);
			 return new Status(1, "Employee deleted Successfully !");
		 }
		 catch(Exception e){
			 return new Status(0, e.toString());
		 }
		 
	 }
	 
}

