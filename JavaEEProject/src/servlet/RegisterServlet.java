package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEEProject.db.Dao;;

public class RegisterServlet extends HttpServlet {
	protected static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	protected static String dbUrl = "jdbc:sqlserver://localhost:1433;"+"DatabaseName=db_bookborrow;";
	protected static String dbUser = "sa";
	protected static String dbPwd = "sqlserver2008";
	private static Connection conn = null;
	/**
	 * Constructor of the object.���췽�� 
	 */
	public RegisterServlet() {
		//�ͻ��˵�һ�η���
		super();
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
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
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//ǰ��ʹ��AJAX��ʽ��������
		//1��ʹ��JS��������
		//2���ύ��ʽ/�����ظ������
		
		//BootStrap�ĵ�
		
		//AngularJS����ʦ
		//AJAX��ʽ
		
		//��ȡǰ������
		String name = request.getParameter("name");
		String password = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String career = request.getParameter("career");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String hobby = request.getParameter("hobby");
		String introduction = request.getParameter("introduction");
		
	
		int i=0;
		String sql = "insert into AppUsers(username,password,sex,career,telephone,email,hobby,introduction) values('"+name+"','"+password+"','"+sex+"','"+career+"','"+telephone+"','"+email+"','"+hobby+"','"+introduction+"')";
		i = Dao.executUpdate(sql);
		if(i==1){
			System.out.println("ע��ɹ�");
		}else{
			System.out.println("ע��ʧ��");
		}
		//response.setStatus(200);
		//request.getRequestDispatcher("/index.jsp").forward(request, response);	
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		HttpSession session = request.getSession();
		session.setAttribute("username", name);
		out.println(i);
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



}
