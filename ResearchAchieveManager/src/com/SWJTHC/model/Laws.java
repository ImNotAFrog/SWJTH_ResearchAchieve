package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Laws{
	private int ID=-2;
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private String level="";
	private String authorSituation="";
	private String lawNumber="";
	private String wordsCount="";
	private int checked =0;
	public Laws(){
		
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
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
	public String getAuthorSituation() {
		return authorSituation;
	}
	public void setAuthorSituation(String authorSituation) {
		this.authorSituation = authorSituation;
	}
	public String getLawNumber() {
		return lawNumber;
	}
	public void setLawNumber(String lawNumber) {
		this.lawNumber = lawNumber;
	}
	public String getWordsCount() {
		return wordsCount;
	}
	public void setWordsCount(String wordsCount) {
		this.wordsCount = wordsCount;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
}
