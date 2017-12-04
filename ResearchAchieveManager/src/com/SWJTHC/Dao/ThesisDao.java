package com.SWJTHC.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SWJTHC.model.Thesis;

public class ThesisDao {
	private PreparedStatement pstat = null;
    private ResultSet rs = null;
	public static int insertThesis(Thesis t){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into Thesis(name,level,journal_id,score,attachment,owner) values(?,?,?,?,?,?)",t,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
}
