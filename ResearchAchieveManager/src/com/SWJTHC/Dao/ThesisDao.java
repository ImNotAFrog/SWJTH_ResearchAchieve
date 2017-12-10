package com.SWJTHC.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SWJTHC.model.Thesis;
import com.SWJTHC.model.UserAchievement;

public class ThesisDao {
	private PreparedStatement pstat = null;
	public static int insertThesis(Thesis t){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into Thesis(name,score,attachment,owner,journal_id,journal_name,journal_level) values(?,?,?,?,?,?,?)",t,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i);
				a.setUsername(t.getOwner());
				a.setCategory("Thesis");
				a.setName(t.getName());
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name) values(?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
	
	public static Thesis getThesisById(int id){		
		ResultSet rs=null;
		Thesis thesis = null;
		try {
			rs = Dao.executQuery("select * from Thesis where id ="+id);
			while(rs.next()){ 
				thesis = new Thesis();
				thesis.setID(id);
				thesis.setName(rs.getString("name"));
				thesis.setJournalLevel(rs.getString("journal_level"));
				thesis.setScore(rs.getDouble("score"));
				thesis.setOwner(rs.getString("owner"));
				thesis.setJournalNum(rs.getString("journal_id"));
				thesis.setJournal(rs.getString("journal_name"));
				thesis.setAttachment(rs.getString("attachment"));				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return thesis;		
	}
	
	public static int deleteThesis(int id){
		int i=-1;
		try {
			i=Dao.executUpdate("delete from Thesis where id = "+id);
			Dao.executUpdate("delete from UserAchievement where ID="+id+" and category='Thesis'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
