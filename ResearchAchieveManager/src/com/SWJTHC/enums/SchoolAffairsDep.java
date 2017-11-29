package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum SchoolAffairsDep implements SubDepartment{
	LEADER("���쵼",1),OFFICE("У�񲿰칫��",2),POLICE_DIVISION("����",3)
	,FINANCE("����",4),MANAGEMENT("����",5),BARRACKS("Ӫ����",6)
	,SUPPLY("����װ����",7),HEALH_TEAM("������",8),TEACHING_SECURE("��ѧ���ϴ��",9)
	,CAR_SQUADRON("�����ж�",10),POLICE_SQUADRON("�����ж�",11),TEACHING_SQUADRON("ʾ���ж�",12);
	private String name;
	private int index;
	private SchoolAffairsDep(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (SchoolAffairsDep d : SchoolAffairsDep.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (SchoolAffairsDep d : SchoolAffairsDep.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<SchoolAffairsDep> getList(){
		 List<SchoolAffairsDep> l = Arrays.asList(SchoolAffairsDep.values());
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
