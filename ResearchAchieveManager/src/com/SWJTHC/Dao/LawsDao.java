package com.SWJTHC.Dao;

import com.SWJTHC.model.Laws;
import com.SWJTHC.model.Patent;
import com.SWJTHC.model.UserAchievement;

public class LawsDao {
	public static int insertLaws(Laws l){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into Laws(name,score,attachment,owner,level,chiefEditor,editors,category,lawNumber,wordsCount,checked) values(?,?,?,?,?,?,?,?,?,?,?)",l,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i);
				a.setUsername(l.getOwner());
				a.setCategory("Laws");
				a.setName(l.getName());
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
