package com.SWJTHC.model;

import java.sql.Date;

import com.SWJTHC.enums.AchieveType;

public class Textbook{
	private int ID=-2;
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private Date publishDate;
	private String authorSituation="";
	private String publishingHouse="";
	private String ISBN="";
	private String level="";
	private int checked =0;
	public Textbook(){
		
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
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getAuthorSituation() {
		return authorSituation;
	}
	public void setAuthorSituation(String authorSituation) {
		this.authorSituation = authorSituation;
	}
	public String getPublishingHouse() {
		return publishingHouse;
	}
	public void setPublishingHouse(String publishingHouse) {
		this.publishingHouse = publishingHouse;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	

	
}
