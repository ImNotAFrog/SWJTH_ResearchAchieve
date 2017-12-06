package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SWJTHC.Dao.Dao;


public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		//前端使用Form表单提交数据；
		//1、Form形式打包，没有经过JS处理
		//2、数据提交之后页面自动刷新
		
		//获取前端数据
		String username = request.getParameter("form-username");
		String password = request.getParameter("form-password");	
		
		String sql = "select * from AppUsers where username='"+username+"' and password='"+password+"'";
		ResultSet rs = Dao.executQuery(sql);
		
		try {
			if(rs.next()){
				//登录成功
				request.getSession().setAttribute("username", username);
				//request.getSession().setAttribute("password", password);
				
				if(request.getParameterValues("rememberMe")!=null&&request.getParameterValues("rememberMe").length>0){
					
					
					Cookie usernameCookie = new Cookie("username",URLEncoder.encode(username, "utf-8"));
					Cookie passwordCookie = new Cookie("password",URLEncoder.encode(password, "utf-8"));
					usernameCookie.setMaxAge(604800);
					passwordCookie.setMaxAge(604800);
					usernameCookie.setPath("/");
					passwordCookie.setPath("/");				
					response.addCookie(usernameCookie);
					response.addCookie(passwordCookie);	
				}else{
					Cookie[] cookies = request.getCookies();
					
					for(Cookie c : cookies){
						if(c.getName().equals("username")){
							c.setMaxAge(0);
							c.setPath("/");
							response.addCookie(c);							
						}
						if(c.getName().equals("password")){
							c.setMaxAge(0);
							c.setPath("/");
							response.addCookie(c);							
						}						
					}					
				}
						
				
				response.sendRedirect("/JavaEEProject/MyJsp.jsp");
			}else{
				
			}
		} catch (SQLException e) {
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

}
