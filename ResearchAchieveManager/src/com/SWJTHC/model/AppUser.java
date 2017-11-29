package com.SWJTHC.model;

import java.util.List;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.Title;
import com.SWJTHC.interfaces.SubDepartment;

public class AppUser {
	private String username;
	private String password;
	private Position position; //职务
	private PositionLevel positionLevel; //职级
	private Title title; //职称
	private Department department;
	private SubDepartment subDepartment;
	private List<Achievement> achievements;
	private String profile;
	public AppUser(){
		
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public PositionLevel getPositionLevel() {
		return positionLevel;
	}
	public void setPositionLevel(PositionLevel positionLevel) {
		this.positionLevel = positionLevel;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public List<Achievement> getAchievements() {
		return achievements;
	}
	public void setAchievements(List<Achievement> achievements) {
		this.achievements = achievements;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public SubDepartment getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(SubDepartment subDepartment) {
		this.subDepartment = subDepartment;
	}
	
}
