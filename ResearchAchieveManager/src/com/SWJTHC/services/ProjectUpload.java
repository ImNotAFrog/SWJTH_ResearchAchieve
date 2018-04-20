package com.SWJTHC.services;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.SWJTHC.Dao.EduProjectDao;
import com.SWJTHC.Dao.LawsDao;
import com.SWJTHC.Dao.PatentDao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.Dao.UserAchievementDao;
import com.SWJTHC.model.EduProject;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.UserAchievement;
import com.SWJTHC.Dao.AppConfigs;

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
		String username= request.getSession().getAttribute("username").toString();
		String role = request.getSession().getAttribute("role").toString();
		PrintWriter out = response.getWriter();
		try {
			int i =-1; 
			if(request.getParameter("deleteAchievement")!=null){
				System.out.println(username+"：删除课题项目"+ request.getParameter("deleteAchievement"));
				i=EduProjectDao.deleteEduProject(Integer.parseInt(request.getParameter("deleteAchievement")));
			}else{
				EduProject p = new EduProject();
				p.setName(request.getParameter("projectName"));
				p.setAuthorSituation(request.getParameter("authorSituation"));
				p.setSubject(request.getParameter("subject"));
				p.setLevel(request.getParameter("projectLevel"));
				
				p.setAttachment(request.getParameter("attachment"));
				String state = request.getParameter("state");
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("stateDate")).getTime());
				double countScore = 0;
				switch(p.getLevel()){
					case "1":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(17);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(18);
							break;
						}
						break;
					case "2":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(19);
							break;
						case "2":							
							countScore = AppConfigs.SCORES.get(20);
							break;
						}
						break;
					case "3":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(21);
							break;
						case "2":							
							countScore = AppConfigs.SCORES.get(22);
							break;
						}
						break;
					case "4":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(23);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(24);
							break;
						}
						break;
					case "5":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(25);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(26);
							break;
						}
						break;
					case "6":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(27);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(28);
							break;
						}
						break;
				}
				System.out.print(state);
				if(state.equals("立项在研")){
					countScore=0;
				}
				p.setScore(countScore);			
				
				p.setState(date.toString()+state);
				p.setChecked(Integer.parseInt(request.getParameter("checked")));
				if(request.getParameter("ID")!=null){
					p.setID(Integer.parseInt(request.getParameter("ID")));
					double getScore = Double.parseDouble(request.getParameter("score"));
					if(EduProjectDao.getEduProjectById(p.getID()).getScore()!=getScore){
						p.setScore(getScore);
					}
					p.setOwner(request.getParameter("owner"));
					if(p.getChecked()==-1&&role.equals("teacher")){
						p.setChecked(0);
					}
					i=EduProjectDao.updateEduProject(p);
				}else{
					p.setOwner(request.getSession().getAttribute("username").toString());
					
					i=EduProjectDao.insertEduProject(p);
				}
			}
			if(request.getParameter("next")!=null){
				java.util.List<UserAchievement> ls = new ArrayList();
				if(request.getParameter("next").equals("pass")){
					ls = UserAchievementDao.getNextUncheckedAchievement("eduProject",Integer.parseInt(request.getParameter("checked"))-1);
				}else{
					ls = UserAchievementDao.getNextUncheckedAchievement("eduProject",Integer.parseInt(request.getParameter("checked"))+1);
				}
				 
				 if(ls.size()>0){
					 UserAchievement ua = ls.get(0);
					 out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果已更新!');window.location.href='"+projectPath+"/template/upload/eduProjectUpload.jsp?AchievementId="+ua.getID()+"&state=EXAMING';</script>");
				 }else{
					 out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
				 }
				
			}else if(request.getParameter("ID")!=null&&i==0&&request.getParameter("deleteAchievement")==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else if(request.getParameter("deleteAchievement")!=null){
				JSONObject j = new JSONObject();
				j.put("result",1);
				out.write(j.toString());
			}else if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果上传成功!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}
			else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果上传失败!');window.history.back(-1);</script>");
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
