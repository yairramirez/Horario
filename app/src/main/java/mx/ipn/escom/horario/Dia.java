package mx.ipn.escom.horario;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class Dia extends AppCompatActivity {

    private List<String> dias;
    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dia);

        //Forzar y cargar icono en el action bar
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        //getSupportActionBar().setIcon(R.mipmap.ic_fc);

        listView  = (ListView)findViewById(R.id.ListView);

        //Definir valores del ListView
        dias = new ArrayList();
        dias.add("Lunes");
        dias.add("Martes");
        dias.add("Miércoles");
        dias.add("Jueves");
        dias.add("Viernes");

        //Adaptador, forma visual para mostrar los datos
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, dias);

        //Agregar valores al ListView
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                //Acceder a la pagina principal
                Intent intent = new Intent(Dia.this,Principal.class);
                intent.putExtra("dia",dias.get(position));
                startActivity(intent);
                Toast.makeText(Dia.this, "Seleccionado: "+dias.get(position), Toast.LENGTH_LONG).show();
            }
        });

        //Enlazamos con nuestro adaptador personalizado
        Adaptador adaptador = new Adaptador(this, R.layout.list_item, dias);
        listView.setAdapter(adaptador);

    }
}
