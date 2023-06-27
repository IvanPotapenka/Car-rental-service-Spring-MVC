package by.potapenko.web.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import static by.potapenko.web.util.PagesUtil.PREFIX;
import static by.potapenko.web.util.PagesUtil.SUFFIX;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "by.potapenko.web")
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp(PREFIX, SUFFIX);
    }
}
