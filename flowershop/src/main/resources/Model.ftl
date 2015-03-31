package org.azadeh.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 
 * @author azadeh.kosari@gmail.com
 * @version 0.1.20150330
 * @change 
 * @target
 * 
 */
 

@Entity
@Table(name = "${object?lower_case}")
@XmlRootElement(name = "${object?lower_case}")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})  
public class ${object}Model  implements Serializable{

	private static final long serialVersionUID = 1L;  
	 
	@Id
	@Column(name = "${object?lower_case}Id")
	private Long ${object?lower_case}Id;
	
	
	public ${object}Model() {
		super();
	}

	public Long get${object}Id() {
		return ${object?lower_case}Id;
	}

	public void set${object}Id(Long ${object?lower_case}Id) {
		this.${object?lower_case}Id = ${object?lower_case}Id;
	}
	

}
