package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum Title {
	PROFESSOR("教授",1),ASSOCIATE_PROFESSOR("副教授",2),LECTURER("讲师",3)
	,ASSISTANT("助教",4),TECHNICIAN("技术员",5),ASSISTANT_ENGINEER("助理工程师",6)
	,ENGINEER("工程师",7),SENIOR_ENGINEER("高级工程师",8);
	private String name;
	private int index;
	private Title(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (Title t : Title.values()) {
             if (t.getIndex() == index) {
                 return t.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (Title t : Title.values()) {
             if (t.getName().equals(name)) {
                 return t.index;
             }
         }
         return -1;
     }
	 public static List<Title> getList(){
		 List<Title> l = Arrays.asList(Title.values());
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
