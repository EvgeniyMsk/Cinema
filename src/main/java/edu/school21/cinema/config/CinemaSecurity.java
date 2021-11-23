package edu.school21.cinema.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;


@Configuration
@EnableWebSecurity
public class CinemaSecurity extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) {
        http.addFilterBefore(new CinemaEncodingFilter(), ChannelProcessingFilter.class);
    }
}
