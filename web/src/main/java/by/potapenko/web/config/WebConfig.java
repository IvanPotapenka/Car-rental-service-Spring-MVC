package by.potapenko.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Properties;

import static by.potapenko.web.util.PagesUtil.PREFIX;
import static by.potapenko.web.util.PagesUtil.SUFFIX;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "by.potapenko.web")
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("puivan617@gmail.com");
        mailSender.setPassword("pqfeeiceyfvibfap");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp(PREFIX, SUFFIX);
    }
}
