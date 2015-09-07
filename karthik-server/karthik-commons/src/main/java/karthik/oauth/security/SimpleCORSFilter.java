package karthik.oauth.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;


@Component
public class SimpleCORSFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) resp;

	    response.addHeader("Access-Control-Allow-Origin", "*");
	   // response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	    if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
	        response.setHeader("Access-Control-Allow-Methods", "POST,GET,DELETE");
	        response.setHeader("Access-Control-Max-Age", "3600");
	        response.setHeader("Access-Control-Allow-Headers", "content-type,access-control-request-headers,access-control-request-method,accept,origin,authorization,x-requested-with");
	        response.setStatus(HttpServletResponse.SC_OK);
	    } else {
	        chain.doFilter(req, resp);
	    }
	}

	public void init(FilterConfig filterConfig) {}

	public void destroy() {}

}
