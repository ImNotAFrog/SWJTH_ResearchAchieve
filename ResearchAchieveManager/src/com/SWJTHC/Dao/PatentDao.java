package com.SWJTHC.Dao;

import com.SWJTHC.model.Patent;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.UserAchievement;

public class PatentDao {
	public static int insertPatent(Patent p){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into patent(name,score,attachment,owner,category,patentHolder,patentNum,patentDate,checked) values(?,?,?,?,?,?,?,?,?)",p,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i);
				a.setUsername(p.getOwner());
				a.setCategory("Patent");
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
