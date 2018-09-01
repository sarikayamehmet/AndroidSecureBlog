The key features of DexGuard are as follows:
Name confusion
String confusion
Method call converted to reflection call
Clear the relevant code for the log and output stack
Apk secondary packing detection
environmental test
Class encryption
Due to problems with Gradle support in versions below DexGuard 7.0, its Gradle plugin does not work in the author's environment. So this article only explores its confusing capabilities for Java code.

0x01 environment configuration
1, create a test project
Create a new empty project on the AS and create a class Man.java that will be confused.

public class Man {
    private String name = "Jack";
    private int age = -1;

    public Man(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public Man() {
        name = "The man is no one";
        age = 0;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}
 
Call the Man class in the default generated MainActivity.java.

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        testDexGuard();
    }

    private void testDexGuard() {
        Man chago = new Man("chago", 18);
        Log.i("info", chago.getName() + " " + chago.getAge());
    }
}
 

2, configure DexGuard
Copy antlibs, dexguard-rules.pro, dictionary.txt into the project as shown.


Adding a task that relies on compiled source code in build.gradle, this code solidifies several parameters, so it can only be run in debug mode.

project.afterEvaluate {
    tasks.getByName("compileDebugSources") {
        it.doLast {
            println "**********The dexGuard tool is running begin************"
            def dexguardLibPath = "antlibs/DexGuard6.0.24/lib/dexguard.jar"
            def injarsPath = "build/intermediates/classes/debug"
            def outjarsPath = "build/intermediates/classes/dexguard"
            def outjarsFile = file(outjarsPath)
            if (outjarsFile.exists()) {
                outjarsFile.delete()
            }
            def injarsFile = file(injarsPath)
            def cmd = "java -jar ${dexguardLibPath} @app/dexguard-rules.pro -injars ${injarsFile.getAbsolutePath()} -outjars ${outjarsFile.getAbsolutePath()}"

            println("Confusing order：" + cmd)
            Process p = "${cmd}".execute()
            p.waitFor()
            def reader = new BufferedReader(new InputStreamReader(p.getInputStream()))
            println "Confuse command return:${reader.readLine()} ${p.exitValue()}"

            delete injarsFile.getAbsolutePath()
            outjarsFile.renameTo(injarsFile)

        }
    }
}
 

Modify the dexguard-rules.pro file. The confusion of DexGuard depends on the android.jar package. You need to modify the location of the android.jar package in the following code. Add classes, strings, and dictionaries that need to be mixed.

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

0x02 comparison of results
Name confusion
DexGuard's obfuscated name functionality is divided into three methods, package name, class name, attribute, and method name.

The confusion of package names is also divided into two ways. With -flattenpackagehierarchy ‘myobfuscated’, the confusing class will move to the package with ‘myobfuscated’ instead of the package name, but will retain the hierarchy except the package name. With the addition of -repackageclasses ‘myobfuscated’, the confusing classes will all be moved to the myobfuscated package.



String obfuscation | method call converted to reflection call
See below DexGuard converts "chago" into a string of hexadecimal, "ˊ" is the decryption function of this string.

The encryption of the Man class is configured above, and it is seen below that all calls to the Man class methods become reflection calls.

public class MainActivity extends AppCompatActivity {
    private static final byte[] ˊ;
    private static int ˋ;

    static {
        MainActivity.ˊ = new byte[]{111, 8, 125, 74, -5, 7, -6, -8};
        MainActivity.ˋ = 223;
    }

    public MainActivity() {
        super();
    }

    protected void onCreate(Bundle arg2) {
        super.onCreate(arg2);
        this.setContentView(2130968601);
        this.ˊ();
    }

    private static String ˊ(int arg9, int arg10, int arg11) {
        int v1_1;
        byte[] v3_1;
        int v6;
        int v4;
        byte[] v8 = MainActivity.ˊ;
        int v2 = arg10 * 4 + 5;
        int v0 = 99 - arg9 * 4;
        int v3 = 3 - arg11 * 2;
        byte[] v1 = new byte[v2];
        --v2;
        if(v8 == null) {
            v4 = 0;
            v6 = v3;
            v3_1 = v1;
            v1_1 = v2;
        }
        else {
            v4 = 0;
            v6 = v3;
            v3_1 = v1;
            v1_1 = v0;
        label_17:
            v3_1[v4] = ((byte)v1_1);
            if(v4 == v2) {
                return new String(v3_1, 0);
            }
            else {
                ++v6;
                ++v4;
                v0 = v8[v6];
            }
        }

        v1_1 += -v0;
        goto label_17;
    }

    private void ˊ() {
        int v0_3;
        StringBuilder v0_2;
        Object v1_1;
        String v0 = MainActivity.ˊ(0, 0, 0).intern();
        int v1 = 18;
        int v2 = 2;
        try {
            v1_1 = ˋ$ˆ.ˊ("dexguard.me.chago.dexguard.ˋ").getDeclaredConstructor(String.class, Integer
                    .TYPE).newInstance(v0, Integer.valueOf(v1));
        }
        catch(Throwable v0_1) {
            throw v0_1.getCause();
        }

        String v2_2 = "info";
        StringBuilder v3 = new StringBuilder();
        try {
            v0_2 = v3.append(ˋ$ˆ.ˊ("dexguard.me.chago.dexguard.ˋ").getMethod("getName", null).invoke(
                    v1_1, null));
        }
        catch(Throwable v0_1) {
            throw v0_1.getCause();
        }

        v3 = v0_2.append(" ");
        try {
            v0_3 = ˋ$ˆ.ˊ("dexguard.me.chago.dexguard.ˋ").getMethod("getAge", null).invoke(v1_1, null)
                    .intValue();
        }
        catch(Throwable v0_1) {
            throw v0_1.getCause();
        }

        Log.i(v2_2, v3.append(v0_3).toString());
    }
}
After the Man class is confusing, the amount of code is huge. The variables, method names, and strings in the class are confused. The external calls in the class are all converted into reflections.
