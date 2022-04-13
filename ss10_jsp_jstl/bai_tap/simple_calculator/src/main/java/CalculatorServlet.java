import java.io.InvalidObjectException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error_message = null;
        String NUMBER_FORMAT_EXP_MESSAGE = "Vui lòng nhập số. Xin Cảm ơn!!!";
        String ARITHMETIC_EXP_MESSAGE = "Phép chia cho 0!!!";
        String INVALID_OPERATOR_EXP_MESSAGE = "Phép tính không hợp lệ!!!";
        Double result = null;
        try {
            Double num1 = Double.parseDouble(request.getParameter("number1"));
            String operator = request.getParameter("operator");
            Double num2 = Double.parseDouble(request.getParameter("number2"));
            switch (operator) {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if (num2 == 0) {
                        throw new ArithmeticException();
                    }
                    result = num1 / num2;
                    break;
                default:
                    throw new InvalidObjectException("");
            }
        } catch (NumberFormatException e) {
            error_message = NUMBER_FORMAT_EXP_MESSAGE;
        } catch (ArithmeticException e) {
            error_message = ARITHMETIC_EXP_MESSAGE;
        } catch (InvalidObjectException e) {
            error_message = INVALID_OPERATOR_EXP_MESSAGE;
        }

        request.setAttribute("error_msg", error_message);
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);

    }
}
