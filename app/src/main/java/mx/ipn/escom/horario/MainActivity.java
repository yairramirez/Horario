package mx.ipn.escom.horario;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void ingresar(View view) {

        Intent i = new Intent(MainActivity.this, InicioActivity.class);
        startActivity(i);
        finish();
    }
    

    public void registro_pr(View view) {
        Intent rp = new Intent(MainActivity.this, Registro_ProActivity.class);
        startActivity(rp);
        finish();
    }

    public void registroal(View view) {
        Intent ral = new Intent(MainActivity.this, Registro_AluActivity.class);
        startActivity(ral);
        finish();
    }
}
