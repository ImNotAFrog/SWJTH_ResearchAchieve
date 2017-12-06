package com.javaEEProject.db;

import java.sql.*;

//JDBC,JAVA�������ݿ⣬ͨ�ù�����
//��϶ȵ�
public class Dao {
	protected static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	protected static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=JavaEEClass;";
	protected static String dbUser = "sa";
	protected static String dbPwd = "sqlserver2008";
	private static Connection conn = null;
	
	private Dao(){
		try{
			if(conn == null){
				Class.forName(dbClassName).newInstance();  //�������ݿ�����
				conn = DriverManager.getConnection(dbUrl,dbUser,dbPwd);  //�������ݿ�����
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	//ִ�����ݿ��ѯ
	//ResultSet Java�ļ����࣬������:Map��Set��Tree
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
	
	//ִ�����ݿ����
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
