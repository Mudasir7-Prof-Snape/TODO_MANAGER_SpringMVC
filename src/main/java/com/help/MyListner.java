package com.help;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.entities.Todo;
public class MyListner implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		//this works till the server is on then automatically desroys
		System.out.println("Context created...");
		ArrayList<Todo> a=new ArrayList<Todo>();
		ServletContext cont=sce.getServletContext();
		cont.setAttribute("list", a);
		}
	
}
