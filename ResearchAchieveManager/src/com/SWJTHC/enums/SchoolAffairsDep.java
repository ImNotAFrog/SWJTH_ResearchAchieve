package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum SchoolAffairsDep implements SubDepartment{
	LEADER("部领导",1),OFFICE("校务部办公室",2),POLICE_DIVISION("警务处",3)
	,FINANCE("财务处",4),MANAGEMENT("管理处",5),BARRACKS("营房处",6)
	,SUPPLY("供给装备处",7),HEALH_TEAM("卫生队",8),TEACHING_SECURE("教学保障大队",9)
	,CAR_SQUADRON("汽车中队",10),POLICE_SQUADRON("警勤中队",11),TEACHING_SQUADRON("示教中队",12);
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
