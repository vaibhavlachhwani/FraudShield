package com.vaibhav.finalblood;

import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;
import java.io.File;
import java.nio.file.Files;
import java.util.Collections;

public class WhisperTranscriptionService {
    private static final String API_URL = "https://api-inference.huggingface.co/models/openai/whisper-large-v3-turbo";
    private static final String API_KEY = ""; // Replace with your actual key

    public String transcribe(String filePath) {
        try {
            File audioFile = new File(filePath);
            byte[] fileBytes = Files.readAllBytes(audioFile.toPath());

            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + API_KEY);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

            HttpEntity<byte[]> requestEntity = new HttpEntity<>(fileBytes, headers);
            RestTemplate restTemplate = new RestTemplate();

            ResponseEntity<String> response = restTemplate.exchange(API_URL, HttpMethod.POST, requestEntity, String.class);
            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error in transcription";
        }
    }
}
