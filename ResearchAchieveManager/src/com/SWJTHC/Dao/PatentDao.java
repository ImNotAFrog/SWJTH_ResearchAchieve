package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Patent;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.UserAchievement;

public class PatentDao {
	public static int insertPatent(Patent p){

		int i=-1;
		try {

			System.out.println(p.getOwner()+"：提交专利"+p.getID()+p.getName());
			i = Dao.executUpdate("insert into patent(name,score,attachment,owner,category,patentHolder,patentNum,patentDate,checked,authorSituation) values(?,?,?,?,?,?,?,?,?,?)",p,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i+"");
				AppUser u = UserDao.getUserByUsername(p.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("patent");
				a.setName(p.getName());
				a.setChecked(0);
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setScore(p.getScore());
				a.setAchievementDate(p.getPatentDate());
				a.setUserId(u.getUsername());
				switch(p.getCategory()){
				case "1":
					a.setMaxScore(24);
					break;
				case "2":
					a.setMaxScore(15);
					break;
				case "3":
					a.setMaxScore(12);
					break;
				case "4":
					a.setMaxScore(12);
					break;
				}
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked,score,department,subDepartment,achievementDate,maxScore,userId) values(?,?,?,?,?,?,?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	public static Patent getPatentById(int id){		
		ResultSet rs=null;
		Patent patent = null;
		try {
			rs = Dao.executQuery("select * from patent where id ="+id);
			while(rs.next()){ 
				patent = new Patent();
				patent.setID(id);
				patent.setPatentHolder(rs.getString("patentHolder"));
				patent.setPatentNum(rs.getString("patentNum"));
				patent.setName(rs.getString("name"));
				patent.setScore(rs.getDouble("score"));
				patent.setOwner(rs.getString("owner"));
				patent.setCategory(rs.getString("category"));
				patent.setPatentDate(rs.getDate("patentDate"));
				patent.setChecked(rs.getInt("checked"));
				patent.setAttachment(rs.getString("attachment"));
				patent.setAuthorSituation(rs.getString("authorSituation"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		Dao.close();
		return patent;		
	}
	
	public static int updatePatent(Patent p){

		int i=-1;
		String sql = "update patent set ";
		String key = "ID";
		int k=1;
		try {
			Field[] field = p.getClass().getDeclaredFields();
			for (int j = 0; j < field.length; j++) {
				String name = field[j].getName();
				if(name.contains("$SWITCH_TABLE")){
					continue;
				}//跳过SWITCH_TABLE
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

			System.out.println(p.getOwner()+"：更新专利"+p.getID()+p.getName());
			i = Dao.executUpdate(sql,p,key);
			if(i==0){
				UserAchievement a = new UserAchievement();
				a.setID(p.getID()+"");
				a.setName(p.getName());
				AppUser u = UserDao.getUserByUsername(p.getOwner()).get(0);
				a.setUsername(u.getName());
				a.setCategory("patent");
				a.setChecked(p.getChecked());
				a.setScore(p.getScore());
				a.setDepartment(u.getDepartment());
				a.setSubDepartment(u.getSubDepartment());
				a.setUserId(u.getUsername());
				a.setAchievementDate(p.getPatentDate());
				switch(p.getCategory()){
				case "1":
					a.setMaxScore(24);
					break;
				case "2":
					a.setMaxScore(15);
					break;
				case "3":
					a.setMaxScore(12);
					break;
				case "4":
					a.setMaxScore(12);
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
	public static int deletePatent(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from patent where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='patent'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Dao.close();
		return i;
	}
}
