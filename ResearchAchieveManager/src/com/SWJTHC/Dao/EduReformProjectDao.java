package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.EduReformProject;
import com.SWJTHC.model.UserAchievement;

public class EduReformProjectDao {
	public static int insertEduReformProject(EduReformProject p){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into eduReformProject(name,score,attachment,owner,authorSituation,state,checked) values(?,?,?,?,?,?,?)",p,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				AppUser u = UserDao.getUserByUsername(p.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("eduReformProject");
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setName(p.getName());
				a.setChecked(p.getChecked());
				a.setScore(p.getScore());
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(p.getState().substring(0, 10)).getTime());
				a.setAchievementDate(date);
				a.setMaxScore(24);
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked,score,department,subDepartment,achievementDate,maxScore) values(?,?,?,?,?,?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	public static int updateEduReformProject(EduReformProject p){

		int i=-1;
		String sql = "update eduReformProject set ";
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
				a.setCategory("eduReformProject");
				a.setChecked(p.getChecked());
				a.setScore(p.getScore());
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(p.getState().substring(0, 10)).getTime());
				a.setAchievementDate(date);
				a.setMaxScore(24);
				UserAchievementDao.updateUserAchievemetByUsername(a);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Dao.close();
		return i;
	}
	
	public static EduReformProject getEduReformProjectById(int id){		
		ResultSet rs=null;
		EduReformProject eduReformProject = null;
		try {
			rs = Dao.executQuery("select * from eduReformProject where id ="+id);
			while(rs.next()){ 
				eduReformProject = new EduReformProject();
				eduReformProject.setID(id);
				eduReformProject.setName(rs.getString("name"));
				eduReformProject.setState(rs.getString("state"));
				eduReformProject.setScore(rs.getDouble("score"));
				eduReformProject.setOwner(rs.getString("owner"));
				eduReformProject.setAuthorSituation(rs.getString("authorSituation"));
				eduReformProject.setChecked(rs.getInt("checked"));
				eduReformProject.setAttachment(rs.getString("attachment"));				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return eduReformProject;		
	}
	
	public static int deleteEduReformProject(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from eduReformProject where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='eduReformProject'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
