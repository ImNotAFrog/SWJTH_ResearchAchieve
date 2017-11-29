package com.SWJTHC.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.SWJTHC.model.AppUser;

public class UserDao {
	private PreparedStatement pstat = null;
    private ResultSet rs = null;
	public static int insertUser(AppUser u){
		String sql = "insert into users()";
		ResultSet rs = Dao.executQuery(sql,u);
		try {
			while(rs.next()){
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Dao.close();
		return 0;
	}
}
