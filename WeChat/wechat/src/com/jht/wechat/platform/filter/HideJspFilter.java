package com.jht.wechat.platform.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 隐藏对jsp文件的访问
 * @author jianghongtao
 * @date 2018-10-28
 */
public class HideJspFilter implements Filter {

    private String errorPage = "/404.jsp";

    private String homePage = "/index.jsp";

    public void init(FilterConfig config) throws ServletException {
        String ep = config.getInitParameter("errorPage");
        if (ep != null && ep.trim().length() > 0) {
            this.errorPage = ep;
        }
        String hp = config.getInitParameter("homePage");
        if (hp != null && hp.trim().length() > 0) {
            this.homePage = hp;
        }
    }

    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
        ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        if (this.homePage.equals(httpRequest.getServletPath())) {
            chain.doFilter(request, response);
            return;
        } else {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.setStatus(404);
            request.getRequestDispatcher(this.errorPage).forward(request, response);
        }
    }
}
