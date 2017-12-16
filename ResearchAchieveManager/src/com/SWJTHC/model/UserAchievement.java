package com.SWJTHC.model;

import java.sql.Date;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.ManagementDep;
import com.SWJTHC.enums.PoliticalDep;
import com.SWJTHC.enums.SchoolAffairsDep;
import com.SWJTHC.enums.TrainingDep;
import com.SWJTHC.interfaces.SubDepartment;

public class UserAchievement {
	private String ID;
	private String username;
	private String category;
	private String name;
	private int checked=-2;
	private double score=0;
	private Department department=null;
	private SubDepartment subDepartment=null;
	private Date achievementDate;
	private double maxScore=0;
	
	public UserAchievement(){
		
	}
	
	public double getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(double maxScore) {
		this.maxScore = maxScore;
	}

	public Date getAchievementDate() {
		return achievementDate;
	}

	public void setAchievementDate(Date achievementDate) {
		this.achievementDate = achievementDate;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public SubDepartment getSubDepartment() {
		if(department==null){
			return null;
		}
		switch(department){
		case TRAINNING:
			return TrainingDep.valueOf(subDepartment.toString());
		case LEADER:
			return null;
		case POLITICAL:			
			return PoliticalDep.valueOf(subDepartment.toString());
		case SCHOOL_AFFAIRS:
			return SchoolAffairsDep.valueOf(subDepartment.toString());
		case MANAGEMENT:
			return ManagementDep.valueOf(subDepartment.toString());
		default:
			break;
		}
		return subDepartment;
	}
	public void setSubDepartment(String subDepartmentName) {
		if(department==null){
			this.subDepartment = null;
		}
		switch(department){
		case TRAINNING:
			this.subDepartment= TrainingDep.valueOf(subDepartmentName);
			break;
		case LEADER:
			this.subDepartment=  null;
			break;
		case POLITICAL:			
			this.subDepartment=  PoliticalDep.valueOf(subDepartmentName);
			break;
		case SCHOOL_AFFAIRS:
			this.subDepartment=  SchoolAffairsDep.valueOf(subDepartmentName);
			break;
		case MANAGEMENT:
			this.subDepartment=  ManagementDep.valueOf(subDepartmentName);
			break;
		default:
			break;
		}
	}

	public void setSubDepartment(SubDepartment subDepartment) {
		this.subDepartment = subDepartment;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
