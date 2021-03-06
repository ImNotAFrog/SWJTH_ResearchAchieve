package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.Patent;
import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

public class LawsDao {
	public static int insertLaws(Laws l){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into laws(name,score,attachment,owner,level,authorSituation,lawNumber,wordsCount,checked) values(?,?,?,?,?,?,?,?,?)",l,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				AppUser u = UserDao.getUserByUsername(l.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("laws");
				a.setName(l.getName());
				a.setChecked(0);
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setScore(l.getScore());
				a.setUserId(u.getUsername());
				a.setAchievementDate(new java.sql.Date(new java.util.Date().getTime()));
				switch(l.getLevel()){
				case "1":
					a.setMaxScore(300);
					break;
				case "2":
					a.setMaxScore(90);
					break;
				case "3":
					a.setMaxScore(45);
					break;
				}
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked,score,department,subDepartment,achievement,maxScore,userId) values(?,?,?,?,?,?,?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static Laws getLawById(int id){		
		ResultSet rs=null;
		Laws law = null;
		try {
			rs = Dao.executQuery("select * from laws where id ="+id);
			while(rs.next()){ 
				law = new Laws();
				law.setID(id);
				law.setName(rs.getString("name"));
				law.setScore(rs.getDouble("score"));
				law.setOwner(rs.getString("owner"));
				law.setAuthorSituation(rs.getString("authorSituation"));
				law.setChecked(rs.getInt("checked"));
				law.setAttachment(rs.getString("attachment"));	
				law.setLawNumber(rs.getString("lawNumber"));
				law.setLevel(rs.getString("level"));
				law.setWordsCount(rs.getString("wordsCount"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		Dao.close();
		return law;		
	}
	
	public static int updateLaw(Laws l){

		int i=-1;
		String sql = "update laws set ";
		String key = "ID";
		int k=1;
		try {
			Field[] field = l.getClass().getDeclaredFields();
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
						value = l.getClass().getMethod("get"+name1).invoke(l);
						typeName="Int";
						if((Integer)value==-2)continue;
					}
					else if(className.equals("double")){
						value = Class.forName("java.lang.Double");
					}
				else{
					value = Class.forName(className);
				}				 
				Method getMethod = l.getClass().getMethod("get"+name1);
	            value = getMethod.invoke(l);
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
			i = Dao.executUpdate(sql,l,key);
			if(i==0){
				UserAchievement a = new UserAchievement();
				a.setID(l.getID()+"");
				a.setName(l.getName());
				AppUser u = UserDao.getUserByUsername(l.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("laws");
				a.setChecked(l.getChecked());
				a.setScore(l.getScore());
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setUserId(u.getUsername());
				switch(l.getLevel()){
				case "1":
					a.setMaxScore(300);
					break;
				case "2":
					a.setMaxScore(90);
					break;
				case "3":
					a.setMaxScore(45);
					break;
				}
				UserAchievementDao.updateUserAchievemetByUsername(a);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}

	public static int deleteLaw(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from laws where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='laws'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Dao.close();
		return i;
	}
}
