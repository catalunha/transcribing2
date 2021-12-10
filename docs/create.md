# instalar CLI
npm install -g firebase-tools
firebase login
firebase init
"site": "transcribing2",
firebase deploy --only hosting:transcribing2
# Adicionar SDK
npm install firebase
## usar npm
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBAQPorlNLvYebJkWP9gRKHSwSwb0JgAtU",
  authDomain: "transcribe-brintec.firebaseapp.com",
  projectId: "transcribe-brintec",
  storageBucket: "transcribe-brintec.appspot.com",
  messagingSenderId: "392540845943",
  appId: "1:392540845943:web:7aafa8138d71987acb1372",
  measurementId: "${config.measurementId}"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

## usar a tag

<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyBAQPorlNLvYebJkWP9gRKHSwSwb0JgAtU",
    authDomain: "transcribe-brintec.firebaseapp.com",
    projectId: "transcribe-brintec",
    storageBucket: "transcribe-brintec.appspot.com",
    messagingSenderId: "392540845943",
    appId: "1:392540845943:web:7aafa8138d71987acb1372",
    measurementId: "${config.measurementId}"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>

# failed in kotlin_version
///edit file 
android/build.gradle
// change value
    ext.kotlin_version = '1.5.10'


# (<project>/<app-module>/build.gradle):
apply plugin: 'com.android.application'

// Add this line
apply plugin: 'com.google.gms.google-services'


dependencies {
  // Import the Firebase BoM
  implementation platform('com.google.firebase:firebase-bom:29.0.0')


  // Add the dependency for the Firebase SDK for Google Analytics
  // When using the BoM, don't specify versions in Firebase dependencies
  implementation 'com.google.firebase:firebase-analytics'


  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
}

#  (<project>/build.gradle):
buildscript {
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository

  }
  dependencies {
    ...
    // Add this line
    classpath 'com.google.gms:google-services:4.3.10'

  }
}

allprojects {
  ...
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository

    ...
  }
}

# google-services.json
baixar e constar no gitignore

# sha-1
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore

a senha é: android

catalunha@pop-os:~/myapps$ keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
Enter keystore password:  
Alias name: androiddebugkey
Creation date: Jun 30, 2021
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Wed Jun 30 14:38:17 BRT 2021 until: Fri Jun 23 14:38:17 BRT 2051
Certificate fingerprints:
	 SHA1: 35:89:8E:FB:FB:FA:95:8A:56:08:5C:CE:B5:7D:93:A0:E8:BD:4C:F7
	 SHA256: E5:AB:93:21:D4:A3:B5:E6:B0:4C:98:05:EA:91:6E:54:DD:32:D1:23:69:88:AE:6F:2E:13:02:7D:50:89:1C:09
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk. This algorithm will be disabled in a future update.
catalunha@pop-os:~/myapps$ 

# flutter create
catalunha@pop-os:~/myapps$ flutter create --org brintec transcribing2
