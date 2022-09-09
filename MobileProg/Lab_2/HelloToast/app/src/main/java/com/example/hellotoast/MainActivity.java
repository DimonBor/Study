package com.example.hellotoast;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private int mCount = 0;
    private TextView mShowCount;
    private Button countButton, zeroButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mShowCount = (TextView) findViewById(R.id.show_count);
        countButton = (Button) findViewById(R.id.button_count);
        zeroButton = (Button) findViewById(R.id.button_zero);
    }

    public void showToast(View view) {
        Toast toast = Toast.makeText(this, R.string.toast_message,
                Toast.LENGTH_SHORT);
        toast.show();
    }

    public void countUp(View view) {
        mCount++;

        if (!zeroButton.isEnabled()) {
            zeroButton.setEnabled(true);
            zeroButton.setBackgroundColor(Color.MAGENTA);
        }

        if (mShowCount != null) {
            mShowCount.setText(Integer.toString(mCount));
        }

        if (mCount % 2 == 0) {
            countButton.setBackgroundColor(Color.GREEN);
        }
        else{
            countButton.setBackgroundColor(Color.RED);
        }
    }

    public void setZero(View view) {
        mCount = 0;
        if (mShowCount != null) {
            mShowCount.setText(Integer.toString(mCount));
        }
        zeroButton.setEnabled(false);
        zeroButton.setBackgroundColor(Color.GRAY);
        countButton.setBackgroundColor(Color.GREEN);
    }
}

