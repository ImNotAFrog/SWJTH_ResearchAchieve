package com.SWJTHC.model;

import com.SWJTHC.enums.AchieveType;

public class Textbook{
	private String ID;
	private String name;
	private double score;
	private String attachment;
	private String owner;
	private String subject;
	private String authorSituation;
	private String publishSituation;
	public Textbook(){
		
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

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAuthorSituation() {
		return authorSituation;
	}
	public void setAuthorSituation(String authorSituation) {
		this.authorSituation = authorSituation;
	}
	public String getPublishSituation() {
		return publishSituation;
	}
	public void setPublishSituation(String publishSituation) {
		this.publishSituation = publishSituation;
	}
	
}
