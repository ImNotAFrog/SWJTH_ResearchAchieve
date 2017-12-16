package com.SWJTHC.model;

import java.sql.Date;

import com.SWJTHC.enums.AchieveType;

public class Patent{
	private int ID=-2;
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private String category="";
	private String patentHolder="";
	private String patentNum="";
	private Date patentDate;
	private int checked =0;
	private String authorSituation="";
	public Patent(){
		
	}
	
	public String getAuthorSituation() {
		return authorSituation;
	}

	public void setAuthorSituation(String authorSituation) {
		this.authorSituation = authorSituation;
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
	public String getPatentNum() {
		return patentNum;
	}
	public void setPatentNum(String patentNum) {
		this.patentNum = patentNum;
	}
	public Date getPatentDate() {
		return patentDate;
	}
	public void setPatentDate(Date patentDate) {
		this.patentDate = patentDate;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	
}
