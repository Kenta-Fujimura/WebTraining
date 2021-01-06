package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/forwordsampleservlet")
public class forwordsampleservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fortune = "大吉";
		request.setAttribute("ft",fortune);
		String wether = "はれ";
		request.setAttribute("wt",wether);
		int num = 85;
		request.setAttribute("num",num);

		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/forwardSample.jsp");
		rd.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
