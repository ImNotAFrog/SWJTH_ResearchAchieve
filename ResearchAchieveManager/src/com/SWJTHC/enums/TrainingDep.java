package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum TrainingDep implements SubDepartment{
	LEADER("���쵼",1),DEANS_OFFICE("����",2),EDU_INSURANCE("�̱���",3)
	,RESEARCH("���д�",4),LIBRARY("ͼ���",5),CULTURE("�Ļ�����������",6)
	,LAW("���ɽ�����",7),PHYSICAL("��������������",8),BASICS("רҵ����������",9)
	,FIRE_PREVENTION("������������",10),FIRE_CONTROL_MANAGE("����ָ�ӽ�����",11),EMERGENCYRESCUE("���վ�Ԯ������",12)
	,POLITICAL_WORK("���ι���������",13),ELECTRICAL("�绯������",14);
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
