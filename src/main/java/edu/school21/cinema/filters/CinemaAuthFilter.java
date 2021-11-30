package edu.school21.cinema.filters;

import edu.school21.cinema.models.CinemaUser;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({"/admin/*", "/auth/*", "/sessions/*"})
public class CinemaAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        HttpServletResponse response = ((HttpServletResponse) servletResponse);
        String requestURI = ((HttpServletRequest) servletRequest).getRequestURI();
        CinemaUser cinemaUser = (CinemaUser) session.getAttribute("user");
        if (cinemaUser == null && requestURI.contains("/auth") && !requestURI.contains("/login"));
        else if (cinemaUser != null && requestURI.contains("/auth") && !requestURI.contains("/profile") &&
        !requestURI.contains("/logout"))
            response.sendRedirect("/auth/profile");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
