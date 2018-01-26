package com.SWJTHC.model;

public class EduReformProject {
	private int ID=-2;
	private String name="";
	private double score=0;
	private String attachment="";
	private String owner="";
	private String authorSituation="";
	private String state="";
	private int checked =0;
	public EduReformProject(){
		
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
	public String getAuthorSituation() {
		return authorSituation;
	}
	public void setAuthorSituation(String authorSituation) {
		this.authorSituation = authorSituation;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
}
