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
@Table(name = "flower")
@XmlRootElement(name = "flower")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})  
public class FlowerModel  implements Serializable{

	private static final long serialVersionUID = 1L;  
	 
	@Id
	@Column(name = "flowerId")
	private Long flowerId;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "fName")
	private String fName;

	@Column(name = "imageName")
	private String imageName;

	@Column(name = "description")
	private String description;
	
	@Column(name = "isAvailable")
	private Boolean isAvailable;
	
	
	public FlowerModel() {
		super();
	}

	public Long getFlowerId() {
		return flowerId;
	}

	public void setFlowerId(Long flowerId) {
		this.flowerId = flowerId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(Boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	

}
