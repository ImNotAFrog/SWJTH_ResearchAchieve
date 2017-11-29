package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum PoliticalDep implements SubDepartment{
	LEADER("部领导",1),EDU_ORGANIZE("组织教育处",2),PERSONNEL_SECTION("干部处",3)
	,DISCIPLINE("纪检保卫处",4),PUBLICITY("宣传文化处",5);
	private String name;
	private int index;
	private PoliticalDep(String name, int index){
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (PoliticalDep d : PoliticalDep.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (PoliticalDep d : PoliticalDep.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<PoliticalDep> getList(){
		 List<PoliticalDep> l = Arrays.asList(PoliticalDep.values());
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
