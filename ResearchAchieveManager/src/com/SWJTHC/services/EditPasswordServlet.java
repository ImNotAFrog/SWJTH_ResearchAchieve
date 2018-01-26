package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SWJTHC.Dao.Dao;
import com.SWJTHC.Dao.UserDao;
import com.SWJTHC.model.AppUser;

public class EditPasswordServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditPasswordServlet() {
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

		doPost(request, response);
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
		String projectPath = request.getContextPath();
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getSession().getAttribute("username").toString();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String sql = "select * from AppUser where username='"+username+"' and password='"+oldPassword+"'";
		ResultSet rs = Dao.executQuery(sql);
		try {
			if(rs==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('Ô­ÃÜÂë´íÎó£¬ÐÞ¸ÄÊ§°Ü!');window.history.back(-1);</script>");
			}else if(rs.next()){
				//ÐÞ¸Ä³É¹¦
				List<AppUser> l = UserDao.getUserByUsername(username);
				
				AppUser u = l.get(0);
				u.setPassword(newPassword);
				UserDao.updateUserByUsername(u);
				//request.setAttribute("user", u);
				out.print("<script type='text/javascript'charset='utf-8'>alert('ÃÜÂëÒÑÐÞ¸Ä!');window.location.href='"+projectPath+"/template/index.jsp"+"';</script>");
				
			}else{				
				out.print("<script type='text/javascript'charset='utf-8'>alert('Ô­ÃÜÂë´íÎó£¬ÐÞ¸ÄÊ§°Ü!');window.history.back(-1);</script>");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
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
