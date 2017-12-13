package com.SWJTHC.services;

import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class FileUploadServlet extends HttpServlet {
        
    /**
        * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
        * 
        */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String projectPath =request.getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");			
        String username = request.getSession().getAttribute("username").toString();
        if(request.getParameter("getlist") != null && !request.getParameter("getlist").isEmpty()){
            String[] lists = request.getParameter("getlist").split(";");            
        	File file = new File(request.getServletContext().getRealPath("/")+"META-INF\\Attachments\\"+username+"\\"+lists[0]);
            response.setContentType("application/json");
            PrintWriter writer = response.getWriter();
            JSONArray json = new JSONArray();
            JSONObject jsono = new JSONObject();
            try {
				jsono.put("name", lists[0]);
	            jsono.put("size", file.length());
	            jsono.put("url", projectPath+"/services/FileUploadServlet?getfile=" + lists[0]);
	            jsono.put("thumbnail_url", projectPath+"/services/FileUploadServlet?getthumb=" + lists[0]);
	            jsono.put("delete_url", projectPath+"/services/FileUploadServlet?delfile=" + lists[0]);
	            jsono.put("delete_type", "GET");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            json.put(jsono);
            writer.write(json.toString());
        }else if(request.getParameter("getfile") != null && !request.getParameter("getfile").isEmpty()) {       	
        	//这是文件保存的路径
            File file = new File(request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/"+request.getParameter("getfile"));
            if (file.exists()) {
                int bytes = 0;
                ServletOutputStream op = response.getOutputStream();

                response.setContentType(getMimeType(file));
                response.setContentLength((int) file.length());
                response.setHeader( "Content-Disposition", "inline; filename=\"" + new String(file.getName().getBytes(), "ISO-8859-1") + "\"" );

                byte[] bbuf = new byte[1024];
                DataInputStream in = new DataInputStream(new FileInputStream(file));

                while ((in != null) && ((bytes = in.read(bbuf)) != -1)) {
                    op.write(bbuf, 0, bytes);
                }

                in.close();
                op.flush();
                op.close();
            }
        } else if (request.getParameter("delfile") != null && !request.getParameter("delfile").isEmpty()) {
            File file = new File(request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/"+ request.getParameter("delfile"));
            if (file.exists()) {
                file.delete(); // TODO:check and report success
            } 
        } else if (request.getParameter("getthumb") != null && !request.getParameter("getthumb").isEmpty()) {
            System.out.println(request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/"+request.getParameter("getthumb"));
            File file = new File(request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/"+request.getParameter("getthumb"));
                if (file.exists()) {
                    System.out.println(file.getAbsolutePath());
                    String mimetype = getMimeType(file);
                    
                    /*显示图片的缩略图*/
                    if (mimetype.endsWith("png") || mimetype.endsWith("jpeg")|| mimetype.endsWith("jpg") || mimetype.endsWith("gif")) {
                        BufferedImage im = ImageIO.read(file);
                        if (im != null) {
                            BufferedImage thumb = Scalr.resize(im, 75); 
                            ByteArrayOutputStream os = new ByteArrayOutputStream();
                            if (mimetype.endsWith("png")) {
                                ImageIO.write(thumb, "PNG" , os);
                                response.setContentType("image/png");
                            } else if (mimetype.endsWith("jpeg")) {
                                ImageIO.write(thumb, "jpg" , os);
                                response.setContentType("image/jpeg");
                            } else if (mimetype.endsWith("jpg")) {
                                ImageIO.write(thumb, "jpg" , os);
                                response.setContentType("image/jpeg");
                            } else {
                                ImageIO.write(thumb, "GIF" , os);
                                response.setContentType("image/gif");
                            }
                            ServletOutputStream srvos = response.getOutputStream();
                            response.setContentLength(os.size());
                            response.setHeader( "Content-Disposition", "inline; filename=\"" + new String(file.getName().getBytes(), "ISO-8859-1") + "\"" );
                            os.writeTo(srvos);
                            srvos.flush();
                            srvos.close();
                            os.close();
                        }
                    }else {
                    	String fileName=file.getName();
                        String prefix=fileName.substring(fileName.lastIndexOf(".")+1);//1.  获取文件后缀名
                        BufferedImage im=null; 
                        File shortcut=null;
                    	switch(prefix.toLowerCase()){
                    	case "ppt":
                    	case "pptx":
                    		shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/ppt.jpg");
                    		im=ImageIO.read(shortcut);
                    		break;
                    	case "doc":
                    	case "docx":
                    		shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/word.jpg");
                    		im=ImageIO.read(shortcut);
                    		break;
                    	case "xls":
                    	case "xlsx":
                    		shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/excel.jpg");
                    		im=ImageIO.read(shortcut);
                    		break;
                    	case "rar":
                    	case "7z":
                    	case "zip":
                    		shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/rar.jpg");
                    		im=ImageIO.read(shortcut);
                    		break;
                    	case "pdf":
                    		shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/pdf.jpg");
                    		im=ImageIO.read(shortcut);
                    		break;
                    		default:
                    			shortcut = new File(request.getServletContext().getRealPath("/")+"assets/img/file.jpg");
                    			im=ImageIO.read(shortcut);
                    			break;
                    			//2.  获取缩略图的图片(这个得自己先准备好， 75像素宽的)
                    	}
                    	if (im != null) {
                            BufferedImage thumb = Scalr.resize(im, 75); 
                            ByteArrayOutputStream os = new ByteArrayOutputStream();
                            ImageIO.write(thumb, "jpg" , os);
                            response.setContentType("image/jpeg");
                            ServletOutputStream srvos = response.getOutputStream();
                            response.setContentLength(os.size());
                            
                            response.setHeader( "Content-Disposition", "inline; filename=\"" + new String(file.getName().getBytes(), "ISO-8859-1") + "\"" );
                            os.writeTo(srvos);
                            srvos.flush();
                            srvos.close();
                            os.close();
                        }
                    	//3. 用ImageIO像上面一样写回去，设置 response
                    	
                    }
                    /*其它类型的文件的缩略图， 例如word， excel， ppt ，pdf*/
            } // TODO: check and report success
        } else {
            PrintWriter writer = response.getWriter();
            writer.write("call POST with multipart form data");
        }
    }
    
    /**
        * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
        * 
        */
    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String projectPath =request.getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");		
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }
       
        String username = request.getSession().getAttribute("username").toString();
        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        PrintWriter writer = response.getWriter();
        response.setContentType("application/json");
        JSONArray json = new JSONArray();
        try {
            List<FileItem> items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()&&!item.getName().equals("")) {
                		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyyMMddHHmmss");  	                   
                		String fileName =  sdf3.format(new Date())+item.getName();
	                	String dirPath = request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/";
	                    String filePath = request.getServletContext().getRealPath("/")+"META-INF/Attachments/"+username+"/"+fileName;
                        File dir = new File(dirPath);
                        if (!dir.exists()) {
                        	dir.mkdirs();
                        }
                        File file = new File(filePath);
                        if (!file.exists()) {
                            try {
                            	file.createNewFile();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        try {
							item.write(file);
						} catch (Exception e) {
							// TODO Auto-generated catch block
						}
                        JSONObject jsono = new JSONObject();
                        jsono.put("name", item.getName());
                        jsono.put("size", item.getSize());
                        jsono.put("url", projectPath+"/services/FileUploadServlet?getfile=" + fileName);
                        jsono.put("thumbnail_url", projectPath+"/services/FileUploadServlet?getthumb=" + fileName);
                        jsono.put("delete_url", projectPath+"/services/FileUploadServlet?delfile=" + fileName);
                        jsono.put("delete_type", "GET");
                        json.put(jsono);
                        System.out.println(json.toString());
                }
            }
        } catch (FileUploadException e) {
                throw new RuntimeException(e);
        } catch (Exception e) {
                throw new RuntimeException(e);
        } finally {
            writer.write(json.toString());
            writer.close();
        }

    }

    private String getMimeType(File file) {
        String mimetype = "";
        if (file.exists()) {
            if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
                mimetype = "image/png";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("jpg")){
                mimetype = "image/jpg";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("jpeg")){
                mimetype = "image/jpeg";
            }else if(getSuffix(file.getName()).equalsIgnoreCase("gif")){
                mimetype = "image/gif";
            }else {
                javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
                mimetype  = mtMap.getContentType(file);
            }
        }
        return mimetype;
    }



    private String getSuffix(String filename) {
        String suffix = "";
        int pos = filename.lastIndexOf('.');
        if (pos > 0 && pos < filename.length() - 1) {
            suffix = filename.substring(pos + 1);
        }
        return suffix;
    }
}