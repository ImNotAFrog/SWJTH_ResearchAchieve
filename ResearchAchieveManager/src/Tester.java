import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.SWJTHC.Dao.Dao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.Dao.UserDao;
import com.SWJTHC.enums.AchieveType;
import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.ManagementDep;
import com.SWJTHC.enums.PoliticalDep;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.PositionLevel;
import com.SWJTHC.enums.SchoolAffairsDep;
import com.SWJTHC.enums.Title;
import com.SWJTHC.enums.TrainingDep;
import com.SWJTHC.interfaces.SubDepartment;
import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.Thesis;


public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thesis t= new Thesis();
		t.setName("基于大数据的学生上网习惯研究");
		t.setScore(80);
		t.setJournal(1234567);
		t.setOwner("testing");
		t.setLevel("国家级");
		t.setAchieveType(AchieveType.THESIS);
		ThesisDao.insertThesis(t);
	}

}
