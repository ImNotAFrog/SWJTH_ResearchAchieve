package com.SWJTHC.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.SWJTHC.Dao.TextbookDao;
import com.SWJTHC.Dao.ThesisDao;
import com.SWJTHC.model.Textbook;
import com.SWJTHC.model.Thesis;

public class TextbookUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TextbookUpload() {
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
		String username= request.getSession().getAttribute("username").toString();
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String role = request.getSession().getAttribute("role").toString();
		PrintWriter out = response.getWriter();
		try {
			int i =-1; 
			if(request.getParameter("deleteAchievement")!=null){
				System.out.println(username+"：删除教材、著作"+ request.getParameter("deleteAchievement"));
				i=TextbookDao.deleteTextbook(Integer.parseInt(request.getParameter("deleteAchievement")));
			}else{
				Textbook t = new Textbook();
				t.setName(request.getParameter("textbookName"));
				t.setLevel(request.getParameter("level"));
				t.setAuthorSituation(request.getParameter("authorSituation"));
				t.setAttachment(request.getParameter("attachment"));
				t.setISBN(request.getParameter("ISBN"));
				t.setPublishingHouse(request.getParameter("publishingHouse"));
				java.sql.Date date = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("publishDate")).getTime());
				t.setPublishDate(date);
				t.setChecked(Integer.parseInt(request.getParameter("checked")));
				double countScore = 0;
				switch(t.getLevel()){
					case "1":
						switch(t.getAuthorSituation()){
						case "1":							
							countScore = 15;
							break;
						case "2":
							countScore = 10;
							break;
						case "3":
							countScore = 7;
							break;
						}
						break;
					case "2":
						switch(t.getAuthorSituation()){
						case "1":							
							countScore = 5;
							break;
						case "2":
							countScore = 3;
							break;
						case "3":
							countScore = 1;
							break;
						}
						break;
					case "3":
						switch(t.getAuthorSituation()){
						case "1":							
							countScore = 5;
							break;
						case "2":
							countScore = 3.3;
							break;
						case "3":
							countScore = 2.3;
							break;
						}
						break;
				}
				t.setScore(countScore);
				if(request.getParameter("ID")!=null){
					t.setID(Integer.parseInt(request.getParameter("ID")));
					t.setOwner(request.getParameter("owner"));
					double getScore = Double.parseDouble(request.getParameter("score"));
					if(TextbookDao.getTextbookById(t.getID()).getScore()!=getScore){
						t.setScore(getScore);
					}
					if(t.getChecked()==-1&&role.equals("teacher")){
						t.setChecked(0);
					}
					i=TextbookDao.updateTextbook(t);
				}else{

					t.setOwner(request.getSession().getAttribute("username").toString());
					i=TextbookDao.insertTextbook(t);
				}
			}if(request.getParameter("ID")!=null&&i==0&&request.getParameter("deleteAchievement")==null){
				out.print("<script type='text/javascript'charset='utf-8'>alert('论著、教材成果已更新!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else if(request.getParameter("deleteAchievement")!=null){
				JSONObject j = new JSONObject();
				j.put("result",1);
				out.write(j.toString());
			}else if(i!=-1){
				out.print("<script type='text/javascript'charset='utf-8'>alert('论著、教材成果上传成功!');window.location.href='"+projectPath+"/template/"+role+".jsp"+"';</script>");
			}else{
				out.print("<script type='text/javascript'charset='utf-8'>alert('论著、教材成果上传失败!');window.history.back(-1);</script>");
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
