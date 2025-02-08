package com.vaibhav.finalblood;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class FinalBloodApplication {

    public static void main(String[] args) {
        SpringApplication.run(FinalBloodApplication.class, args);
    }

}
