package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

public enum Department {
	LEADER("校领导",1),TRAINNING("训练部",2),POLITICAL("政治部",3)
	,SCHOOL_AFFAIRS("校务部",4),MANAGEMENT("学员管理部",5);
	private String name;
	private int index;
	private Department(String name, int index) {
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (Department d : Department.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (Department d : Department.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<Department> getAll(){
		 List<Department> l = Arrays.asList(Department.values());
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
     public List<?> getSubDeps(){
    	 List<?> l = null;
    	 switch(this){
    	 case TRAINNING:
    		 l = Arrays.asList(TrainingDep.values());
    		 break;
    	 case POLITICAL:
    		 l = Arrays.asList(PoliticalDep.values());
    		 break;
    	 case SCHOOL_AFFAIRS:
    		 l = Arrays.asList(SchoolAffairsDep.values());
    		 break;
    	 case MANAGEMENT:
    		 l = Arrays.asList(ManagementDep.values());
    		 break;
		 default:
			 break;
    	 }
		return l;    	 
     }
}
