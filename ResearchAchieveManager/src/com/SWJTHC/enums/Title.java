package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum Title {
	PROFESSOR("����",1),ASSOCIATE_PROFESSOR("������",2),LECTURER("��ʦ",3)
	,ASSISTANT("����",4),TECHNICIAN("����Ա",5),ASSISTANT_ENGINEER("������ʦ",6)
	,ENGINEER("����ʦ",7),SENIOR_ENGINEER("�߼�����ʦ",8);
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
     // get set ����
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
