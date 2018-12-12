package mx.ipn.escom.horario;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class Registro_ProActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro__pro);
    }

    public void registro_p(View view) {
        Intent rp = new Intent(Registro_ProActivity.this, MainActivity.class);
        startActivity(rp);
        finish();
    }

    public void cancelar_p(View view) {
        finish();
    }
}
