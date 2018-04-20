package com.SWJTHC.enums;

import java.util.Arrays;
import java.util.List;

import com.SWJTHC.interfaces.SubDepartment;

public enum Leader implements SubDepartment{
	LEADER("校领导",1);

	private String name;
	private int index;
	private Leader(String name, int index){
		this.name=name;
		this.index =index;
		// TODO Auto-generated constructor stub
	}
	
	 public static String getName(int index) {
         for (Leader d : Leader.values()) {
             if (d.getIndex() == index) {
                 return d.name;
             }
         }
         return null;
     }
	 
	 public static int getIndex(String name) {
         for (Leader d : Leader.values()) {
             if (d.getName().equals(name)) {
                 return d.index;
             }
         }
         return -1;
     }
	 public static List<Leader> getList(){
		 List<Leader> l = Arrays.asList(Leader.values());
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
