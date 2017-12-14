package com.SWJTHC.model;

import java.util.List;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.ManagementDep;
import com.SWJTHC.enums.PoliticalDep;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.SchoolAffairsDep;
import com.SWJTHC.enums.Title;
import com.SWJTHC.enums.TrainingDep;
import com.SWJTHC.interfaces.SubDepartment;

public class AppUser {
	private String username;
	private String password;
	private String name;
	private Position position; //职务
	private PositionLevel positionLevel; //职级
	private Title title; //职称
	private Department department;
	private SubDepartment subDepartment;
	private String role;
	public AppUser(){
		
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSubDepartment(SubDepartment subDepartment) {
		this.subDepartment = subDepartment;
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
	
}
