package by.potapenko.web.util;

import jakarta.servlet.http.HttpServletRequest;
import lombok.experimental.UtilityClass;

@UtilityClass
public class UtilitySiteUrl {
        public String getSiteURL(HttpServletRequest request) {
            String siteURL = request.getRequestURL().toString();
            return siteURL.replace(request.getServletPath(), "");
        }
    }

