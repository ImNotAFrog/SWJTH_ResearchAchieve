package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Thesis{
	private int ID=-2; //将所有的ID默认为null
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private int journal=0;
	private String level="";
	public Thesis(){
		
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int ID) {
		this.ID = ID;
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

	public int getJournal() {
		return journal;
	}
	public void setJournal(int journal) {
		this.journal = journal;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
}
