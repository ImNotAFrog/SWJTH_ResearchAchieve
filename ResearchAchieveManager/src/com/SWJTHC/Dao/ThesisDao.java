package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

public class ThesisDao {
	public static int insertThesis(Thesis t){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into Thesis(name,score,attachment,owner,journalNum,journalName,journalLevel,checked) values(?,?,?,?,?,?,?,?)",t,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				a.setUsername(t.getOwner());
				a.setCategory("thesis");
				a.setName(t.getName());
				a.setChecked(0);
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked) values(?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static Thesis getThesisById(int id){		
		ResultSet rs=null;
		Thesis thesis = null;
		try {
			rs = Dao.executQuery("select * from Thesis where id ="+id);
			while(rs.next()){ 
				thesis = new Thesis();
				thesis.setID(id);
				thesis.setName(rs.getString("name"));
				thesis.setJournalLevel(rs.getString("journalLevel"));
				thesis.setScore(rs.getDouble("score"));
				thesis.setOwner(rs.getString("owner"));
				thesis.setJournalNum(rs.getString("journalNum"));
				thesis.setJournalName(rs.getString("journalName"));
				thesis.setChecked(rs.getInt("checked"));
				thesis.setAttachment(rs.getString("attachment"));				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return thesis;		
	}
	public static int updateThesis(Thesis t){

		int i=-1;
		String sql = "update Thesis set ";
		String key = "ID";
		int k=1;
		try {
			Field[] field = t.getClass().getDeclaredFields();
			for (int j = 0; j < field.length; j++) {
				String name = field[j].getName();
				if(name.contains("$SWITCH_TABLE")){
					continue;
				}//����SWITCH_TABLE
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
						value = t.getClass().getMethod("get"+name1).invoke(t);
						typeName="Int";
						if((Integer)value==-2)continue;
					}
					else if(className.equals("double")){
						value = Class.forName("java.lang.Double");
					}
				else{
					value = Class.forName(className);
				}				 
				Method getMethod = t.getClass().getMethod("get"+name1);
	            value = getMethod.invoke(t);
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
			i = Dao.executUpdate(sql,t,key);
			if(i==0){
				UserAchievement a = new UserAchievement();
				a.setID(t.getID()+"");
				a.setName(t.getName());
				a.setUsername(t.getOwner());
				a.setCategory("thesis");
				a.setChecked(t.getChecked());
				UserAchievementDao.updateUserAchievemetByUsername(a);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Dao.close();
		return i;
	}
	public static int deleteThesis(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from Thesis where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='thesis'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
