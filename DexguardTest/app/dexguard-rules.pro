-libraryjars D:\adt-bundle-windows-x86_64-20130717\sdk\platforms\android-21\android.jar
-dontwarn
-dontshrink
-android
-verbose
-encryptclasses dexguard.me.chago.dexguard.Man

-encryptstrings  "chago"

-optimizations !method/inlining/*

-classobfuscationdictionary "dictionary.txt"
-packageobfuscationdictionary "dictionary.txt"
-obfuscationdictionary "dictionary.txt"


-include ../antlibs/DexGuard6.0.24/android/dexguard-common.pro
-include ../antlibs/DexGuard6.0.24/android/dexguard-assumptions.pro
-include ../antlibs/DexGuard6.0.24/android/dexguard-android.pro
-include ../antlibs/DexGuard6.0.24/android/proguard-android.txt
-include ../antlibs/DexGuard6.0.24/android/proguard-android-optimize.txt
