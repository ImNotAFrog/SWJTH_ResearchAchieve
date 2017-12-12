package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Thesis{
	private int ID=-2; //将所有的ID默认为null
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private String journalNum="";
	private String journalName ="";
	private String journalLevel="";
	private int checked =0;
	public Thesis(){
		
	}
	
	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public String getJournalName() {
		return journalName;
	}

	public void setJournalName(String journalName) {
		this.journalName = journalName;
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

	public String getJournalNum() {
		return journalNum;
	}
	public void setJournalNum(String journal) {
		this.journalNum = journal;
	}
	public String getJournalLevel() {
		return journalLevel;
	}
	public void setJournalLevel(String level) {
		this.journalLevel = level;
	}
	
}
