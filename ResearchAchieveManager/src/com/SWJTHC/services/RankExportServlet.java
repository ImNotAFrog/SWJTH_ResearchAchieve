package com.SWJTHC.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.SWJTHC.Dao.AppConfigs;
import com.SWJTHC.Dao.IndivComparator;
import com.SWJTHC.Dao.UserAchievementDao;
import com.SWJTHC.model.UserAchievement;

public class RankExportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RankExportServlet() {
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

		doPost(request, response);
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		List<UserAchievement> all = UserAchievementDao.getAchievementList();
		List<UserAchievement> approval=new ArrayList();
		Map<String,Integer> achieveNum = new HashMap<String, Integer>();
		String s =request.getParameter("startDate");
		String e =request.getParameter("endDate");
		java.sql.Date start = java.sql.Date.valueOf(s);
		java.sql.Date end = java.sql.Date.valueOf(e);
		XSSFWorkbook wb = new XSSFWorkbook();  
        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet 
        XSSFSheet sheet;  
        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
        XSSFRow row;  
        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
        XSSFCellStyle style;  

        XSSFCell cell;  
		for(int i=0;i<all.size();i++){
		
			if(all.get(i).getChecked()==2&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
				//System.out.println(all.get(i).getUsername()+all.get(i).getName()+all.get(i).getAchievementDate());
				approval.add(all.get(i));
			}
		}
		List<UserAchievement> result = new ArrayList();
		switch(request.getParameter("state")){
			case "indivRank":
				for(int i=0;i<approval.size();i++){
					
					int place=-1;
					String name1 = approval.get(i).getUsername();
					for(int j=0;j<result.size();j++){
						if(name1.equals(result.get(j).getUsername())){
							place=j;
							break;
						}
					}
					if(place==-1){
						result.add(approval.get(i));
						achieveNum.put(approval.get(i).getUsername(),1);
					}else{
						double sum = result.get(place).getScore()+approval.get(i).getScore();
						
						result.get(place).setScore(sum);
						int n = achieveNum.get(result.get(place).getUsername());
						achieveNum.put(result.get(place).getUsername(),n+1);
						
					}
				} 
				Collections.sort(result, new IndivComparator());
				wb = new XSSFWorkbook();  
		        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet 
		        sheet = wb.createSheet("������������");  
		        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
		        row = sheet.createRow((int) 0);  
		        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
		        style = wb.createCellStyle();  

		        cell = row.createCell((short) 0);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 1);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 2);  
		        cell.setCellValue("�ɹ�����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 3);  
		        cell.setCellValue("�ܷ�");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 4);  
		        cell.setCellValue("��������");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 5);  
		        cell.setCellValue("�����Ӳ���");  
		        cell.setCellStyle(style);  
		        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���  
					        
		        for (int i = 0; i < result.size(); i++) {  
		            row = sheet.createRow((int) i + 1);  
		            UserAchievement UA = (UserAchievement)result.get(i);  
		            // ���Ĳ���������Ԫ�񣬲�����ֵ  
		            row.createCell((short)0).setCellValue(i+1);  
		            row.createCell((short)1).setCellValue(UA.getUsername());  
		            row.createCell((short)2).setCellValue(achieveNum.get(UA.getUsername()));  
		            row.createCell((short)3).setCellValue(UA.getScore());  
		  
		            row.createCell((short) 4).setCellValue(UA.getDepartment().getName());  
		            row.createCell((short) 5).setCellValue(UA.getSubDepartment().getName());
		        }  
			break;
			
			case "departRank":
				List<UserAchievement> trainDep = new ArrayList();
				for(int i=0;i<approval.size();i++){
					if(approval.get(i).getDepartment().toString().equals(request.getParameter("department"))){
						trainDep.add(approval.get(i));
					}
				}
				Map<String , List<UserAchievement>> subDeps = new HashMap<String, List<UserAchievement>>();
				for(int i=0;i<trainDep.size();i++){
					if(subDeps.containsKey(trainDep.get(i).getSubDepartment().getName())){
						List<UserAchievement> l = subDeps.get(trainDep.get(i).getSubDepartment().getName());
						l.add(trainDep.get(i));
						subDeps.put(trainDep.get(i).getSubDepartment().getName(),l);
						
						int n = achieveNum.get(trainDep.get(i).getSubDepartment().getName());
						achieveNum.put(trainDep.get(i).getSubDepartment().getName(),n+1);
						
					}else{
						List<UserAchievement> l = new ArrayList();
						l.add(trainDep.get(i));
						subDeps.put(trainDep.get(i).getSubDepartment().getName(), l);
						achieveNum.put(trainDep.get(i).getSubDepartment().getName(),1);
					}
				}
				Iterator iter = subDeps.entrySet().iterator();
				while(iter.hasNext()){
					Map.Entry entry = (Map.Entry)iter.next();
					String key = (String)entry.getKey();
					List<UserAchievement> val = (List<UserAchievement>)entry.getValue();
					

					List<UserAchievement> newl =new ArrayList();
					for(int i=0;i<val.size();i++){
						int place=-1;
						String achieveName = val.get(i).getName();
								
						for(int j=0;j<newl.size();j++){		
							if(achieveName.equals(newl.get(j).getName())){
								place=j;
								break;
							}
						}			
						if(place==-1){
							newl.add(val.get(i));
						}else{
							double sum = newl.get(place).getScore()+val.get(i).getScore();			
							newl.get(place).setScore(sum);	
						}
					}
					for(int i=0;i<newl.size();i++){
			 			
			 			if(newl.get(i).getScore()>newl.get(i).getMaxScore()){
			 				newl.get(i).setScore(newl.get(i).getMaxScore());
			 			}
					}
					
					entry.setValue(newl);	
				}
				Iterator iter2 = subDeps.entrySet().iterator();
				while(iter2.hasNext()){
					Map.Entry entry = (Map.Entry)iter2.next();
					String key = (String)entry.getKey();
					List<UserAchievement> val = (List<UserAchievement>)entry.getValue();
					UserAchievement ua = val.get(0);
					
					for(int i=1;i<val.size();i++){
						double temp = ua.getScore()+val.get(i).getScore();
						ua.setScore(temp);
					}
					
					result.add(ua);
				}
				Collections.sort(result, new IndivComparator());
				wb = new XSSFWorkbook();  
		        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet 
		        sheet = wb.createSheet("������������");  
		        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
		        row = sheet.createRow((int) 0);  
		        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
		        style = wb.createCellStyle(); 
		        cell = row.createCell((short) 0);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 1);  
		        cell.setCellValue("��������");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 2);  
		        cell.setCellValue("�ɹ�����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 3);  
		        cell.setCellValue("�ܷ�");  
		        cell.setCellStyle(style);  
		        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���  
					        
		        for (int i = 0; i < result.size(); i++) {  
		            row = sheet.createRow((int) i + 1);  
		            UserAchievement UA = (UserAchievement)result.get(i);  
		            // ���Ĳ���������Ԫ�񣬲�����ֵ  
		            row.createCell((short)0).setCellValue(i+1);  
		            row.createCell((short)1).setCellValue(UA.getSubDepartment().getName());  
		            row.createCell((short)2).setCellValue(achieveNum.get(UA.getSubDepartment().getName()));  
		            row.createCell((short)3).setCellValue(UA.getScore());  
		        }  
			break;
			case "departLookup":
				String department = request.getParameter("department");
				result = new ArrayList();
				for(int i=0;i<all.size();i++){
				if(all.get(i).getSubDepartment().getName().equals(department)&&all.get(i).getChecked()==2&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
					result.add(all.get(i));
					}
				}
				Collections.sort(result, new IndivComparator());
				wb = new XSSFWorkbook();  
		        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet 
		        sheet = wb.createSheet("�������ųɹ���ϸ");  
		        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
		        row = sheet.createRow((int) 0);  
		        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
		        style = wb.createCellStyle(); 
		        
		        cell = row.createCell((short) 0);  
		        cell.setCellValue("��������");  
		        cell.setCellStyle(style);  
		        
		        cell = row.createCell((short) 1);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 2);  
		        cell.setCellValue("�ɹ�����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 3);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 4);  
		        cell.setCellValue("�÷�");  
		        cell.setCellStyle(style);  
		        
		        cell = row.createCell((short) 5);  
		        cell.setCellValue("״̬");  
		        cell.setCellStyle(style); 
		        
		        cell = row.createCell((short) 6);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style); 
		        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���  
					        
		        for (int i = 0; i < result.size(); i++) {  
		            row = sheet.createRow((int) i + 1);  
		            UserAchievement UA = (UserAchievement)result.get(i);  
		            // ���Ĳ���������Ԫ�񣬲�����ֵ  
		            row.createCell((short)0).setCellValue(UA.getSubDepartment().getName());  
		            row.createCell((short)1).setCellValue(UA.getUsername());  
		            row.createCell((short)2).setCellValue(UA.getName());  
		            String cate;
		            switch(UA.getCategory()){
		            	case "thesis":
		            		cate = "����";
		            		break;
		            	case "eduProject":
		            		cate = "������Ŀ";
		            		break;
		            	case "textbook":
		            		cate = "�̲ġ�����";
		            		break;
		            	case "patent":
		            		cate = "ר��";
		            		break;
		            	case "laws":
		            		cate = "���ɡ�����";
		            		break;
		            		default:
		            			cate = "�̸���Ŀ";
		            			break;
		            }
		            row.createCell((short)3).setCellValue(cate);  
		            row.createCell((short)4).setCellValue(UA.getScore());  
		            row.createCell((short)5).setCellValue("��ͨ��"); 
		            row.createCell((short)6).setCellValue(UA.getAchievementDate().toString());
		        }  
			break;
			case "indivLookup":
				String chosenUser = request.getParameter("chosenUser");
				for(int i=0;i<all.size();i++){
					if(all.get(i).getUsername().equals(chosenUser)&&all.get(i).getChecked()==2&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
						result.add(all.get(i));
						}
					}
				Collections.sort(result, new IndivComparator());
				wb = new XSSFWorkbook();  
		        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet 
		        sheet = wb.createSheet("�������ųɹ���ϸ");  
		        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
		        row = sheet.createRow((int) 0);  
		        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
		        style = wb.createCellStyle(); 
		        cell = row.createCell((short) 0);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		        
		        cell = row.createCell((short) 1);  
		        cell.setCellValue("�ɹ�����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 2);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 3);  
		        cell.setCellValue("�÷�");  
		        cell.setCellStyle(style);  
		  
		        cell = row.createCell((short) 4);  
		        cell.setCellValue("״̬");  
		        cell.setCellStyle(style);  
		        
		        cell = row.createCell((short) 5);  
		        cell.setCellValue("����");  
		        cell.setCellStyle(style); 
		        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���  
					        
		        for (int i = 0; i < result.size(); i++) {  
		            row = sheet.createRow((int) i + 1);  
		            UserAchievement UA = (UserAchievement)result.get(i);  
		            // ���Ĳ���������Ԫ�񣬲�����ֵ  
		            row.createCell((short)0).setCellValue(UA.getUsername());  
		            row.createCell((short)1).setCellValue(UA.getName()); 
		            String cate;
		            switch(UA.getCategory()){
		            	case "thesis":
		            		cate = "����";
		            		break;
		            	case "eduProject":
		            		cate = "������Ŀ";
		            		break;
		            	case "textbook":
		            		cate = "�̲ġ�����";
		            		break;
		            	case "patent":
		            		cate = "ר��";
		            		break;
		            	case "laws":
		            		cate = "���ɡ�����";
		            		break;
		            		default:
		            			cate = "�̸���Ŀ";
		            			break;
		            }
		            row.createCell((short)2).setCellValue(cate);  
		            row.createCell((short)3).setCellValue(UA.getScore());  
		            row.createCell((short)4).setCellValue("��ͨ��"); 
		            row.createCell((short)5).setCellValue(UA.getAchievementDate().toString());
		            }
				break;
		}
		
        // �����������ļ��浽ָ��λ��  
        try {  
        	String p = AppConfigs.class.getResource("/").getPath();  
    		String myDir = p.substring(1,p.indexOf("classes")) ; 
    		
            FileSystemView fsv = FileSystemView.getFileSystemView();  
  
            Date currentTime = new Date();  
            SimpleDateFormat formatter = new SimpleDateFormat(  
                    "yyyy-MM-dd-HH-mm-ss");  
            String dateString = formatter.format(currentTime);  
  
            String deskPath = myDir+ "/rankExport/Ranking"  
                    + dateString + ".xlsx";              
            FileOutputStream fout = new FileOutputStream(new File(deskPath));  
            wb.write(fout);  
            fout.close();  
            
            response.setContentType(getServletContext().getMimeType(deskPath)); 
            response.setHeader("Content-Disposition", "attachment;filename="+"Ranking"  
                    + dateString + ".xlsx"); 
            //out.print("<script type='text/javascript'charset='utf-8'>alert('����')</script>");
            FileInputStream fin =  new FileInputStream(deskPath); 
            int b; 
		    while((b=fin.read())!= -1) 
		    { 
		      out.write(b);
		    }            
            fin.close();    
            
        }catch (Exception x) {  
            x.printStackTrace();  
        }finally{
        	 
        }  
		out.flush();
		out.close();
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
