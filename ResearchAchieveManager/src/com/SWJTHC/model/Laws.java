package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Laws{
	private String ID;
	private String name;
	private double score;
	private String attachment;
	private String owner;
	private String level;
	private String chiefEditor;
	private String editors;
	public Laws(){
		
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

	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getChiefEditor() {
		return chiefEditor;
	}
	public void setChiefEditor(String chiefEditor) {
		this.chiefEditor = chiefEditor;
	}
	public String getEditors() {
		return editors;
	}
	public void setEditors(String editors) {
		this.editors = editors;
	}
	
}
