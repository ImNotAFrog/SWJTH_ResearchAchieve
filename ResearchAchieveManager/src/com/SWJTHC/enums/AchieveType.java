package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum AchieveType {
	THESIS("����",1),LAWS("�����׼",2),PATENT("ר�����������Ȩ",3)
	,TEXTBOOK("�̲ġ�����",4),TOPIC("����",5),INSTRUCTIONAL_REFORM("��ѧ�ĸ���Ŀ",6);
	private String name;
	private int index;
	private AchieveType(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (AchieveType d : AchieveType.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (AchieveType d : AchieveType.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<AchieveType> getAll(){
		 List<AchieveType> l = Arrays.asList(AchieveType.values());
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
