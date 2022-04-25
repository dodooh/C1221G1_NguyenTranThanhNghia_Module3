import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String search = request.getParameter("txtSearch");

        PrintWriter writer = response.getWriter();
//        writer.println("<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>");
//        writer.println("<html>");
////        writer.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>");
//        writer.println("<meta http-equiv=\"Content-Type\" content=\"text/html\"; charset=\"utf-8\"/>");
        String result = dictionary.get(search);
        request.setAttribute("word", search);
        if (result != null) {
            request.setAttribute("result", result);
        } else {
            request.setAttribute("result", "Not found");
        }
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");

        String search = request.getParameter("txtSearch");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>");
        String result = dictionary.get(search);
        if (result != null) {
            writer.println("Word: " + search);
            writer.println("Result: " + result);
        } else {
            writer.println("Not found");
        }

        writer.println("</html>");
    }
}
