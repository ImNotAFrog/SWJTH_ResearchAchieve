package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum PositionLevel {
	
	COMMANDER("军长",1),DEPUTY_COMMANDER("副军长",2),DIVISION_COMMANDER("师长",3)
	,VICE_DIVISIONCOMMANDER("副师长",4),REGIMENT_COMMANDER("团长",5),DEPUTY_REGIMENT_COMMANDER("副团长",6)
	,BATTALION_COMMANDER("营长",7),DEPUTY_BATTALION_COMMANDER("副营长",8),COMPANY_COMMANDER("连长",9)
	,DEPUTY_COMPANY_COMMANDER("副连长",10),PLATOON_LEADER("排长",11),STUDENT("学员",12);
	private String name;
	private int index;
	private PositionLevel(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (PositionLevel p : PositionLevel.values()) {
             if (p.getIndex() == index) {
                 return p.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (PositionLevel p : PositionLevel.values()) {
             if (p.getName().equals(name)) {
                 return p.index;
             }
         }
         return -1;
     }
	 
	 public static List<PositionLevel> getList(){
		 List<PositionLevel> l = Arrays.asList(PositionLevel.values());
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
