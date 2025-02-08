package com.vaibhav.finalblood;

import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

public class CallHackathonAPIService {
    private static final String API_URL = "https://shreyankisiri-callshackathon.hf.space/predict";

    public String getPrediction(String text) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String requestBody = "{\"text\":\"" + text + "\"}";
            HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.exchange(API_URL, HttpMethod.POST, requestEntity, String.class);

            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error in prediction";
        }
    }
}
