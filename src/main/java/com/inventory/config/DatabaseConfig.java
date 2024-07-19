/*
 * package com.inventory.config;
 * 
 * import org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.jdbc.core.JdbcTemplate; import
 * org.springframework.jdbc.datasource.DriverManagerDataSource;
 * 
 * @Configuration public class DatabaseConfig {
 * 
 * @Bean public JdbcTemplate jdbcTemplate() { return new
 * JdbcTemplate(dataSource()); }
 * 
 * @Bean public DriverManagerDataSource dataSource() { DriverManagerDataSource
 * dataSource = new DriverManagerDataSource();
 * dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
 * dataSource.setUrl("jdbc:oracle:thin:@192.168.0.64:1521:xe"); // Update with
 * your database URL dataSource.setUsername("team2project"); // Update with your
 * database username dataSource.setPassword("team2project"); // Update with your
 * database password return dataSource; } }
 */