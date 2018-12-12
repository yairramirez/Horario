package mx.ipn.escom.horario;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

public class Adaptador extends BaseAdapter {

    private Context context;
    private int layout;
    private List<String> salones;

    public Adaptador(Context context, int layout, List<String> salones){
        this.context = context;
        this.layout = layout;
        this.salones = salones;
    }

    @Override
    public int getCount() {
        return this.salones.size();
    }

    @Override
    public Object getItem(int position) {
        return this.salones.get(position);
    }

    @Override
    public long getItemId(int id) {
        return id;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup viewGroup) {

        //View Holder Pattern
        ViewHolder holder;

        if(convertView == null){
            //Inflamos la vista con nuestro layout personalizado
            LayoutInflater layoutInflater = LayoutInflater.from(this.context);
            convertView = layoutInflater.inflate(this.layout, null);

            holder = new ViewHolder();

            //Referenciamos el evento a modificar y lo rellenamos
            holder.nombresTextView = (TextView) convertView.findViewById(R.id.textView);
            convertView.setTag(holder);
        }else{
            holder = (ViewHolder) convertView.getTag();
        }

        //Traemos el valor actual dependiente de la posicion
        String salonActual = salones.get(position);

        //Referenciamos el evento a modificar y lo rellenamos
        holder.nombresTextView.setText(salonActual);

        //Devolvemos la vista inflada y modificada
        return convertView;

    }

    static class ViewHolder{
        private TextView nombresTextView;
    }
}
