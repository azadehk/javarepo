package org.azadeh.server;

import java.io.File;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class ClassFreeMarkerStyle {

	public static void main(String[] args) {
		String objName = "Flower";
		createController(objName,"Controller");
		createController(objName,"DAO");
		createController(objName,"DAOImpl");
		createController(objName,"Model");
		createController(objName,"Service");
		createController(objName,"ServiceImpl");
	}

	public static void createController(String objName,String objType){
		Configuration configuration = new Configuration();
		configuration.setClassForTemplateLoading(ClassFreeMarkerStyle.class, "/");
		try{
			 
			Template simpleTemplate = configuration.getTemplate(objType + ".ftl");
			
			Map<String, Object> myMap = new HashMap<String,Object>();
			myMap.put("object", objName);
			
	        // File output
            Writer file = new FileWriter (new File("C:\\awork\\freemarker\\"+ objName + objType + ".java"));
            simpleTemplate.process(myMap, file);
            file.flush();
            file.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
}
