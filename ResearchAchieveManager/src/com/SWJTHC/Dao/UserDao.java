package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.SWJTHC.model.AppUser;

public class UserDao {
	private PreparedStatement pstat = null;
    private ResultSet rs = null;
	public static int insertUser(AppUser u){
		
		int i=-1;
		try {
			i = Dao.executUpdate("insert into users(name,password) values(?,?)",u,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static ResultSet getUserByUsername(AppUser u){
		ResultSet rs = null;
		try {
			rs = Dao.executQuery("select * from users where name = ?",u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return rs;
	}
	
	public static int deleteUser(AppUser u){
		int i=-1;
		try {
			i = Dao.executUpdate("delete from users where name = ?",u,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static int updateUser(AppUser u){
		int i=-1;
		String sql = "update users set ";
		String key = "username";
		int k=1;
		try {
			Field[] field = u.getClass().getDeclaredFields();
			for (int j = 0; j < field.length; j++) {
				String name = field[j].getName();
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
	                	u.setUsername(null);
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
			System.out.println(u.getUsername());
			//i = Dao.executUpdate(sql,u,key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Dao.close();
		return i;
	}
}
