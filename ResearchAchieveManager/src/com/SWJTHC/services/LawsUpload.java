package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.SWJTHC.Dao.AppConfigs;
import com.SWJTHC.Dao.LawsDao;
import com.SWJTHC.Dao.PatentDao;
import com.SWJTHC.Dao.TextbookDao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.Dao.UserAchievementDao;
import com.SWJTHC.model.Laws;
import com.SWJTHC.model.Patent;
import com.SWJTHC.model.UserAchievement;

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
		String role = request.getSession().getAttribute("role").toString();
		PrintWriter out = response.getWriter();
		try {
			int i =-1; 
			if(request.getParameter("deleteAchievement")!=null){
				i=LawsDao.deleteLaw(Integer.parseInt(request.getParameter("deleteAchievement")));
			}else{
				Laws l = new Laws();
				l.setName(request.getParameter("lawName"));		
				l.setAuthorSituation(request.getParameter("authorSituation"));
				l.setLevel(request.getParameter("lawLevel"));
				l.setAttachment(request.getParameter("attachment"));
				l.setLawNumber(request.getParameter("lawNumber"));
				l.setWordsCount(request.getParameter("wordsCount"));
				l.setChecked(Integer.parseInt(request.getParameter("checked")));
				
				double countScore = 0;
				switch(l.getLevel()){
					case "1":
						switch(l.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(31);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(32);
							break;
						}
						break;
					case "2":
						switch(l.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(33);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(34);
							break;
						}
						break;
					case "3":
						switch(l.getAuthorSituation()){
						case "1":							
							countScore = AppConfigs.SCORES.get(35);
							break;
						case "2":
							countScore = AppConfigs.SCORES.get(36);
							break;
						}
						break;
				}
				l.setScore(countScore);
				if(request.getParameter("ID")!=null){
					l.setID(Integer.parseInt(request.getParameter("ID")));
					double getScore = Double.parseDouble(request.getParameter("score"));
					if(LawsDao.getLawById(l.getID()).getScore()!=getScore){
						l.setScore(getScore);
					}
					l.setOwner(request.getParameter("owner"));
					if(l.getChecked()==-1&&role.equals("teacher")){
						l.setChecked(0);
					}
					i=LawsDao.updateLaw(l);
				}else{
					l.setOwner(request.getSession().getAttribute("username").toString());
					i=LawsDao.insertLaws(l);
				}
			}if(request.getParameter("next")!=null){
				java.util.List<UserAchievement> ls = new ArrayList();
				if(request.getParameter("next").equals("pass")){
					ls = UserAchievementDao.getNextUncheckedAchievement("laws",Integer.parseInt(request.getParameter("checked"))-1);
				}else{
					ls = UserAchievementDao.getNextUncheckedAchievement("laws",Integer.parseInt(request.getParameter("checked"))+1);
				}
				 
				 if(ls.size()>0){
					 UserAchievement ua = ls.get(0);
					 out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果已更新!');window.location.href='"+projectPath+"/template/upload/lawsUpload.jsp?AchievementId="+ua.getID()+"&state=EXAMING';</script>");
				 }else{
					 out.print("<script type='text/javascript'charset='utf-8'>alert('课题项目成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
				 }
				
			}else if(request.getParameter("ID")!=null&&i==0&&request.getParameter("deleteAchievement")==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('法律法规成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else if(request.getParameter("deleteAchievement")!=null){
				JSONObject j = new JSONObject();
				j.put("result",1);
				out.write(j.toString());
			}else if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('法律法规成果上传成功!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
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
