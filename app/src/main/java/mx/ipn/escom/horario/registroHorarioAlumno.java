package mx.ipn.escom.horario;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class registroHorarioAlumno extends AppCompatActivity implements AdapterView.OnItemSelectedListener,OnClickListener {
    private Button buttonRegistrarHorarioAlumno;
    EditText editTextBoleta;
    String sGrupo;
    String sMateria;
    String sEdificio;
    String sLunes;
    String sMartes;
    String sMiercoles;
    String sJueves;
    String sViernes;
    String sBoleta;
    Spinner spinnerGrupo;
    Spinner spinnerMateria;
    Spinner spinnerEdificio;
    Spinner spinnerLunes;
    Spinner spinnerMartes;
    Spinner spinnerMiercoles;
    Spinner spinnerJueves;
    Spinner spinnerViernes;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro_horario_alumno);
//Recibe boleta
        editTextBoleta = findViewById(R.id.txtBoleta);

//Botón de registro
        buttonRegistrarHorarioAlumno = findViewById(R.id.buttonRegistrarHorarioAlumno);
        buttonRegistrarHorarioAlumno.setOnClickListener(this);
// Spinner element
        spinnerGrupo =  findViewById(R.id.spinnerGrupo);
        spinnerMateria = findViewById(R.id.spinnerMateria);
        spinnerEdificio = findViewById(R.id.spinnerEdificio);
        spinnerLunes = findViewById(R.id.spinnerLunes);
        spinnerMartes = findViewById(R.id.spinnerMartes);
        spinnerMiercoles = findViewById(R.id.spinnerMiercoles);
        spinnerJueves = findViewById(R.id.spinnerJueves);
        spinnerViernes = findViewById(R.id.spinnerViernes);



        // Spinner GRUPO
        spinnerGrupo.setOnItemSelectedListener(this);
        //Spinner Materia
        spinnerMateria.setOnItemSelectedListener(this);
        //Spiner Edificio
        spinnerEdificio.setOnItemSelectedListener(this);

        //Spiner Lunes
        spinnerLunes.setOnItemSelectedListener(this);

        //Spiner Martes
        spinnerMartes.setOnItemSelectedListener(this);

        //Spiner Miércoles
        spinnerMiercoles.setOnItemSelectedListener(this);

        //Spiner Jueves
        spinnerJueves.setOnItemSelectedListener(this);

        //Spiner Viernes
        spinnerViernes.setOnItemSelectedListener(this);


        // Spinner Drop down elements grupos
        List<String> categories = new ArrayList<>();
        categories.add("1CM1");
        categories.add("1CM10");
        categories.add("1CM11");
        categories.add("1CM12");
        categories.add("1CM13");
        categories.add("1CM14");
        categories.add("1CM2");
        categories.add("1CM3");
        categories.add("1CM4");
        categories.add("1CM5");
        categories.add("1CM6");
        categories.add("1CM7");
        categories.add("1CM8");
        categories.add("1CM9");
        categories.add("1CV1");
        categories.add("1CV10");
        categories.add("1CV11");
        categories.add("1CV12");
        categories.add("1CV2");
        categories.add("1CV3");
        categories.add("1CV4");
        categories.add("1CV5");
        categories.add("1CV6");
        categories.add("1CV7");
        categories.add("1CV8");
        categories.add("1CV9");
        categories.add("2CM1");
        categories.add("2CM10");
        categories.add("2CM11RC");
        categories.add("2CM11TC");
        categories.add("2CM2");
        categories.add("2CM3");
        categories.add("2CM4");
        categories.add("2CM5");
        categories.add("2CM6");
        categories.add("2CM7");
        categories.add("2CM8");
        categories.add("2CM9");
        categories.add("2CV1");
        categories.add("2CV10");
        categories.add("2CV2");
        categories.add("2CV3");
        categories.add("2CV4");
        categories.add("2CV5");
        categories.add("2CV6");
        categories.add("2CV7");
        categories.add("2CV8");
        categories.add("2CV9");
        categories.add("3CM1");
        categories.add("3CM10");
        categories.add("3CM11");
        categories.add("3CM12");
        categories.add("3CM2");
        categories.add("3CM3");
        categories.add("3CM4");
        categories.add("3CM5");
        categories.add("3CM6");
        categories.add("3CM7");
        categories.add("3CM8");
        categories.add("3CM9");
        categories.add("3CV1");
        categories.add("3CV10");
        categories.add("3CV2");
        categories.add("3CV3");
        categories.add("3CV4");
        categories.add("3CV5");
        categories.add("3CV6");
        categories.add("3CV7");
        categories.add("3CV8");
        categories.add("3CV9");
        categories.add("4CM1");
        categories.add("4CM2");
        categories.add("4CM3");
        categories.add("4CM4");
        categories.add("4CV1");
        categories.add("4CV2");
        categories.add("4CV3");
        categories.add("4CV4");
        categories.add("5CM1");
        categories.add("5CM2");
        categories.add("5CM3");
        categories.add("5CV1");
        categories.add("5CV2");
        categories.add("5CV3");

        // Spinner Drop down elements
        List<String> materias = new ArrayList<>();

materias.add("ADMINISTRACION DE PROYECTOS");
materias.add("ADMINISTRACION DE SERVICIOS EN RED");
materias.add("Administracion Financiera");
materias.add("ADVANCED COMPUTING SYSTEMS PROGRAMMING");
materias.add("Algebra lineal");
materias.add("Algoritmia y programación estructurada");
materias.add("ANALISIS DE ALGORITMOS");
materias.add("Analisis fundamental de circuitos");
materias.add("Análisis Vectorial");
materias.add("Analisis y Diseño Orientado a Objetos");
materias.add("ANALYSIS AND DESIGN OF PARALLEL ALGORITHMS");
materias.add("APLICACIONES PARA COMUNICACIONES DE RED");
materias.add("APPLICATION DEVELOPMENT FOR MOBILE DEVICES");
materias.add("ARQUITECTURA DE COMPUTADORAS");
materias.add("ARTIFICIAL INTELLIGENCE");
materias.add("Bases de Datos");
materias.add("BASIC PROCESSING DIGITAL SIGNAL");
materias.add("BIOINFORMATICS");
materias.add("Cálculo");
materias.add("Calculo Aplicado");
materias.add("COMPILADORES");
materias.add("COMPUTATIONAL GEOMETRY");
materias.add("COMPUTING SELECTED TOPICS");
materias.add("Comunicación Oral y Escrita");
materias.add("CRYPTOGRAPHY");
materias.add("DATA BASE SELECTED TOPICS");
materias.add("DATA MINING");
materias.add("DESARROLLO DE SISTEMAS DISTRIBUIDOS");
materias.add("DIGITAL PROCESSING OF VOICE AND IMAGE");
materias.add("Diseño de sistemas Digitales");
materias.add("DISTRIBUTED DATA BASE");
materias.add("ECONOMIC ENGINEERING");
materias.add("Ecuaciones Diferenciales");
materias.add("Electronica Analogica");
materias.add("EMBEDDED SYSTEMS");
materias.add("Estructuras de datos");
materias.add("Física");
materias.add("Fundamentos de diseño digital");
materias.add("Fundamentos Economicos");
materias.add("GENETIC ALGORITHMS");
materias.add("GESTION EMPRESARIAL");
materias.add("HIGH TECHNOLOGY ENTERPRISE MANAGEMENT");
materias.add("IMAGE ANALYSIS");
materias.add("INGENIERIA DE SOFTWARE");
materias.add("Ingenieria ética y Sociedad");
materias.add("INSTRUMENTACION");
materias.add("INTRODUCCION A LOS MICROCONTROLADORES");
materias.add("IT GOVERNANCE");
materias.add("LIDERAZGO Y DESARROLLO PROFESIONAL");
materias.add("Matematicas Avanzadas para la Ingenieria");
materias.add("Matemáticas Discretas");
materias.add("METODOS CUANTITATIVOS PARA LA TOMA DE DECISIO");
materias.add("NEURAL NETWORKS");
materias.add("PARALLEL AND CONCURRENT PROGRAMMING");
materias.add("PATTERN RECOGNITION");
materias.add("Probabilidad y Estadistica");
materias.add("Programacion Orientada a Objetos");
materias.add("Redes de computadoras");
materias.add("Sistemas Operativos");
materias.add("SOFTWARE ENGINEERING FOR MOBILE DEVICES");
materias.add("Tecnologias para la web");
materias.add("Teoria Computacional");
materias.add("TEORIA DE COMUNICACIONES Y SEÑALES");
materias.add("TRABAJO TERMINAL I");
materias.add("TRABAJO TERMINAL II");
materias.add("WEB APPLICATION DEVELOPMENT");
materias.add("WEB SECURITY");

        // Spinner Drop down elements
        List<String> edificios = new ArrayList<>();

edificios.add("1011");
edificios.add("1012");
edificios.add("1013");
edificios.add("1014");
edificios.add("1110");
edificios.add("1111");
edificios.add("1112");
edificios.add("1113");
edificios.add("1202");
edificios.add("1203");
edificios.add("1204");
edificios.add("1205");
edificios.add("1206");
edificios.add("1207");
edificios.add("1209");
edificios.add("1210");
edificios.add("1211");
edificios.add("1212");
edificios.add("1213");
edificios.add("1214");
edificios.add("2004");
edificios.add("2005");
edificios.add("2006");
edificios.add("2007");
edificios.add("2110");
edificios.add("2111");
edificios.add("2201");
edificios.add("2202");
edificios.add("2203");
edificios.add("2204");
edificios.add("2205");
edificios.add("2206");
edificios.add("2207");
edificios.add("2209");
edificios.add("2210");
edificios.add("2211");

        // Spinner Drop down elements Lunes
        List<String> lunes = new ArrayList<>();
        lunes.add("7:00");
        lunes.add("8:30");
        lunes.add("10:30");
        lunes.add("12:00");
        lunes.add("13:30");
        lunes.add("3:00");
        lunes.add("4:30");
        lunes.add("6:30");
        lunes.add("8:00");
        lunes.add("9:30");

        // Spinner Drop down elements Lunes
        List<String> martes = new ArrayList<>();
        martes.add("7:00");
        martes.add("8:30");
        martes.add("10:30");
        martes.add("12:00");
        martes.add("13:30");
        martes.add("3:00");
        martes.add("4:30");
        martes.add("6:30");
        martes.add("8:00");
        martes.add("9:30");

        // Spinner Drop down elements Lunes
        List<String> miercoles = new ArrayList<>();
        miercoles.add("7:00");
        miercoles.add("8:30");
        miercoles.add("10:30");
        miercoles.add("12:00");
        miercoles.add("13:30");
        miercoles.add("3:00");
        miercoles.add("4:30");
        miercoles.add("6:30");
        miercoles.add("8:00");
        miercoles.add("9:30");

        // Spinner Drop down elements Lunes
        List<String> jueves = new ArrayList<>();
        jueves.add("7:00");
        jueves.add("8:30");
        jueves.add("10:30");
        jueves.add("12:00");
        jueves.add("13:30");
        jueves.add("3:00");
        jueves.add("4:30");
        jueves.add("6:30");
        jueves.add("8:00");
        jueves.add("9:30");

        // Spinner Drop down elements Lunes
        List<String> viernes = new ArrayList<>();
        viernes.add("7:00");
        viernes.add("8:30");
        viernes.add("10:30");
        viernes.add("12:00");
        viernes.add("13:30");
        viernes.add("3:00");
        viernes.add("4:30");
        viernes.add("6:30");
        viernes.add("8:00");
        viernes.add("9:30");


        //GRUPO
        // Creating adapter for spinner
        ArrayAdapter<String> dataGrupo = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, categories);

        // Drop down layout style - list view with radio button
        dataGrupo.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerGrupo.setAdapter(dataGrupo);

        //MATERIA

        // Creating adapter for spinner
        ArrayAdapter<String> dataMateria = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, materias);

        // Drop down layout style - list view with radio button
        dataMateria.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerMateria.setAdapter(dataMateria);

        //EDIFICIO
        // Creating adapter for spinner
        ArrayAdapter<String> dataEdificio = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, edificios);

        // Drop down layout style - list view with radio button
        dataEdificio.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerEdificio.setAdapter(dataEdificio);

        //LUNES
        // Creating adapter for spinner
        ArrayAdapter<String> dataLunes = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, lunes);

        // Drop down layout style - list view with radio button
        dataLunes.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerLunes.setAdapter(dataLunes);

        //MARTES
        // Creating adapter for spinner
        ArrayAdapter<String> dataMartes = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, martes);

        // Drop down layout style - list view with radio button
        dataMartes.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerMartes.setAdapter(dataMartes);

        //MIERCOLES
        // Creating adapter for spinner
        ArrayAdapter<String> dataMiercoles = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, miercoles);

        // Drop down layout style - list view with radio button
        dataMiercoles.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerMiercoles.setAdapter(dataMiercoles);

        //JUEVES
        // Creating adapter for spinner
        ArrayAdapter<String> dataJueves = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, jueves);

        // Drop down layout style - list view with radio button
        dataJueves.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerJueves.setAdapter(dataJueves);

        //VIERNES
        // Creating adapter for spinner
        ArrayAdapter<String> dataViernes = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, viernes);

        // Drop down layout style - list view with radio button
        dataViernes.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // attaching data adapter to spinner
        spinnerViernes.setAdapter(dataViernes);



      //  registraHorarioAlumno(sboleta,sGrupo,sMateria,sEdificio,sLunes,sMartes,sMiercoles,sJueves,sViernes);

    }

    //@Override
    //public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        // On selecting a spinner item
      //  String item = parent.getItemAtPosition(position).toString();

        // Showing selected spinner item
       // Toast.makeText(parent.getContext(), "Seleccionado: " + item, Toast.LENGTH_LONG).show();
   // }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        //Get spinner element

        sGrupo = spinnerGrupo.getSelectedItem().toString();
        sMateria = spinnerMateria.getSelectedItem().toString();
        sEdificio = spinnerEdificio.getSelectedItem().toString();
        sLunes = spinnerLunes.getSelectedItem().toString();
        sMartes = spinnerMartes.getSelectedItem().toString();
        sMiercoles = spinnerMiercoles.getSelectedItem().toString();
        sJueves = spinnerJueves.getSelectedItem().toString();
        sViernes = spinnerViernes.getSelectedItem().toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }

    @Override
    public void onClick(View view) {
        if (view==buttonRegistrarHorarioAlumno){
           // Log.d("Boleta",sBoleta);
            Log.d("Grupo",sGrupo);
            Log.d("Materia",sMateria);
            Log.d("edif",sEdificio);
            Log.d("LU",sLunes);
            Log.d("Ma",sMartes);
            Log.d("Mi",sMiercoles);
            Log.d("Ju",sJueves);
            Log.d("Vi",sViernes);


            registraHorarioA(sGrupo,sMateria,sEdificio,sLunes,sMartes,sMiercoles,sJueves,sViernes);
        }

    }

    private void registraHorarioA(String grupo, String materia, String edificio, String lunes, String martes, String miercoles, String jueves, String viernes) {
//        final String username = editTextUserName.getText().toString();
//        final String profession = editTextProfession.getText().toString();
        String url = "http://10.100.75.43:3000/alumno/registrahorarioalumno";
        String boleta = editTextBoleta.getText().toString();
        Log.d("boleta",boleta);
        RequestQueue requestQueue = Volley.newRequestQueue(this);

        JSONObject json = new JSONObject();
        try {
            json.put("boleta",boleta);
            json.put("grupo",grupo);
            json.put("materia",materia);
            json.put("edificio",edificio);
            json.put("lunes",lunes);
            json.put("martes",martes);
            json.put("miercoles",miercoles);
            json.put("jueves",jueves);
            json.put("viernes",viernes);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        //String url = getResources().getString(R.string.json_get_url);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, json,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        Toast.makeText(getApplicationContext(), "onResponse:  " + response.toString(), Toast.LENGTH_SHORT).show();
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), "onResponse:  " + error.toString(), Toast.LENGTH_SHORT).show();
            }
        });
//        jsonObjectRequest.setTag(REQ_TAG);
        requestQueue.add(jsonObjectRequest);
    }
}
