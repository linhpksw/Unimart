package tech.unimart.unimart.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebFilter(filterName = "AuthenFilter", urlPatterns = {"/*"})

public class AuthenFilter implements Filter {
    private static final boolean debug = true;
    private final UserService userService = new UserService();
    private FilterConfig filterConfig = null;

    public AuthenFilter() {
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // Check if this URL should be excluded from authentication check
        if (!requiresAuthentication(requestURI)) {
            chain.doFilter(request, response);
            return;
        }

        User user = userService.checkAndAuthenticateUser(httpRequest, httpResponse);
        if (user == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        List<String> requiredRoles = getRequiredRolesForURI(requestURI);
        if (!userHasRole(user, requiredRoles)) {
            httpRequest.getRequestDispatcher("/components/403.jsp").forward(request, response);

            return;
        }
        chain.doFilter(request, response);
    }

    private boolean userHasRole(User user, List<String> requiredRoles) {
        return requiredRoles.contains(user.getRole());
    }

    private List<String> getRequiredRolesForURI(String requestURI) {
        Map<String, List<String>> roleAccessMap = new HashMap<>();

        // Admin-only URLs
        roleAccessMap.put("/admin/account", List.of("admin"));
        roleAccessMap.put("/admin/delete/", List.of("admin")); // Assuming pattern matching for wildcard "*"

        // Seller-only URLs
        roleAccessMap.put("/seller/add", List.of("seller"));
        roleAccessMap.put("/seller/delete/", List.of("seller")); // Assuming pattern matching for wildcard "*"
        roleAccessMap.put("/seller/edit/", List.of("seller")); // Assuming pattern matching for wildcard "*"
        roleAccessMap.put("/seller/revenue", List.of("seller"));
        roleAccessMap.put("/seller/stock", List.of("seller"));

        // URLs accessible by all logged-in users
        List<String> allUserRoles = List.of("admin", "seller", "customer");
        roleAccessMap.put("/user/profile", allUserRoles);
        roleAccessMap.put("/cart", allUserRoles);
        roleAccessMap.put("/user/history", allUserRoles);
        // Assuming pattern matching for wildcard "*"
        roleAccessMap.put("/order/", allUserRoles);

        // Pattern matching logic for dynamic URL parts (like wildcards "*")
        for (Map.Entry<String, List<String>> entry : roleAccessMap.entrySet()) {
            if (requestURI.startsWith(entry.getKey())) {
                return entry.getValue();
            }
        }

        // Default to no roles required (public access)
        return List.of();
    }

    private boolean requiresAuthentication(String requestURI) {
        if (requestURI.equals("/") || requestURI.isEmpty()) {
            return false;
        }

        // No authentication required for these URLs
        return !(requestURI.startsWith("/product")
                || requestURI.startsWith("/home")
                || requestURI.startsWith("/categories")
                || requestURI.startsWith("/login")
                || requestURI.startsWith("/signup")
                || requestURI.startsWith("/static")
                || requestURI.startsWith("/components")
                || requestURI.startsWith("/reset")
                || requestURI.startsWith("/forgot")
                || requestURI.startsWith("/logout"));
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenFilter()");
        }
        String sb = "AuthenFilter(" + filterConfig +
                ")";
        return (sb);
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
