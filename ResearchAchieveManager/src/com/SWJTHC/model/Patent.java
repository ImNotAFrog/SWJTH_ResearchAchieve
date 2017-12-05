package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Patent{
	private String ID;
	private String name;
	private double score;
	private String attachment;
	private String owner;
	private String category;
	private String patentHolder;
	public Patent(){
		
	}
	
	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}


	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPatentHolder() {
		return patentHolder;
	}
	public void setPatentHolder(String patentHolder) {
		this.patentHolder = patentHolder;
	}
	
}
