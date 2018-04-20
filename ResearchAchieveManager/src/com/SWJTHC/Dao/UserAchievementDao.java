package com.SWJTHC.Dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.Title;
import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.UserAchievement;

public class UserAchievementDao {
	public static List<UserAchievement> getAchievementList(){
		UserAchievement u = new UserAchievement();
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement");
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));	
				a.setScore(rs.getDouble("score"));
				a.setAchievementDate(rs.getDate("achievementDate"));
				a.setMaxScore(rs.getDouble("maxScore"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	
	public static List<UserAchievement> getAchievementByUsername(String username){
		AppUser u = UserDao.getUserByUsername(username).get(0);
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement where username = '"+u.getName()+"'");
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));
				a.setScore(rs.getDouble("score"));
				a.setAchievementDate(rs.getDate("achievementDate"));
				a.setMaxScore(rs.getDouble("maxScore"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static List<UserAchievement> getAchievementByUserId(String userId){
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement where userId = '"+userId+"'");
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));
				a.setScore(rs.getDouble("score"));
				a.setAchievementDate(rs.getDate("achievementDate"));
				a.setMaxScore(rs.getDouble("maxScore"));
				a.setUserId(rs.getString("userId"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static List<UserAchievement> getAchievementByName(String name){
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement where name = '"+name+"'");
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));
				a.setScore(rs.getDouble("score"));
				a.setAchievementDate(rs.getDate("achievementDate"));
				a.setMaxScore(rs.getDouble("maxScore"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static List<UserAchievement> getNextUncheckedAchievement(String category, int checked){
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement where category = '"+category+"' and checked = "+checked);
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));
				a.setScore(rs.getDouble("score"));
				a.setAchievementDate(rs.getDate("achievementDate"));
				a.setMaxScore(rs.getDouble("maxScore"));
				if(rs.getString("department")!=null&&!rs.getString("department").equals(""))a.setDepartment(Department.valueOf(rs.getString("department")));
				if(rs.getString("subDepartment")!=null&&!rs.getString("subDepartment").equals(""))a.setSubDepartment(rs.getString("subDepartment"));
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
	
	public static int updateUserAchievemetByUsername(UserAchievement u){
		int i=-1;
		String dateString = new SimpleDateFormat("yyyy-MM-dd").format(u.getAchievementDate());
		String sql = "update UserAchievement set name='"+u.getName()+"',checked="+u.getChecked()+",score="+u.getScore()+",maxScore='"+u.getMaxScore()+"',department='"+u.getDepartment()+"',subDepartment='"+u.getSubDepartment()+"',achievementDate='"+dateString+"' where category='"+u.getCategory()+"' and username='"+u.getUsername()+"' and ID="+u.getID();
		try{
			i = Dao.executUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
}
