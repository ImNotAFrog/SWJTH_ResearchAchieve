package com.SWJTHC.Dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.Title;
import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.UserAchievement;

public class UserAchievementDao {
	public static List<UserAchievement> getAchievementByUsername(String username){
		UserAchievement u = new UserAchievement();
		u.setUsername(username);
		ResultSet rs = null;
		List<UserAchievement> l = new ArrayList();
		try {
			rs = Dao.executQuery("select * from UserAchievement where username = ?",u);
			while(rs.next()){
				UserAchievement a = new UserAchievement();
				a.setUsername(rs.getString("username"));
				a.setCategory(rs.getString("category"));
				a.setID(rs.getString("ID"));
				a.setName(rs.getString("name"));
				a.setChecked(rs.getInt("checked"));				
				l.add(a);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return l;
	}
}
