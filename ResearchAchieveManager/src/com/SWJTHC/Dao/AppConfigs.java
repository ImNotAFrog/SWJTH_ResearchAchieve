package com.SWJTHC.Dao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardWatchEventKinds;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppConfigs implements ServletContextListener{
	public static ArrayList<Double> SCORES = new ArrayList();
	public static void load(){
		FileInputStream inputStream;
		String p = AppConfigs.class.getResource("/").getPath();  
		try {
			inputStream = new FileInputStream(p.substring(1,p.indexOf("classes"))  +"/scores/Scores.xlsx");
			
		    //��ȡ������  
		    XSSFWorkbook workBook = new XSSFWorkbook(inputStream);  
		    //��ȡ������  
		    XSSFSheet sheet = workBook.getSheetAt(0);  
		    //��ȡ��  
		    for(int i =3;i<47;i++){
		    	XSSFRow row = sheet.getRow(i); 
		    	 //��ȡ��Ԫ��  
			    XSSFCell cell = row.getCell(5);  
			    double value = cell.getNumericCellValue();  
			    System.out.println(value);
			    SCORES.add(value);
		    }
            
		    inputStream.close();  
		    workBook.close();//���ǵùرչ�����  
		    Thread t = new Thread(new Runnable(){  
	    	    //2):��A���и���Runnable�ӿ��е�run����.  
	    		String p = AppConfigs.class.getResource("/").getPath();  
	    		Path myDir = Paths.get(p.substring(1,p.indexOf("classes"))+"/scores"); 
	    	    public void run() {  
	    	    	try {  
	    	            WatchService watcher = myDir.getFileSystem().newWatchService();  
	    	            myDir.register(watcher, StandardWatchEventKinds.ENTRY_CREATE,   
	    	            StandardWatchEventKinds.ENTRY_DELETE, StandardWatchEventKinds.ENTRY_MODIFY);  
	    	            WatchKey watckKey = watcher.take();  
	    	            List<WatchEvent<?>> events = watckKey.pollEvents();  
	    	            for (WatchEvent event : events) {  
	    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_CREATE) {  
	    	                	
	    	                     System.out.println("Created: " + event.context().toString());
	    	                     //wait(100);
	    	                     load(); 
	    	                 }  
	    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_DELETE) {  	    	                	 
	    	                     System.out.println("Delete: " + event.context().toString());  
	    	                     //wait(100);
	    	                     load();
	    	                 }  
	    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_MODIFY) {  
	    	                 	System.out.println("Modify: " + event.context().toString());  
	    	                 	//wait(100);
	    	                 	load();                    
	    	                 }  
	    	             }  
	    	         } catch (Exception e) {  
	    	             System.out.println("Error: " + e.toString()); 
	    	             load();
	    	         }  
	    	    }  
	    	});  
	        t.start();  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		     
        
	}
	
	public void startWatching(){
		Thread t = new Thread(new Runnable(){  
    	    //2):��A���и���Runnable�ӿ��е�run����.  
    		String p = AppConfigs.class.getResource("/").getPath();  
    		Path myDir = Paths.get(p.substring(1,p.indexOf("classes"))+"/scores"); 
    	    public void run() {  
    	    	try {  
    	            WatchService watcher = myDir.getFileSystem().newWatchService();  
    	            myDir.register(watcher, StandardWatchEventKinds.ENTRY_CREATE,   
    	            StandardWatchEventKinds.ENTRY_DELETE, StandardWatchEventKinds.ENTRY_MODIFY);  
    	            WatchKey watckKey = watcher.take();  
    	            List<WatchEvent<?>> events = watckKey.pollEvents();  
    	            for (WatchEvent event : events) {  
    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_CREATE) {  
    	                     System.out.println("Created: " + event.context().toString());  
    	                     load();
    	                 }  
    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_DELETE) {  
    	                     System.out.println("Delete: " + event.context().toString());  
    	                     load();
    	                 }  
    	                 if (event.kind() == StandardWatchEventKinds.ENTRY_MODIFY) {  
    	                 	System.out.println("Modify: " + event.context().toString());  
    	                 	load();                    
    	                 }  
    	             }  
    	         } catch (Exception e) {  
    	             System.out.println("Error: " + e.toString());  
    	         }  
    	    }  
    	});  
        t.start();  
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		load();
	}
	
	
	 
}
