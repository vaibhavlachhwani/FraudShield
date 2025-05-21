# **FraudShield – Stay Protected from Fraudulent Calls**  
**FraudShield** is a comprehensive spam detection service designed to protect users from fraudulent and spam calls. This cross-platform mobile app, built with **Flutter**, helps classify phone numbers as **Not Spam**, **Likely Spam**, or **Confirmed Spam** using an advanced scoring algorithm. With real-time detection, adaptive learning, and modern UI, **FraudShield** keeps you informed and safe.  



---

## 🚀 **Features**
### 📱 **Frontend (Mobile App)**  
- **Cross-Platform**: Built with **Flutter**, available on **iOS** and **Android**.  
- **Modern UI**: Responsive design following **Material Design principles** using Figma.  
- **Dashboard**: Access recent activity, quick actions, and search contacts.  
- **Community Alerts**: Stay updated on recent scams in your area.  
- **Emergency SOS**: Immediate access to emergency contacts with an SOS button.  
- **Learn & Stay Safe**: Educational content on recognizing and avoiding scams.  
- **Language Settings**: Multi-language support (English, Hindi, Marathi) with real-time switching.  
- **Real-Time Notifications**: Stay informed with instant alerts about scams and security updates.  

### 🔐 **Backend (Spam Detection Service)**  
FraudShield’s backend is built with **Spring Boot**, **PostgreSQL**, and **JPA**, offering a sophisticated spam detection engine. The service classifies phone numbers based on multiple factors:  
- **Report Frequency**: Increases the spam score non-linearly with frequent reports.  
- **Exponential Time Decay**: Reduces the weight of older reports.  
- **Dynamic Risk Assessment**: Ensures real-time classification and adaptive learning for accurate results.  

### 📊 **Architecture**  
The backend ensures high scalability, real-time updates, and efficient data processing. It follows **RESTful API principles** for secure communication with the mobile app.

---

## 🛠️ **Tech Stack**
### **Frontend:**
- **Flutter** (Dart)  
- **Provider** for state management  
- **Vite** and **Tailwind CSS** (for multi-page form functionality)  
- **url_launcher** for opening external resources  

### **Backend:**
- **Spring Boot** (Java)  
- **PostgreSQL** for data storage  
- **JPA** (Java Persistence API) for ORM  
- **REST API** for secure communication  

---

## 📂 **Folder Structure**
```
FraudShield/
│
├── lib/
│   ├── main.dart               # Entry point of the Flutter app
│   ├── screens/                # Contains all screen widgets
│   │   ├── dashboard_screen.dart
│   │   ├── emergency_screen.dart
│   │   ├── learn_stay_safe_screen.dart
│   │   └── language_settings_page.dart
│   ├── widgets/                # Reusable UI components (Footer, Quick Actions, etc.)
│   └── services/               # API and backend service integrations
│
├── assets/                     # Images and multilingual JSON files for localization
│   ├── multilingual_assets/en.json
│   ├── multilingual_assets/hi.json
│   └── multilingual_assets/mr.json
│
├── backend/                    # Backend service (Spring Boot)
│   ├── src/main/java/          # Java source files
│   └── resources/application.yml
└── README.md
```

---

## ⚙️ **Setup and Installation**
### **Frontend (Flutter)**
1. Clone the repository:  
   ```bash
   git clone https://github.com/yourusername/fraudshield.git
   cd fraudshield
   ```
2. Install dependencies:  
   ```bash
   flutter pub get
   ```
3. Run the app:  
   ```bash
   flutter run
   ```

### **Backend (Spring Boot)**
1. Install **Java 11+** and **PostgreSQL**.  
2. Configure the `application.yml` file with your database credentials.  
3. Build and run the backend:  
   ```bash
   ./mvnw spring-boot:run
   ```

---

## 🔍 **How Spam Detection Works**
FraudShield’s backend uses an advanced algorithm for risk assessment:  
- **High-frequency reports**: Immediate classification as **Likely Spam** or **Confirmed Spam**.  
- **Exponential Decay**: Reduces the influence of older reports over time.  
- **Real-Time Learning**: Adapts and improves with each report.  

Example:
```json
{
  "phoneNumber": "+1234567890",
  "classification": "Likely Spam",
  "spamScore": 85.6
}
```

---

## 🛡️ **Security and Privacy**
- **Secure API Communication**: All communication between the app and backend is encrypted.  
- **Data Anonymization**: User data is anonymized to protect privacy.  
- **Periodic Updates**: Stay up to date with the latest scam trends.  

---

## 🧑‍💻 **Contributing**
We welcome contributions! Feel free to submit issues or pull requests.

1. Fork the repository.  
2. Create a new branch:  
   ```bash
   git checkout -b feature/your-feature
   ```  
3. Commit your changes:  
   ```bash
   git commit -m 'Add your feature'
   ```  
4. Push the branch and submit a pull request.

---

## 📞 **Contact**
For questions or support, reach out at **[mehakverma2026@gmail.com](mailto:mehakverma2026@gmail.com)**.  
