package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public abstract class Achievement {
	private String ID;
	private String name;
	private String score;
	private String attachment;
	private AchieveType achieveType;
	public Achievement(){
		
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public AchieveType getAchieveType() {
		return achieveType;
	}
	public void setAchieveType(AchieveType achieveType) {
		this.achieveType = achieveType;
	}
	
}
