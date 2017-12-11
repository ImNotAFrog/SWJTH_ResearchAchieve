package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SWJTHC.Dao.PatentDao;
import com.SWJTHC.Dao.TextbookDao;
import com.SWJTHC.model.Patent;
import com.SWJTHC.model.Textbook;

public class PatentUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PatentUpload() {
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
			Patent p = new Patent();
			p.setName(request.getParameter("patentName"));
			p.setOwner(request.getSession().getAttribute("username").toString());
			p.setCategory(request.getParameter("category"));
			p.setPatentNum(request.getParameter("patentNum"));
			p.setPatentHolder(request.getParameter("patentHolder"));
			java.sql.Date date = new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("patentDate")).getTime());
			p.setPatentDate(date);
			p.setChecked(0);
			int i =-1; 
			i=PatentDao.insertPatent(p);
			if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('ר���ɹ��ϴ��ɹ�!');window.location.href='"+projectPath+"/template/teacher.jsp"+"';</script>");
			}else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('ר���ɹ��ϴ�ʧ��!');window.history.back(-1);</script>");
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