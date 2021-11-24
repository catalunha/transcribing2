

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
