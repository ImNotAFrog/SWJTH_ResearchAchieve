package com.SWJTHC.Dao;

import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.UserAchievement;

public class TextbookDao {
	public static int insertTextbook(Textbook t){

		int i=-1;
		try {
			i = Dao.executUpdate("insert into Textbook(name,score,attachment,owner,publishDate,authorSituation,publishingHouse,ISBN,level,checked) values(?,?,?,?,?,?,?,?,?,?)",t,null);
			if(i!=-1){
				UserAchievement a = new UserAchievement();
				a.setID(i);
				a.setUsername(t.getOwner());
				a.setCategory("Textbook");
				a.setName(t.getName());
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
