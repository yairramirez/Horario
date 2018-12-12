package mx.ipn.escom.horario;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Edificio extends AppCompatActivity {

    private TextView textView;
    private List<String> salones;
    private GridView gridView;
    private Button edif2;
    private String hora;
    private String dia;
    private int edificio;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edificio);

        edif2 = findViewById(R.id.Edificio2);

        //Forzar y cargar icono en el action bar
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        //getSupportActionBar().setIcon(R.mipmap.ic_fc);

        //Activar flecha regresar
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        textView = (TextView) findViewById(R.id.Hora);

        //Tomar los datos del intent
        Bundle bundle = getIntent().getExtras();

        if(bundle != null && bundle.getString("hora") != null && bundle.getString("dia") != null){
            hora = bundle.getString("hora");
            dia = bundle.getString("dia");
            edificio = bundle.getInt("edificio");
            textView.setText(dia+" a las "+hora+" en el edificio "+edificio);
        }else{
            Toast.makeText(Edificio.this, "Vacio", Toast.LENGTH_LONG).show();
        }

        gridView = (GridView) findViewById(R.id.SalonesD);

        salones = new ArrayList();
        getDatos();

        //Adaptador, forma visual para mostrar los datos
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, salones);

        //Agregar valores al ListView
        gridView.setAdapter(adapter);

        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                //Acceder a la pagina Edificio
                Intent intent = new Intent(Edificio.this,ReservarActivity.class);
                intent.putExtra("hora",hora);
                intent.putExtra("dia",dia);
                intent.putExtra("edifico", edificio);
                intent.putExtra("salon", salones.get(position));
                startActivity(intent);

                Toast.makeText(Edificio.this, "Seleccionado: "+salones.get(position), Toast.LENGTH_LONG).show();
            }
        });



        //Listeners
        edif2.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                //Acceder a la pagina Edificio
                Intent intent = new Intent(Edificio.this,Edificio2.class);
                intent.putExtra("hora",hora);
                intent.putExtra("dia",dia);
                intent.putExtra("edificio", 2);
                startActivity(intent);
            }
        });
    }

    private void getDatos() {
        //String url = "http://10.0.0.3:3000/administrador/consulta";
        String url = "http://10.100.75.43:3000/salon/salonesprofesoresvacio";
        RequestQueue requestQueue = Volley.newRequestQueue(Edificio.this);
        JSONObject json = new JSONObject();

        try{
            json.put("dia", dia);
            json.put("hora", hora);
            json.put("edificio", edificio);
        }catch(JSONException e){
            e.printStackTrace();
        }

        //String url = getResources().getString(R.string.json_get_url);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, json,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        //Toast.makeText(getApplicationContext(), "onResponse:  " + response.toString(), Toast.LENGTH_SHORT).show();
                        // Log.d("JSON: ",response.toString());
                        showGridView(response);
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), "onEError:  " + error.toString(), Toast.LENGTH_SHORT).show();
            }
        });
        requestQueue.add(jsonObjectRequest);
    }

    private void showGridView(JSONObject jsonObject){


        try {
            JSONArray jsonarray = jsonObject.getJSONArray("dato");
            for (int i = 0; i < jsonarray.length(); i++) {
                jsonObject = jsonarray.getJSONObject(i);
                salones.add(jsonObject.getString("numSalon"));


            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        //Enlazamos con nuestro adaptador personalizado
        Adaptador adaptador = new Adaptador(this, R.layout.grid_item, salones);
        gridView.setAdapter(adaptador);

        /*ArrayAdapter<String> adapter = new ArrayAdapter<>(Edificio.this, android.R.layout.simple_list_item_1, salones);
        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                Toast.makeText(Edificio.this, "Clicked: "+salones.get(position), Toast.LENGTH_LONG).show();
            }
        });

        // Enlazamos el adaptador con nuestro List View
        gridView.setAdapter(adapter);*/

    }
}
