package Util;

import javax.servlet.*;
import java.io.IOException;

public class UTF8EncodingFilter implements Filter {
    private String encoding = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("filter init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        this.encoding = "UTF-8";
        if (this.encoding != null) {
            request.setCharacterEncoding(this.encoding);
            response.setCharacterEncoding(this.encoding);
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("destory filter");
    }
}
