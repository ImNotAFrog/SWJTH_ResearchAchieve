package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

public class EduProjectDao {
	public static int insertEduProject(EduProject p){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into eduProject(name,score,attachment,owner,subject,level,authorSituation,state,checked) values(?,?,?,?,?,?,?,?,?)",p,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				AppUser u = UserDao.getUserByUsername(p.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("eduProject");
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setName(p.getName());
				a.setChecked(p.getChecked());
				a.setScore(p.getScore());
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(p.getState().substring(0, 10)).getTime());
				a.setAchievementDate(date);
				switch(p.getLevel()){
				case "1":							
					a.setMaxScore(300);
					break;
				case "2":
					a.setMaxScore(90);
					break;
				case "3":
					a.setMaxScore(30);
					break;
				case "4":
					a.setMaxScore(100);
					break;
				case "5":
					a.setMaxScore(30);
					break;
				case "6":
					a.setMaxScore(10);
					break;
				}
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked,score,department,subDepartment,achievementDate,maxScore) values(?,?,?,?,?,?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	public static int updateEduProject(EduProject p){

		int i=-1;
		String sql = "update eduProject set ";
		String key = "ID";
		int k=1;
		try {
			Field[] field = p.getClass().getDeclaredFields();
			for (int j = 0; j < field.length; j++) {
				String name = field[j].getName();
				if(name.contains("$SWITCH_TABLE")){
					continue;
				}//Ìø¹ýSWITCH_TABLE
				String name1 = name.substring(0,1).toUpperCase()+name.substring(1);
				String type = field[j].getGenericType().toString();
				String[] classNameSplited = type.split(" ");
				String className = classNameSplited[classNameSplited.length-1];
				String[] typeSplited = type.split("\\.");
				String typeName = typeSplited[typeSplited.length-1];
				Object value;
				if(className.contains("List")){
					int start,end;
					for(int n=0;n<className.length();n++){
						if(className.charAt(n)=='<'){
							start = n;
						}
						if(className.charAt(n)=='>'){
							end = n;
						}
					}value = new ArrayList<>();
				}
					else if(className.equals("int")){
						value = Class.forName("java.lang.Integer");
						value = p.getClass().getMethod("get"+name1).invoke(p);
						typeName="Int";
						if((Integer)value==-2)continue;
					}
					else if(className.equals("double")){
						value = Class.forName("java.lang.Double");
					}
				else{
					value = Class.forName(className);
				}				 
				Method getMethod = p.getClass().getMethod("get"+name1);
	            value = getMethod.invoke(p);
	            if(value != null){
	                if(key.equals(name)){
	                	k--;
	                }else if(k==1){
	            		sql= sql+name+"=?";
	            	}else{
	            		sql= sql +","+name+"=?";
	            	}
	            	k++;
               }
			}
			sql+=" where "+key+" = ?";
			i = Dao.executUpdate(sql,p,key);
			if(i==0){
				UserAchievement a = new UserAchievement();
				a.setID(p.getID()+"");
				a.setName(p.getName());
				AppUser u = UserDao.getUserByUsername(p.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("eduProject");
				a.setChecked(p.getChecked());
				a.setScore(p.getScore());
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(p.getState().substring(0, 10)).getTime());
				a.setAchievementDate(date);
				switch(p.getLevel()){
				case "1":							
					a.setMaxScore(300);
					break;
				case "2":
					a.setMaxScore(90);
					break;
				case "3":
					a.setMaxScore(30);
					break;
				case "4":
					a.setMaxScore(100);
					break;
				case "5":
					a.setMaxScore(30);
					break;
				case "6":
					a.setMaxScore(10);
					break;
				}
				UserAchievementDao.updateUserAchievemetByUsername(a);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Dao.close();
		return i;
	}
	
	public static EduProject getEduProjectById(int id){		
		ResultSet rs=null;
		EduProject eduProject = null;
		try {
			rs = Dao.executQuery("select * from eduProject where id ="+id);
			while(rs.next()){ 
				eduProject = new EduProject();
				eduProject.setID(id);
				eduProject.setLevel(rs.getString("level"));
				eduProject.setSubject(rs.getString("subject"));
				eduProject.setName(rs.getString("name"));
				eduProject.setState(rs.getString("state"));
				eduProject.setScore(rs.getDouble("score"));
				eduProject.setOwner(rs.getString("owner"));
				eduProject.setAuthorSituation(rs.getString("authorSituation"));
				eduProject.setChecked(rs.getInt("checked"));
				eduProject.setAttachment(rs.getString("attachment"));				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return eduProject;		
	}
	
	public static int deleteEduProject(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from eduProject where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='eduProject'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
