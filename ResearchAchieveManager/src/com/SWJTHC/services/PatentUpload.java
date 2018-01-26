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
		String username= request.getSession().getAttribute("username").toString();
		String role = request.getSession().getAttribute("role").toString();
		PrintWriter out = response.getWriter();
		try {
			int i =-1; 
			if(request.getParameter("deleteAchievement")!=null){
				System.out.println(username+"：删除专利项目"+ request.getParameter("deleteAchievement"));
				i=PatentDao.deletePatent(Integer.parseInt(request.getParameter("deleteAchievement")));
			}else{
				Patent p = new Patent();
				p.setName(request.getParameter("patentName"));
				
				p.setCategory(request.getParameter("category"));
				p.setPatentNum(request.getParameter("patentNum"));
				p.setPatentHolder(request.getParameter("patentHolder"));
				p.setAttachment(request.getParameter("attachment"));
				p.setAuthorSituation(request.getParameter("authorSituation"));
				
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("patentDate")).getTime());
				p.setPatentDate(date);
				p.setChecked(Integer.parseInt(request.getParameter("checked")));
				double countScore = 0;
				switch(p.getCategory()){
					case "1":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = 8;
							break;
						case "2":
							countScore = 3;
							break;
						case "3":
							countScore = 1;
							break;
						}
						break;
					case "2":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = 5;
							break;
						}
						break;
					case "3":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = 4;
							break;
						}
						break;
					case "4":
						switch(p.getAuthorSituation()){
						case "1":							
							countScore = 4;
							break;
						case "2":
							countScore = 2;
							break;
						}
						break;
				}
				p.setScore(countScore);
				
				
				if(request.getParameter("ID")!=null){
					p.setID(Integer.parseInt(request.getParameter("ID")));
					p.setOwner(request.getParameter("owner"));
					double getScore = Double.parseDouble(request.getParameter("score"));
					if(PatentDao.getPatentById(p.getID()).getScore()!=getScore){
						p.setScore(getScore);
					}
					if(p.getChecked()==-1&&role.equals("teacher")){
						p.setChecked(0);
					}
					i=PatentDao.updatePatent(p);
				}else{
					p.setOwner(request.getSession().getAttribute("username").toString());
					i=PatentDao.insertPatent(p);
				}
			}if(request.getParameter("ID")!=null&&i==0&&request.getParameter("deleteAchievement")==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('专利成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else if(request.getParameter("deleteAchievement")!=null){
				JSONObject j = new JSONObject();
				j.put("result",1);
				out.write(j.toString());
			}else if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('专利成果上传成功!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('专利成果上传失败!');window.history.back(-1);</script>");
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
