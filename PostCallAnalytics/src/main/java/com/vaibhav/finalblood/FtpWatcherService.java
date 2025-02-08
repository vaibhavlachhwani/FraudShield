package com.vaibhav.finalblood;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

@Service
public class FtpWatcherService {
    private static final String FTP_SERVER = "192.168.66.155"; // Replace with actual FTP server
    private static final int FTP_PORT = 3434;
    private static final String FTP_USER = "pc"; // Replace with FTP credentials
    private static final String FTP_PASS = "12345";
    private static final String FTP_DIRECTORY = "/device/Recordings/Call";
    private static final String LOCAL_DIR = "/home/vaibhav/call/";

    private final Map<String, Long> fileSizes = new HashMap<>();

    @Scheduled(fixedDelay = 10000) // Check every 10 seconds
    public void checkFTPForNewFiles() {
        FTPClient ftpClient = new FTPClient();

        try {
            ftpClient.connect(FTP_SERVER, FTP_PORT);
            ftpClient.login(FTP_USER, FTP_PASS);
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            String[] files = ftpClient.listNames(FTP_DIRECTORY);
            if (files != null) {
                for (String fileName : files) {
                    if (fileName.endsWith(".wav") || fileName.endsWith(".mp3")) { // Check audio files
                        System.out.println("Found new audio file: " + fileName);
                        if (waitForFileCompletion(ftpClient, FTP_DIRECTORY + fileName)) {
                            downloadFile(ftpClient, FTP_DIRECTORY + fileName, LOCAL_DIR + fileName);
                            processAudioFile(LOCAL_DIR + fileName); // Process transcription
                        }
                    }
                }
            }

            ftpClient.logout();
        } catch (IOException ex) {
            System.err.println("FTP Error: " + ex.getMessage());
        } finally {
            try {
                ftpClient.disconnect();
            } catch (IOException ignored) {}
        }
    }

    private boolean waitForFileCompletion(FTPClient ftpClient, String filePath) throws IOException {
        long previousSize = -1;
        long currentSize;

        do {
            previousSize = getFileSize(ftpClient, filePath);
            try {
                Thread.sleep(5000); // Wait 5 seconds
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            currentSize = getFileSize(ftpClient, filePath);
        } while (previousSize != currentSize); // Stop when size stops increasing

        return true;
    }

    private long getFileSize(FTPClient ftpClient, String filePath) throws IOException {
        FTPClient tempClient = new FTPClient();
        tempClient.connect(FTP_SERVER, FTP_PORT);
        tempClient.login(FTP_USER, FTP_PASS);
        tempClient.enterLocalPassiveMode();

        long fileSize = tempClient.mlistFile(filePath).getSize();
        tempClient.logout();
        tempClient.disconnect();

        return fileSize;
    }

    private void downloadFile(FTPClient ftpClient, String remoteFilePath, String localFilePath) {
        try (OutputStream outputStream = new FileOutputStream(new File(localFilePath))) {
            if (ftpClient.retrieveFile(remoteFilePath, outputStream)) {
                System.out.println("File downloaded: " + localFilePath);
            } else {
                System.err.println("Failed to download: " + remoteFilePath);
            }
        } catch (IOException e) {
            System.err.println("Download Error: " + e.getMessage());
        }
    }

    private void processAudioFile(String filePath) {
        WhisperTranscriptionService transcriber = new WhisperTranscriptionService();
        String transcript = transcriber.transcribe(filePath);

        System.out.println("Transcribed text: " + transcript);

        CallHackathonAPIService predictor = new CallHackathonAPIService();
        String prediction = predictor.getPrediction(transcript);

        System.out.println("Final Prediction: " + prediction);
    }
}
