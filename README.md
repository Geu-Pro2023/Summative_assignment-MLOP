WildGuard Animal Classification Model

## Overview
WildGuard is a deep learning model that classifies animal species as ENDANGERED or NON-ENDANGERED based on their images. This project aims to assist conservation efforts by automatically identifying endangered species from camera traps or user-submitted photos.


##  Features
---
- **Real-time image classification**
- **Mobile-friendly interface (Flutter)**
- **Model retraining capability**
- **Conservation status visualization**
---
## Project Structure
```
wildguard/
├── backend/                  # FastAPI backend (Deployed on Render)
│   ├── app/                 # API logic
│   │   ├── main.py          # FastAPI routes
│   │   ├── models.py        # Pydantic models
│   │   ├── schemas.py       # Data validation
│   │   ├── utils.py         # Helper functions (e.g., image preprocessing)
│   │   └── config.py        # API settings
│   ├── Dockerfile           # Containerization
│   ├── requirements.txt     # Python dependencies
│   └── model/               # Trained model weights (.pth or .h5)
│
├── frontend/                # Flutter app
│   ├── lib/
│   │   ├── screens/         # App screens
│   │   │   ├── home_screen.dart
│   │   │   ├── predict_screen.dart    # Camera/image upload
│   │   │   ├── retrain_screen.dart    # Model retraining UI
│   │   │   ├── visualize_screen.dart  # Stats/charts
│   │   │   └── about_screen.dart
│   │   ├── services/        # API client
│   │   ├── widgets/         # Reusable UI components
│   │   └── models/          # Data classes
│   ├── pubspec.yaml         # Flutter dependencies
│   └── assets/              # Fonts (Poppins), images
│
├── notebook/                # ML pipeline
│   └── WildGuard_ML_Pipeline.ipynb  # Data prep, training, evaluation
└── README.md
```
---
## Installation

#### **Backend (FastAPI)**

**1. Navigate to the backend folder:**
```
cd wildguard/backend
```
**2. Install dependencies:**
```
pip install -r requirements.txt
```
**3. Run the API locally:**
```
uvicorn app.main:app --reload
```
#### Frontend (Flutter)
---
1. Install Flutter SDK: flutter.dev/docs/get-started/install
2. Navigate to the frontend folder:
```
cd wildguard/frontend
```
3. Install dependencies:
```
flutter pub get
```
4. Run the app:
```
flutter run
```

## Prerequisites
- Python 3.9+
- TensorFlow 2.x
- OpenCV
---

## Installation
```bash
git clone https://github.com/your-username/wildGuard-backend.git
cd wildGuard-backend/backend

# Create a virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

 ##  Backend Deployment (Hosted on Render)
 ---
**Live API Base URL:**
 ```
🔗 https://wildguard-backend.onrender.com
```
**Interactive API Documentation**
Access Swagger UI directly:
 ```
👉 https://wildguard-backend.onrender.com/docs
 ```
 ## Mobile App (APK) Installation
##### **Option 1: Download Pre-built APK**
1. Get the latest wildguard.apk from our releases:
```
https://github.com/Geu-Pro2023/Summative_assignment-MLOP/tree/main/frontend
```
2. On your Android device:
```
- Enable "Install Unknown Sources" (Settings → Security)
- Download the APK
- Tap to install
```
#### **Option 2: Build APK Locally**
```
flutter doctor #Flutter SDK is installed
```
```
cd wildguard/frontend
flutter build apk --release --target-platform android-arm64  # Generate a release APK:
```
```
frontend/build/app/outputs/flutter-apk/app-release.apk # Find the APK here
```
---
### 📥 Download APK (Latest Version)

[![Download APK](https://img.shields.io/badge/Download_WildGuard_APK-v1.0.0-blue?style=for-the-badge&logo=android)](wildGuard.apk)

**Installation Steps:**
1. Tap the download button above
2. On your Android device:
   - Go to `Settings → Security`
   - Enable **"Install unknown apps"** for your browser
3. Open the downloaded APK and tap "Install"

**Requirements:**
- Android 9 (Pie) or later
- 50MB free storage space
- Internet connection for predictions

**Checksum (SHA-256):**  
`a1b2c3...` *(replace with actual checksum)*

 ---
## Video Presentation
Watch the walkthrough here: https://youtu.be/FTnQl9zr-8U

## Author
Built by **Geu Aguto**
For an academic assignment involving ML deployment, mobile app integration, and model lifecycle management.


