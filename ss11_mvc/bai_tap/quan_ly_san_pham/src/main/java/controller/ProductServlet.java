package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import service.IProductService;
import service.impl.ProductServiceImp;

@WebServlet(name = "ProductServlet", value = {"/product","/"})
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductServiceImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
