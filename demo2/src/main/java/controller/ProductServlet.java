package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.Product;
import service.ICategoryService;
import service.IProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

@WebServlet(name = "ProductServlet", value = {"", "/products"})
public class ProductServlet extends HttpServlet {

    private final IProductService iProductService = new ProductServiceImpl();
    private final ICategoryService iCategoryService = new CategoryServiceImpl();
    private final String ROOT_PATH = "/view/products/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", iCategoryService.selectAllCategory());
        System.out.println(iCategoryService.selectAllCategory().size());
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "search":
//                searchUser(request, response);
                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("productList", iProductService.selectAllProduct());
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
//                updateCustomer(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Integer customerId = Integer.parseInt(id);
        Product product = iProductService.findById(customerId);
        try {
            if (product == null) {
                response.sendRedirect("view/error-404.jsp");
            } else {
                iProductService.deleteCustomer(customerId);
                response.sendRedirect("products");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        Integer id = null;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        String name = request.getParameter("name");
        Double price = null;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        Integer quantity = null;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        String color = request.getParameter("color");
        Integer categoryId = null;
        try {
            categoryId = Integer.parseInt(request.getParameter("category"));
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
        }
        Product product = new Product(id, name, price, quantity, color, categoryId);
        System.out.println(product);
        boolean isSuccess = iProductService.insertOne(product);

        try {
            response.sendRedirect("/products?sc=1");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
