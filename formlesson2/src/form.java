
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form")
public class form extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public form() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");

		String errorMsg = "";
		String msg = null ;
		int result = 0;

		if(num1 == null || num1.length() == 0){
			errorMsg += "数値aが入力されていません<br>";
		}
		if(num2 == null || num2.length() == 0) {
			errorMsg += "数値bが入力されていません<br>";
		}

		if(errorMsg.length()!=0) {
			msg = errorMsg;
		}else {
			result=Integer.parseInt(num1)+Integer.parseInt(num2);
			msg = num1 + "+" + num2 + "=" + result ;
		}

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>結果</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>" + msg + "</p>");
		out.println("</body>");
		out.println("</htmll>");
	}
}

