package controller;

import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.Product;
import service.IProductService;
import service.impl.ProductServiceImp;

@WebServlet(name = "ProductServlet", value = {"/products", "/"})
public class ProductServlet extends HttpServlet {

    private final IProductService<Product> iProductService = new ProductServiceImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;
            case "search":
                System.out.println("search");
                searchProduct(request, response);
            default:
                listProducts(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        List<Product> result = iProductService.search(keyword);
        System.out.println(result.size());
        request.setAttribute("products", result );
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("products/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.iProductService.remove(id);
            try {
                response.sendRedirect("/products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = null;
        try {
            price = Double.valueOf(request.getParameter("price"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String describe = request.getParameter("describe");
        String manufacture = request.getParameter("manufacture");
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(describe);
            product.setManufactor(manufacture);
            Map<String, String> error = this.iProductService.update(id, product);
            if (error.isEmpty()) {
                request.setAttribute("product", product);
                request.setAttribute("message", "Customer information was updated");
            } else {
                request.setAttribute("error", error);
                request.setAttribute("product", product);
            }
        }
        dispatcher = request.getRequestDispatcher("products/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("products/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.iProductService.getListProduct();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double price = null;
        try {
            price = Double.valueOf(request.getParameter("price"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String describe = request.getParameter("describe");
        String manufacture = request.getParameter("manufacture");
        int id = (int) (Math.random() * 10000);

        System.out.println(price);
        Product product = new Product(id, name, price, describe, manufacture);
        Map<String, String> errorMap = this.iProductService.save(product);
        if (errorMap.isEmpty()) {
            try {
                response.sendRedirect("/products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error", errorMap);
            request.setAttribute("name", name);
            request.setAttribute("price", price);
            request.setAttribute("describe", describe);
            request.setAttribute("manufacture", manufacture);
            try {
                request.getRequestDispatcher("products/create.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }

        }

    }


}
