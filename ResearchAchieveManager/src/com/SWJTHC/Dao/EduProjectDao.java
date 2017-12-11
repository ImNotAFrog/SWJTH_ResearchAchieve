package com.SWJTHC.Dao;

import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.UserAchievement;

public class EduProjectDao {
	public static int insertEduProject(EduProject p){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into eduProject(name,score,attachment,owner,subject,level,groupLeader,members,state,checked) values(?,?,?,?,?,?,?,?,?,?)",p,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i);
				a.setUsername(p.getOwner());
				a.setCategory("Laws");
				a.setName(p.getName());
				a.setChecked(0);
				Dao.executUpdate("insert into UserAchievement(ID,username,category,name,checked) values(?,?,?,?,?)", a, null);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao.close();
		return i;
	}
}
