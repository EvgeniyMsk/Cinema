package edu.school21.cinema.config;

import edu.school21.cinema.filters.CinemaAuthFilter;
import edu.school21.cinema.filters.CinemaEncodingFilter;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


@Configuration
@EnableWebSecurity
public class CinemaSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                        .authorizeRequests()
                .antMatchers("/**").permitAll()
                .anyRequest().authenticated()
                        .and().logout().disable()
                        .formLogin().disable();
        http.addFilterBefore(new CinemaEncodingFilter(), ChannelProcessingFilter.class);
        http.addFilterBefore(new CinemaAuthFilter(), UsernamePasswordAuthenticationFilter.class);
    }
}
