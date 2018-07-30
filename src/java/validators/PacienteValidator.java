/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import models.Paciente;
import org.springframework.validation.ValidationUtils;
/**
 * 
 *
 * @author JAEL ARMAS
 */
public class PacienteValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return Paciente.class.isAssignableFrom(type);
    }
    
    //En Object viene el modelo a ser validado
    @Override //Implementa validaciones
    public void validate(Object o, Errors errors) {
        Paciente paciente = (Paciente) o;
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
                "cedula", //Atributo del modelo
                "required.cedula", 
                "Debe registrar una cédula");
     
        if(paciente.getCedula().length() > 10){
            errors.rejectValue("cedula", "required.cedula","La cédula no puede tener más de 10 caracteres");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
                "nombre", 
                "required.nombre", 
                "Debe registrar un nombre");

        if(paciente.getNombre().length() > 30){
            errors.rejectValue("nombre", "required.nombre","El nombre no puede tener más de 30 caracteres");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
                "strFecha", 
                "required.strFecha", 
                "Debe registrar una fecha de Nacimiento");
        
        try{
            Calendar hoy = Calendar.getInstance();
            Calendar fecha = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fecha.setTime(format.parse(paciente.getStrFecha()));
            if(fecha.after(hoy)){
                errors.rejectValue("strFecha","required.strFecha","La fecha de nacimiento no puede ser posterior al día de hoy");
            }
        }catch(ParseException ex){
//            errors.rejectValue("strFecha", "required.strFecha","");
                System.out.println(ex);
                System.out.println("La fecha está mal");
        }
        
        if (paciente.getEstatura() == null) {
            errors.rejectValue("estatura", "required.estatura", "Debe ingresar un valor de estatura");
        }else if (paciente.getEstatura() < 70 || paciente.getEstatura() > 230) {
            errors.rejectValue("estatura", "required.estatura", "Verifique el valor de la estatura");
        }
        
        if (paciente.getPeso() == null) {
            errors.rejectValue("peso", "required.peso", "Debe ingresar un valor de peso");
        }else if (paciente.getPeso() < 30 || paciente.getPeso() > 330) {
            errors.rejectValue("peso", "required.peso", "Verifique el valor del peso");
        }
    }    
}
