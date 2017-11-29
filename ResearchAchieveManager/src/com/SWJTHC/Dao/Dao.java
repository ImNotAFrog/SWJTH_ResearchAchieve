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
			
			Field[] field = model.getClass().getDeclaredFields();            		//��ȡģ�������б�
			int k=1;
			for(int i=0;i<field.length;i++){										//��������
				String name = field[i].getName();  							 		//��ȡ��ǰ��������
				name = name.substring(0,1).toUpperCase()+name.substring(1);			//��������������ĸ��Ϊ��д����ϳ�get��set����
				String type = field[i].getGenericType().toString();//.split(".");	//��ȡ���Ե�����   - class java.lang.*
				String[] classNameSplited = type.split(" ");						//
				String className = classNameSplited[classNameSplited.length-1];		//��ȥ����ǰ��"class
				String[] typeSplited = type.split("\\.");							//
				String typeName = typeSplited[typeSplited.length-1];				//ȥ������ǰ�İ���
				Object value;
				if(className.contains("List")){										//������ΪList����Ҫ��������ɷ�ʽ
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
					value = Class.forName(className);								//������������������
				}				 
				Method getMethod = model.getClass().getMethod("get"+name);			//�ϳ�get����
                value = getMethod.invoke(model); 									//�������get����
                if(value != null){
                	Method setMethod = pstat.getClass().getDeclaredMethod("set"+typeName,int.class,value.getClass()); 	//�ϳ�pstat��set����
                	setMethod.invoke(pstat,k,value);																	//����pstat��set����
                	k++;																								//k������ʶ��ǰsql����еĲ���λ��	
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
				String type = field[i].getGenericType().toString();//.split(".");//��ȡ���Ե�����
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
