package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.SWJTHC.Dao.UserDao;
import com.SWJTHC.enums.*;
import com.SWJTHC.model.AppUser;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectPath = request.getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String value=request.getParameter("Submit");
		String role = request.getSession().getAttribute("role").toString();
		if(value!=null){			
			AppUser u = UserDao.getUserByUsername(request.getParameter("username")).get(0);
			u.setName(request.getParameter("name"));
			u.setPosition(Position.valueOf(request.getParameter("position")));
			u.setPositionLevel(PositionLevel.valueOf(request.getParameter("positionLevel")));
			u.setTitle(Title.valueOf(request.getParameter("title")));
			u.setDepartment(Department.valueOf(request.getParameter("department")));
			u.setSubDepartment(request.getParameter("subDepartment"));
			UserDao.updateUserByUsername(u);
			out.print("<script type='text/javascript'charset='utf-8'>alert('个人资料修改成功!');window.location.href='"+projectPath+"/template/"+role+".jsp';</script>");
		}else{
			String department = request.getParameter("department");
			JSONObject j = new JSONObject();
			switch(department){
			case "LEADER":	
				for(int i=0;i<Leader.values().length;i++){
					j.put(Leader.values()[i], Leader.values()[i].getName());
				}
				out.write(j.toString());
				break;
			case "TRAINNING":
				for(int i=0;i<TrainingDep.values().length;i++){
					j.put(TrainingDep.values()[i], TrainingDep.values()[i].getName());
				}
				out.write(j.toString());
				break;
			case "POLITICAL":
				for(int i=0;i<PoliticalDep.values().length;i++){
					j.put(PoliticalDep.values()[i], PoliticalDep.values()[i].getName());
				}
				out.write(j.toString());
				break;
			case "SCHOOL_AFFAIRS":
				for(int i=0;i<SchoolAffairsDep.values().length;i++){
					j.put(SchoolAffairsDep.values()[i], SchoolAffairsDep.values()[i].getName());
				}
				out.write(j.toString());
				break;
			case "MANAGEMENT":
				for(int i=0;i<ManagementDep.values().length;i++){
					j.put(ManagementDep.values()[i], ManagementDep.values()[i].getName());
				}
				out.write(j.toString());
				break;
			default:
				out.write(j.toString());
				break;
			}
		}
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
