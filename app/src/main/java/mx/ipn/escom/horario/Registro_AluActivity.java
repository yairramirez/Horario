package mx.ipn.escom.horario;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class Registro_AluActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro__alu);
    }

    EditText tx = findViewById(R.id.Nombre_a);

    public void registro(View view) {

        String cadena1 = "20";
        Integer bo = Integer.valueOf(String.valueOf(tx));

        if(cadena1.equals(bo)) {
            System.out.println("Es alumono");
        } else {
            System.out.println("Es profesor");
        }

        Intent r = new Intent(Registro_AluActivity.this, MainActivity.class);
        startActivity(r);
        finish();
    }

    public void cancelar_a(View view) {
        finish();
    }

}
