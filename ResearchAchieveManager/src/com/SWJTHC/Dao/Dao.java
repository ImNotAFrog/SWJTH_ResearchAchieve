package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	protected static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	protected static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=db_bookborrow;";
	protected static String dbUser = "sa";
	protected static String dbPwd = "sqlserver2008";
	private static Connection conn = null;
	private static PreparedStatement pstat = null;
	private Dao(){
		try{
			if(conn == null){
				Class.forName(dbClassName).newInstance();
				conn = DriverManager.getConnection(dbUrl,dbUser,dbPwd);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static ResultSet executQuery(String sql){
		try{
			if(conn == null){
				new Dao();
			}
			return conn.createStatement().executeQuery(sql);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	public static ResultSet executQuery(String sql,Object model){
		ResultSet rs=null;
		try{
			if(conn == null){
				new Dao();
			}
			if(model==null){
				return null;
			}
			pstat = conn.prepareStatement(sql);
			
			Field[] field = model.getClass().getDeclaredFields();            		//获取模型属性列表
			int k=1;
			for(int i=0;i<field.length;i++){										//遍历属性
				String name = field[i].getName();  							 		//获取当前属性名称
				name = name.substring(0,1).toUpperCase()+name.substring(1);			//将属性名称首字母改为大写方便合成get、set方法
				String type = field[i].getGenericType().toString();//.split(".");	//获取属性的类型   - class java.lang.*
				String[] classNameSplited = type.split(" ");						//
				String className = classNameSplited[classNameSplited.length-1];		//除去类型前的"class
				String[] typeSplited = type.split("\\.");							//
				String typeName = typeSplited[typeSplited.length-1];				//去除类型前的包名
				Object value;
				if(className.contains("List")){										//若类型为List，需要特殊的生成方式
					int start,end;
					for(int j=0;j<className.length();j++){
						if(className.charAt(j)=='<'){
							start = j;
						}
						if(className.charAt(j)=='>'){
							end = j;
						}
					}
					value = new ArrayList<>();
				}else{
					value = Class.forName(className);								//根据类型名称生成类
				}				 
				Method getMethod = model.getClass().getMethod("get"+name);			//合成get方法
                value = getMethod.invoke(model); 									//调用类的get方法
                if(value != null){
                	Method setMethod = pstat.getClass().getDeclaredMethod("set"+typeName,int.class,value.getClass()); 	//合成pstat的set方法
                	setMethod.invoke(pstat,k,value);																	//调用pstat的set方法
                	k++;																								//k用来标识当前sql语句中的参数位置	
               }
			}
			rs = pstat.executeQuery();
			return rs;//conn.createStatement().executeQuery(sql);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public static int executUpdate(String sql){
		try{
			if(conn==null){
				new Dao();
			}
			return conn.createStatement().executeUpdate(sql);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
	}
	public static int executUpdate(String sql,Object model , String key){
		int state=-1;
		ResultSet rs=null;
		try{
			if(conn == null){
				new Dao();
			}
			if(model==null){
				return -1;
			}
			pstat = conn.prepareStatement(sql);
			
			Field[] field = model.getClass().getDeclaredFields();
			int k=1;
			for(int i=0;i<field.length;i++){
				String name = field[i].getName();  
				name = name.substring(0,1).toUpperCase()+name.substring(1);
				String type = field[i].getGenericType().toString();//.split(".");//获取属性的类型
				String[] classNameSplited = type.split(" ");
				String className = classNameSplited[classNameSplited.length-1];
				String[] typeSplited = type.split("\\.");
				String typeName = typeSplited[typeSplited.length-1];
				Object value;
				if(className.contains("List")){
					int start,end;
					for(int j=0;j<className.length();j++){
						if(className.charAt(j)=='<'){
							start = j;
						}
						if(className.charAt(j)=='>'){
							end = j;
						}
					}
					value = new ArrayList<>();
				}else{
					value = Class.forName(className);
				}				 
				Method getMethod = model.getClass().getMethod("get"+name);
                value = getMethod.invoke(model); 
                if(value != null){
                	Method setMethod = pstat.getClass().getDeclaredMethod("set"+typeName,int.class,value.getClass());
                	setMethod.invoke(pstat,k,value);
                	k++;
               }
			}
			if (key!=null) {
				key = key.substring(0, 1).toUpperCase() + key.substring(1);
				Method getMethod = model.getClass().getMethod("get" + key);
				Object value = getMethod.invoke(model);
				if (value != null) {
					Method setMethod = pstat.getClass().getDeclaredMethod(
							"setString", int.class, value.getClass());
					setMethod.invoke(pstat, k, value);
				}
			}
			state = pstat.executeUpdate();
			return state;//conn.createStatement().executeQuery(sql);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
	}
	public static void close(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn = null;
		}
	}
}
