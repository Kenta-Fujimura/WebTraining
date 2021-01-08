package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Beans;

@WebServlet("/main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/view/main.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application =this.getServletContext();
		List<Beans> list=(List<Beans>)application.getAttribute("list");
		if(list == null){
			list=new ArrayList<>();
		}
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String total =request.getParameter("total");
		if(name.isEmpty() || price.isEmpty()){
			request.setAttribute("err","未記入の項目があります！");
		}else{

			for(int i = 0; i < list.size(); i++)
			    total = total + list.get(i);


			Beans beans=new Beans(name,price);
			list.add(0,beans);
			application.setAttribute("list", list);
			request.setAttribute("msg","1件登録しました。");
			request.setAttribute("total",total);
		}
		doGet(request,response);
	}
}


