package com.lanyuan.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;


@WebFilter("/*")
public class PrefixFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext application = filterConfig.getServletContext();
        application.setAttribute("base",application.getContextPath());
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest, servletResponse);
    }
}


