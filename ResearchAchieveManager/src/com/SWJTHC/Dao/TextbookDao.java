package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

public class TextbookDao {
	public static int insertTextbook(Textbook t){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into textbook(name,score,attachment,owner,publishDate,authorSituation,publishingHouse,ISBN,level,checked) values(?,?,?,?,?,?,?,?,?,?)",t,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				AppUser u = UserDao.getUserByUsername(t.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("textbook");
				a.setName(t.getName());
				a.setChecked(0);
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setScore(t.getScore());
				a.setAchievementDate(t.getPublishDate());
				switch(t.getLevel()){
					case "1":
						a.setMaxScore(45);
						break;
					case "2":
						a.setMaxScore(15);
						break;
					case "3":
						a.setMaxScore(5);
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
	public static Textbook getTextbookById(int id){		
		ResultSet rs=null;
		Textbook textbook = null;
		try {
			rs = Dao.executQuery("select * from textbook where id ="+id);
			while(rs.next()){ 
				textbook = new Textbook();
				textbook.setID(id);
				textbook.setName(rs.getString("name"));
				textbook.setAuthorSituation(rs.getString("authorSituation"));
				textbook.setScore(rs.getDouble("score"));
				textbook.setOwner(rs.getString("owner"));
				textbook.setISBN(rs.getString("ISBN"));
				textbook.setLevel(rs.getString("level"));
				textbook.setChecked(rs.getInt("checked"));
				textbook.setAttachment(rs.getString("attachment"));		
				textbook.setPublishingHouse(rs.getString("publishingHouse"));
				textbook.setPublishDate(rs.getDate("publishDate"));	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return textbook;		
	}
	public static int updateTextbook(Textbook t){

		int i=-1;
		String sql = "update textbook set ";
		String key = "ID";
		int k=1;
		try {
			Field[] field = t.getClass().getDeclaredFields();
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
				AppUser u = UserDao.getUserByUsername(t.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("textbook");
				a.setChecked(t.getChecked());
				a.setScore(t.getScore());
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setAchievementDate(t.getPublishDate());
				switch(t.getLevel()){
					case "1":
						a.setMaxScore(45);
						break;
					case "2":
						a.setMaxScore(15);
						break;
					case "3":
						a.setMaxScore(5);
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
	public static int deleteTextbook(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from textbook where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='textbook'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
