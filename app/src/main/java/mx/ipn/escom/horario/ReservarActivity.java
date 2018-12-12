package mx.ipn.escom.horario;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class ReservarActivity extends AppCompatActivity {

    private TextView SalonV;
    //private TextView HoraIniV;
    // private TextView HoraFinV;
    //private TextView FechaV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reservar);

        SalonV= (TextView)findViewById(R.id.SalonV);
        String Salon = getIntent().getStringExtra("Salon");
        SalonV.setText("Salon: " + Salon);

        //HoraIniV =(TextView)findViewById(R.id.HoraIniText);
        //String HoraIni = getIntent().getStringExtra("HoraIni");
        //HoraIniV.setText("Hora de inicio: "+HoraIni);

        // HoraFinV =(TextView)findViewById((R.id.HoraFinV));
        //String HoraFin = getIntent().getStringExtra("HoraFin");
        //HoraFinV.setText("Hora de termino: "+HoraFin);

        //FechaV =(TextView)findViewById(R.id.FechaV);
        //String Dia =getIntent().getStringExtra("Dia");
        //FechaV.setText("Día de la reservación: "+Dia);


    }

    public void regresar(View view){
        Intent regresa = new Intent(this, MainActivity.class);
        startActivity(regresa);

    }
}
