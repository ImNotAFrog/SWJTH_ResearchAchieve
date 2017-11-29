package com.SWJTHC.model;

public class Textbook extends Achievement {
	private String subject;
	private String authorSituation;
	private String publishSituation;
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
