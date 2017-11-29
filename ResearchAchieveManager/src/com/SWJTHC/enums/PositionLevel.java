package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum PositionLevel {
	
	COMMANDER("����",1),DEPUTY_COMMANDER("������",2),DIVISION_COMMANDER("ʦ��",3)
	,VICE_DIVISIONCOMMANDER("��ʦ��",4),REGIMENT_COMMANDER("�ų�",5),DEPUTY_REGIMENT_COMMANDER("���ų�",6)
	,BATTALION_COMMANDER("Ӫ��",7),DEPUTY_BATTALION_COMMANDER("��Ӫ��",8),COMPANY_COMMANDER("����",9)
	,DEPUTY_COMPANY_COMMANDER("������",10),PLATOON_LEADER("�ų�",11),STUDENT("ѧԱ",12);
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
