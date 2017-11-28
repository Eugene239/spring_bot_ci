package ru.epavlov.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@ImportResource("classpath:security.xml")
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
//                .formLogin()
//                .loginPage("/login")
//                .usernameParameter("username")
//                .passwordParameter("password")
//                .loginProcessingUrl("/j_spring_security_check")
//                .failureUrl("/login?error=true")
//                .and()
//                .rememberMe().tokenValiditySeconds(Integer.MAX_VALUE)

//                .and()
//                .logout().logoutUrl("/logout").logoutSuccessUrl("/")

  //              .and()
                .antMatcher("/admin**/**")
                .authorizeRequests()
                .antMatchers("/**").hasRole("ADMIN")

                .and()
                .authorizeRequests()
                .antMatchers("/j_spring_security_check").permitAll()
                .and().httpBasic()
                .and().csrf().disable();

        // .exceptionHandling().accessDeniedPage("/forbidden");
    }
}