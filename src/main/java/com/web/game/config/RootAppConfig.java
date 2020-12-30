package com.web.game.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setUser("scott");
		ds.setPassword("tiger");
		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=GameSpringMVCDB");
		ds.setInitialPoolSize(5);
		ds.setMaxPoolSize(10);
		return ds;
	}
//	@Bean
//	public DataSource dataSource() {
//		ComboPooledDataSource ds = new ComboPooledDataSource();
//		try {
//			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		} catch (PropertyVetoException e) {
//			e.printStackTrace();
//		}
//		ds.setUser("sa");
//		ds.setPassword("sa123456");
//		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=GameDB");
//		ds.setInitialPoolSize(5);
//		ds.setMaxPoolSize(10);
//		return ds;
//	}
	
	private Properties getHibernateProperties() {//組態資訊-進階資訊
		Properties p0 = new Properties();
		p0.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		p0.put("hibernate.hbm2ddl.auto","update" );
		p0.put("hibernate.show_sql", Boolean.TRUE);
		p0.put("hibernate.format_sql", Boolean.TRUE);
		p0.put("hibernate.transaction.coordinator_class","jdbc" );
		p0.put("hibernate.bytecode.use_reflection_optimizer", Boolean.FALSE);
		p0.put("hibernate.connection_pool_size","8" );
		
		return p0;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());//連線資訊
		factory.setPackagesToScan(new String[]{"com.web.game.contest.model",
											   "com.web.game.forum.model",
											   "com.web.game.exchange.model",
											   "com.web.game.withplay.model",
											   "com.web.game.mall.model",
											   "com.web.game.member.model"});//映射資訊 @Entity  把自己Entity的package加在這
		
		factory.setHibernateProperties(getHibernateProperties());
		return factory;
	}
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory factory) {
		HibernateTransactionManager tx = new HibernateTransactionManager();
		tx.setSessionFactory(factory);
		return tx;
	}
	
	
}
