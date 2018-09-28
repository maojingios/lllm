    package com.lllm.hotinfo.admin.web.interceptors;

    import com.lllm.hotinfo.admin.util.SystemConstants;
    import com.lllm.hotinfo.domain.entity.HiUser;
    import org.springframework.web.servlet.HandlerInterceptor;
    import org.springframework.web.servlet.ModelAndView;

    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;

    public class LoginInterceptor implements HandlerInterceptor {
        public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
            HiUser admin = (HiUser) httpServletRequest.getSession().getAttribute(SystemConstants.SESSION_ADMIN);
            if (admin == null) {
                httpServletResponse.sendRedirect("/login");
                return false;
            }
            return true;
        }
        public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        }
        public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        }
    }
