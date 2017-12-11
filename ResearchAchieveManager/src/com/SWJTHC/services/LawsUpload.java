package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SWJTHC.Dao.LawsDao;
import com.SWJTHC.Dao.PatentDao;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.Patent;

public class LawsUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LawsUpload() {
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
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			Laws l = new Laws();
			l.setName(request.getParameter("lawName"));
			l.setOwner(request.getSession().getAttribute("username").toString());
			l.setCategory(request.getParameter("category"));
			l.setChiefEditor(request.getParameter("chiefEditor"));
			l.setEditors(request.getParameter("editors"));
			l.setLevel(request.getParameter("lawLevel"));
			l.setAttachment(request.getParameter("attachment"));
			l.setLawNumber(request.getParameter("lawNumber"));
			l.setWordsCount(request.getParameter("wordsCount"));
			l.setChecked(0);
			int i =-1; 
			i=LawsDao.insertLaws(l);
			if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('法律法规成果上传成功!');window.location.href='"+projectPath+"/template/teacher.jsp"+"';</script>");
			}else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('法律法规成果上传失败!');window.history.back(-1);</script>");
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

}
