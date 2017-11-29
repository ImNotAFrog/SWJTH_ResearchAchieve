package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;
//部领导
//学员管理部办公室
//学员一大队
//学员二大队
//学员三大队
//学员四大队
//学员五大队
//学员六大队

import com.SWJTHC.interfaces.SubDepartment;

public enum ManagementDep implements SubDepartment{
	LEADER("部领导",1),OFFICE("学员管理部办公室",2),BRIGADE_1("学员一大队",3)
	,BRIGADE_2("学员二大队",4),BRIGADE_3("学员三大队",5),BRIGADE_4("学员四大队",6)
	,BRIGADE_5("学员五大队",7),BRIGADE_6("学员六大队",8);
	private String name;
	private int index;
	private ManagementDep(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (ManagementDep d : ManagementDep.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (ManagementDep d : ManagementDep.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<ManagementDep> getList(){
		 List<ManagementDep> l = Arrays.asList(ManagementDep.values());
		 return l;
	 }
     // get set 方法
     public String getName() {
         return name;
     }

     public void setName(String name) {
         this.name = name;
     }

     public int getIndex() {
         return index;
     }

     public void setIndex(int index) {
         this.index = index;
     }

}
