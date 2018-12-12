package mx.ipn.escom.horario;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class InicioActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inicio);
    }



    public void consulta_reservacion(View view) {

        Intent cr = new Intent(InicioActivity.this, consultaHorasLibres.class);
        startActivity(cr);

    }

    public void ingresa_horario(View view) {

        Intent ih = new Intent(InicioActivity.this, registroHorarioAlumno.class);
        startActivity(ih);

    }

    public void buscar_salon(View view) {

        Intent bs = new Intent(InicioActivity.this, Dia.class);
        startActivity(bs);

    }

    public void modificar_horario(View view) {
        Intent mh = new Intent(InicioActivity.this, InicioActivity.class);
        startActivity(mh);

    }
}
