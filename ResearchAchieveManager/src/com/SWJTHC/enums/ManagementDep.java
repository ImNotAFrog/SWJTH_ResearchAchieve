package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;
//���쵼
//ѧԱ�����칫��
//ѧԱһ���
//ѧԱ�����
//ѧԱ�����
//ѧԱ�Ĵ��
//ѧԱ����
//ѧԱ�����

import com.SWJTHC.interfaces.SubDepartment;

public enum ManagementDep implements SubDepartment{
	LEADER("���쵼",1),OFFICE("ѧԱ�����칫��",2),BRIGADE_1("ѧԱһ���",3)
	,BRIGADE_2("ѧԱ�����",4),BRIGADE_3("ѧԱ�����",5),BRIGADE_4("ѧԱ�Ĵ��",6)
	,BRIGADE_5("ѧԱ����",7),BRIGADE_6("ѧԱ�����",8);
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
