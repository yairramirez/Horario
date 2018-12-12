package mx.ipn.escom.horario;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class Principal extends AppCompatActivity {

    private GridView gridView;
    private List<String> salones;
    private TextView textView;
    private String dia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_principal);

        //Forzar y cargar icono en el action bar
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        //getSupportActionBar().setIcon(R.mipmap.ic_fc);

        //Activar flecha regresar
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        textView = (TextView) findViewById(R.id.Dia);

        //Tomar los datos del intent
        Bundle bundle = getIntent().getExtras();

        if(bundle != null && bundle.getString("dia") != null){
            dia = bundle.getString("dia");
            textView.setText(dia);
        }else{
            Toast.makeText(Principal.this, "Vacio", Toast.LENGTH_LONG).show();
        }

        gridView  = (GridView)findViewById(R.id.Horas);

        //Definir valores del ListView
        salones = new ArrayList();
        salones.add("07:00 - 08:30");
        salones.add("08:30 - 10:00");
        salones.add("10:30 - 12:00");
        salones.add("12:00 - 13:30");
        salones.add("13:30 - 15:00");
        salones.add("15:00 - 16:30");
        salones.add("16:30 - 18:00");
        salones.add("18:30 - 20:00");
        salones.add("20:00 - 21:30");

        //Adaptador, forma visual para mostrar los datos
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, salones);

        //Agregar valores al ListView
        gridView.setAdapter(adapter);

        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                //Acceder a la pagina Edificio
                Intent intent = new Intent(Principal.this,Edificio.class);
                intent.putExtra("hora",salones.get(position));
                intent.putExtra("dia",dia);
                intent.putExtra("edificio",1);
                startActivity(intent);

                Toast.makeText(Principal.this, "Seleccionado: "+salones.get(position), Toast.LENGTH_LONG).show();
            }
        });

        //Enlazamos con nuestro adaptador personalizado
        Adaptador adaptador = new Adaptador(this, R.layout.grid_item, salones);
        gridView.setAdapter(adaptador);

    }
}
