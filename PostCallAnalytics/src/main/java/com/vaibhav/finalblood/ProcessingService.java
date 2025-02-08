//package com.vaibhav.finalblood;
//
//import org.springframework.stereotype.Service;
//import java.io.File;
//
//@Service
//public class ProcessingService {
//
//    private final WhisperService whisperService;
//    private final CallClassificationService classificationService;
//
//    public ProcessingService(WhisperService whisperService, CallClassificationService classificationService) {
//        this.whisperService = whisperService;
//        this.classificationService = classificationService;
//    }
//
//    public void processAudioFile(String filePath) {
//        File audioFile = new File(filePath);
//        if (!audioFile.exists()) return;
//
//        // Step 1: Transcribe
//        String transcribedText = whisperService.transcribeAudio(audioFile);
//        if (transcribedText != null) {
//            System.out.println("Transcription: " + transcribedText);
//
//            // Step 2: Classify
//            String classificationResponse = classificationService.classifyText(transcribedText);
//            System.out.println("Classification: " + classificationResponse);
//        }
//    }
//}
