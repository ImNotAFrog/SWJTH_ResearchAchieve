package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.SWJTHC.Dao.Dao;
import com.SWJTHC.Dao.UserDao;
import com.SWJTHC.model.AppUser;


public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	private static String projectPath;
	public LoginServlet() {
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
		projectPath = request.getContextPath();
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//前端使用Form表单提交数据；
		//1、Form形式打包，没有经过JS处理
		//2、数据提交之后页面自动刷新
		
		//获取前端数据
		String username = request.getParameter("form-username");
		String password = request.getParameter("form-password");	
		
		String sql = "select * from AppUser where username='"+username+"' and password='"+password+"'";
		ResultSet rs = Dao.executQuery(sql);
		
		try {
			if(rs==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('用户名或密码错误，登录失败!');window.location.href='"+projectPath+"/template/login.jsp"+"';</script>");
			}else if(rs.next()){
				//登录成功
				request.getSession().setAttribute("username", username);
				List<AppUser> l = UserDao.getUserByUsername(username);
				
				AppUser u = l.get(0);

				request.getSession().setAttribute("role", u.getRole());
				//request.setAttribute("user", u);
				if(u.getRole().equals("teacher")){
					request.getRequestDispatcher("/template/teacher.jsp").forward(request, response);
				}else if(u.getRole().equals("admin")){
					request.getRequestDispatcher("/template/admin.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/template/index.jsp").forward(request, response);
				}
				
			}else{				
				out.print("<script type='text/javascript'charset='utf-8'>alert('用户名或密码错误，登录失败!');window.location.href='"+projectPath+"/template/login.jsp"+"';</script>");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public static void logout(){
		 
	}

}
