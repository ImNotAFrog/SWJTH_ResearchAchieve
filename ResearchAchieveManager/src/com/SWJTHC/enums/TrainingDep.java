package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum TrainingDep implements SubDepartment{
	LEADER("部领导",1),DEANS_OFFICE("教务处",2),EDU_INSURANCE("教保处",3)
	,RESEARCH("科研处",4),LIBRARY("图书馆",5),CULTURE("文化基础教研室",6)
	,LAW("法律教研室",7),PHYSICAL("军事体育教研室",8),BASICS("专业基础教研室",9)
	,FIRE_PREVENTION("防火管理教研室",10),FIRE_CONTROL_MANAGE("消防指挥教研室",11),EMERGENCYRESCUE("抢险救援教研室",12)
	,POLITICAL_WORK("政治工作教研室",13),ELECTRICAL("电化教研室",14);
	private String name;
	private int index;
	private TrainingDep(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (TrainingDep d : TrainingDep.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (TrainingDep d : TrainingDep.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<TrainingDep> getList(){
		 List<TrainingDep> l = Arrays.asList(TrainingDep.values());
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
