package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "FilterLoginController", value = "/*")
public class FilterLoginController implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
//
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/login"; // http://localhost:8080/login
        String employeesURI = request.getContextPath() + "/employees"; // http://localhost:8080/login

        boolean loggedIn = session != null && session.getAttribute("name_session") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean employeesRequest = request.getRequestURI().equals(employeesURI);
        boolean adminAuthorization = session != null && session.getAttribute("role") != null && session.getAttribute("role").equals(1);
        if (loggedIn || loginRequest) {
            if (employeesRequest) {
                if (adminAuthorization) {
                    chain.doFilter(request, response);
                } else {
                    response.sendRedirect("view/error-404.jsp");
                }
            } else {
                chain.doFilter(request, response);
            }
        } else {
            response.sendRedirect(loginURI);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
