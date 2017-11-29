package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum Position {
	PRESIDENT("У��",1),COMMISSAR("����ίԱ",2),VICE_PRESIDENT("��У��",3)
	,VICE_COMMISSAR("������ίԱ",4)	,MINISTER("����",5),VICE_MINISTER("������",6)
	,DIVISION_CHIEF("����",7),DEPUTY_DIVISION_CHIEF("������",8),DIRECTOR("����",9)
	,DEPUTY_DIRECTOR("������",10),TEACHER("��Ա",11),BRANCH_DIRECTOR("��ӳ�",12)
	,BRANCH_DEPUTYDIRECTOR("����ӳ�",13),INSTRUCTOR("�̵�Ա",14),ASSOCIATE_INSTRUCTOR("���̵�Ա",15)
	,SERGEANT("�жӳ�",16),VICE_SERGEANT("���жӳ�",17),ADVISER("��ı",18)
	,OFFICER("����",19),PLATOON_LEADER("�ų�",20),ASSISTANT("����Ա",21);
	private String name;
	private int index;
	private Position(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (Position p : Position.values()) {
             if (p.getIndex() == index) {
                 return p.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (Position p : Position.values()) {
             if (p.getName().equals(name)) {
                 return p.index;
             }
         }
         return -1;
     }
	 public static List<Position> getList(){
		 List<Position> l = Arrays.asList(Position.values());
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
