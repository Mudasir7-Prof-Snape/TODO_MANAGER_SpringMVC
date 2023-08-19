package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entities.Todo;
@Controller
public class Homectrl {
	
	@Autowired
	ServletContext cont;

	@RequestMapping("/home")
	public String home(Model m) {
		m.addAttribute("page","home");
		return "home";
	}
	@RequestMapping("/add")
	public String add(Model m) {
		Todo t=new Todo();
		m.addAttribute("page","add");
		m.addAttribute("todo",t);
		return "home";
	}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model m) {
		String title=t.getTitle();
		String desc=t.getContent();
		if(title.equals("")||desc.equals("")) {
			m.addAttribute("msg","Enter Valid ToDo....");
			return "home";
		}
		t.setDate(new Date()); 
		System.out.println(t);
		//getting the list form context that is created while starting server..
		List<Todo> l=(List<Todo>) cont.getAttribute("list");
		l.add(t);
		m.addAttribute("msg","Successfully added...");
		return "home";
	}
	@RequestMapping("/view")
	public String view(Model m) {
		List<Todo> l=(List<Todo>) cont.getAttribute("list");
		m.addAttribute("page","view");
		m.addAttribute("todos",l);
		return "home";
	}
	@RequestMapping(path="/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest r,Model m) {
		List<Todo> l=(List<Todo>) cont.getAttribute("list");
		String s=r.getParameter("title");
		boolean b=false;
		for(Todo t:l) {
			if(t.getTitle().equals(s)) {
				l.remove(t);
				b=true;
				break;
			}
		}
		if(b) {
			m.addAttribute("sdmsg","Deleted Successfully...");
		}
		else {
			m.addAttribute("fdmsg","Title not found...");
		}
		return "home";
	}
	@RequestMapping("/smt")
	public String smt(Model m) {
		m.addAttribute("page","delete");
		return "home";
	}
}
