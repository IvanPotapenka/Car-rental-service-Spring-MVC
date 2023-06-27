package by.potapenko.service.config;

import by.potapenko.database.config.DataBaseConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan("by.potapenko.service")
@Import(DataBaseConfig.class)
public class ServiceConfig {
}
