import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.SWJTHC.Dao.Dao;
import com.SWJTHC.enums.Department;
import com.SWJTHC.enums.ManagementDep;
import com.SWJTHC.enums.PoliticalDep;
import com.SWJTHC.enums.Position;
import com.SWJTHC.enums.SchoolAffairsDep;
import com.SWJTHC.enums.TrainingDep;
import com.SWJTHC.model.AppUser;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.Thesis;


public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AppUser a = new AppUser();
		a.setUsername("admin");
		ResultSet rs = Dao.executQuery("select * from users where name = ?",a);
//		user.setPosition(Position.ADVISER);
//		user.setDepartment(Department.MANAGEMENT);
//		user.setSubDepartment(ManagementDep.OFFICE);
//		System.out.println(user.getDepartment().getSubDeps());
		
//		List<ManagementDep> l = (List<ManagementDep>)user.getDepartment().getSubDeps();
//		
		try {
			while(rs.next()){
				System.out.println(rs.getString("name"));
				System.out.println(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
