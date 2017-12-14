package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.Title;
import com.SWJTHC.interfaces.SubDepartment;
import com.SWJTHC.model.AppUser;

public class UserDao {
	private PreparedStatement pstat = null;
	public static int insertUser(AppUser u){
		
		int i=-1;
		try {
			i = Dao.executUpdate("insert into AppUser(username,password,role) values(?,?,?)",u,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static List<AppUser> getUserByUsername(AppUser u){
		ResultSet rs = null;
		List<AppUser> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from AppUser where username = ?",u);
			while(rs.next()){
				AppUser a = new AppUser();
				a.setUsername(rs.getString("username"));
				a.setPassword(rs.getString("password"));
				a.setDepartment(Department.valueOf(rs.getString("department")));
				a.setSubDepartment(rs.getString("subDepartment"));
				a.setPosition(Position.valueOf(rs.getString("position")));
				a.setPositionLevel(PositionLevel.valueOf(rs.getString("positionLevel")));
				a.setTitle(Title.valueOf(rs.getString("title")));
				a.setRole(rs.getString("role"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static List<AppUser> getUserByUsername(String username){
		AppUser u = new AppUser();
		u.setUsername(username);
		ResultSet rs = null;
		List<AppUser> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from AppUser where username = ?",u);
			while(rs.next()){
				AppUser a = new AppUser();
				a.setUsername(rs.getString("username"));
				a.setPassword(rs.getString("password"));
				if(rs.getString("name")!=null)a.setName(rs.getString("name"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				if(rs.getString("position")!=null&&!rs.getString("position").equals(""))a.setPosition(Position.valueOf(rs.getString("position")));
				if(rs.getString("positionLevel")!=null&&!rs.getString("positionLevel").equals(""))a.setPositionLevel(PositionLevel.valueOf(rs.getString("positionLevel")));
				if(rs.getString("title")!=null&&!rs.getString("title").equals(""))a.setTitle(Title.valueOf(rs.getString("title")));
				a.setRole(rs.getString("role"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static int deleteUser(String username){
		AppUser u = new AppUser();
		u.setUsername(username);
		int i=-1;
		try {
			i = Dao.executUpdate("delete from AppUser where username = ?",u,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static int updateUserByUsername(AppUser u){
		int i=-1;
		String sql = "update AppUser set ";
		String key = "username";
		int k=1;
		try {
			Field[] field = u.getClass().getDeclaredFields();
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
					}
					value = new ArrayList<>();
				}else{
					value = Class.forName(className);
				}				 
				Method getMethod = u.getClass().getMethod("get"+name1);
	            value = getMethod.invoke(u);
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
			sql+=" where username = ?";
			i = Dao.executUpdate(sql,u,key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Dao.close();
		return i;
	}
}
