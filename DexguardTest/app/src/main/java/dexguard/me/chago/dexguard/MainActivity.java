package dexguard.me.chago.dexguard;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

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
