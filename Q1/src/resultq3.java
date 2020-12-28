
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resultq3")
public class resultq3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public resultq3() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String ans = request.getParameter("ans");
		String errorMsg = "";
		String msg = null;
		if(ans == null || ans.length() == 0){
			errorMsg += "入力されていません<br>";
		}else {
			if(ans.equals("0")) {
				msg = "正解";
			}else if(ans.equals("1")){
				msg = "残念";
			}
		}
		if(errorMsg.length()!=0) {
			msg = errorMsg;
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