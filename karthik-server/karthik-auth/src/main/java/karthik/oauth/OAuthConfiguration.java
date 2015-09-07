package karthik.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.approval.ApprovalStore;
import org.springframework.security.oauth2.provider.approval.JdbcApprovalStore;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

import javax.sql.DataSource;


@Configuration
@EnableAuthorizationServer
@Lazy
public class OAuthConfiguration extends AuthorizationServerConfigurerAdapter {
	@Autowired
	private AuthenticationManager authenticationManager;

	@Bean
	@ConfigurationProperties(prefix = "spring.datasource_oauth")
	public DataSource oauthDataSource() {
		return DataSourceBuilder.create().build();
	}

	/**
	 * We expose the JdbcClientDetailsService because it has extra methods that
	 * the Interface does not have. E.g.
	 * {@link org.springframework.security.oauth2.provider.client.JdbcClientDetailsService#listClientDetails()}
	 * which we need for the admin page.
	 */
	@Bean
	public JdbcClientDetailsService clientDetailsService() {
		return new JdbcClientDetailsService(oauthDataSource());
	}

	@Bean
	
	public TokenStore tokenStore() {
		return new JdbcTokenStore(oauthDataSource());
	}

	@Bean
	public ApprovalStore approvalStore() {
		return new JdbcApprovalStore(oauthDataSource());
	}

	@Bean
	public AuthorizationCodeServices authorizationCodeServices() {

		return new JdbcAuthorizationCodeServices(oauthDataSource());
	}

	@Override
	public void configure(ClientDetailsServiceConfigurer clients)
			throws Exception {
		clients.withClientDetails(clientDetailsService());
	}

	@Override
	public void configure(AuthorizationServerSecurityConfigurer oauthServer)
			throws Exception {

	}

	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints)
			throws Exception {
		endpoints.approvalStore(approvalStore())
				.authorizationCodeServices(authorizationCodeServices())
				.tokenStore(tokenStore())
				.authenticationManager(authenticationManager);
	}
	/* @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	        auth
	            .inMemoryAuthentication()
	                .withUser("user").password("password").roles("USER");
	    }*/

}
