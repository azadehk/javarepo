package org.azadeh.entity;

import javax.persistence.Entity;
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

@XmlRootElement(name = "flower")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})  
public class PayInfoModel {
	
	private String cardNumber;
	
	private Integer expiryYear;
	
	private Integer expiryMonth;
	
	private Integer cvv2;
	
	private Double amount;

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Integer getExpiryYear() {
		return expiryYear;
	}

	public void setExpiryYear(Integer expiryYear) {
		this.expiryYear = expiryYear;
	}

	public Integer getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(Integer expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public Integer getCvv2() {
		return cvv2;
	}

	public void setCvv2(Integer cvv2) {
		this.cvv2 = cvv2;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	
	


}
