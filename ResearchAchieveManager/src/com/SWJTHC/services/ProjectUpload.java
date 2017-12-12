package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.SWJTHC.Dao.EduProjectDao;
import com.SWJTHC.Dao.LawsDao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Laws;

public class ProjectUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProjectUpload() {
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
			int i =-1; 
			if(request.getParameter("deleteAchievement")!=null){
				i=EduProjectDao.deleteEduProject(Integer.parseInt(request.getParameter("deleteAchievement")));
			}else{
				EduProject p = new EduProject();
				p.setName(request.getParameter("projectName"));
				p.setOwner(request.getSession().getAttribute("username").toString());
				p.setAuthorSituation(request.getParameter("authorSituation"));
				p.setSubject(request.getParameter("subject"));
				p.setLevel(request.getParameter("projectLevel"));
				p.setAttachment(request.getParameter("attachment"));
				String state = request.getParameter("state");
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("stateDate")).getTime());
				
				p.setState(date.toString()+state);
				p.setChecked(0);
				if(request.getParameter("ID")!=null){
					p.setID(Integer.parseInt(request.getParameter("ID")));
					i=EduProjectDao.updateEduProject(p);
				}else{
					i=EduProjectDao.insertEduProject(p);
				}
			}
			if(request.getParameter("ID")!=null&&i==0&&request.getParameter("deleteAchievement")==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('教研项目成果更新成功!');window.location.href='"+projectPath+"/template/teacher.jsp"+"';</script>");
			}else if(request.getParameter("deleteAchievement")!=null){
				JSONObject j = new JSONObject();
				j.put("result",1);
				out.write(j.toString());
			}else if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('教研项目成果上传成功!');window.location.href='"+projectPath+"/template/teacher.jsp"+"';</script>");
			}
			else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('教研项目成果上传失败!');window.history.back(-1);</script>");
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
