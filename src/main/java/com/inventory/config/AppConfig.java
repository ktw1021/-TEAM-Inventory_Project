/*
 * package com.inventory.config;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.jdbc.core.JdbcTemplate; import
 * org.springframework.web.servlet.config.annotation.EnableWebMvc; import
 * org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
 * import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 * import org.springframework.web.servlet.view.InternalResourceViewResolver;
 * import org.springframework.web.servlet.view.JstlView;
 * 
 * @Configuration
 * 
 * @EnableWebMvc public class AppConfig implements WebMvcConfigurer {
 * 
 * @Autowired private DatabaseConfig databaseConfig; // Inject DatabaseConfig to
 * use dataSource and jdbcTemplate beans
 * 
 * // Define ViewResolver bean for JSP views
 * 
 * public InternalResourceViewResolver viewResolver() {
 * InternalResourceViewResolver resolver = new InternalResourceViewResolver();
 * resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
 * resolver.setSuffix(".jsp"); return resolver; }
 * 
 * // Configure static resources (e.g., CSS, JS)
 * 
 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
 * registry.addResourceHandler("/resources/**").addResourceLocations(
 * "/resources/"); }
 * 
 * // Expose JdbcTemplate bean for use in DAOs or services
 * 
 * public JdbcTemplate jdbcTemplate() { return databaseConfig.jdbcTemplate(); }
 * }
 */