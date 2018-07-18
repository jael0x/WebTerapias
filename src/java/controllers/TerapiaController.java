/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import models.Medico;
import models.Paciente;
import models.Terapia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.MedicoService;
import services.PacienteService;
import services.TerapiaService;
import services.ServiceException;

/**
 *
 * @author JAEL ARMAS
 */
@Controller
@RequestMapping("/terapia")
public class TerapiaController {

    @Autowired
    private PacienteService srvPaciente;

    @Autowired
    private MedicoService srvMedico;

    @Autowired
    private TerapiaService srvTerapia;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        try {
            List<Terapia> terapias = srvTerapia.list();
            model.addAttribute("terapias", terapias);
            return "terapia/list";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @ModelAttribute("listMedico")
    public List<Medico> ListMedico() throws ServiceException {
        return srvMedico.list();
    }

    @ModelAttribute("listPaciente")
    public List<Paciente> ListPaciente() throws ServiceException {
        return srvPaciente.list();
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Model model) {
        try {
            Terapia terapia = new Terapia();
            model.addAttribute("terapia", terapia);
            return "terapia/create";
        } catch (Exception ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Model model, @ModelAttribute("terapia") Terapia terapia) {
        try {
            Calendar fecha = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            fecha.setTime(format.parse(terapia.getStrFecha()));
            terapia.setFecha(fecha.getTime());

            Paciente paciente = srvPaciente.retrieve(terapia.getIdpaciente());
            Medico medico = srvMedico.retrieve(terapia.getIdmedico());

            terapia.setPacienteId(paciente);
            terapia.setMedicoId(medico);

            terapia.setDuracion(0);
            terapia.setObservacion("-");
            terapia.setRealizada(false);

            srvTerapia.create(terapia);
            return "redirect:list.htm";

        } catch (ParseException | ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable int id) {
        try {
            Terapia terapia = srvTerapia.retrieve(id);
//            terapia.setIdmedico(terapia.getMedicoId().getMedicoId());
//            terapia.setIdpaciente(terapia.getPacienteId().getPacienteId());
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            String strFecha = format.format(terapia.getFecha());
//            terapia.setStrFecha(strFecha);
            
            model.addAttribute("terapia",terapia);
            return "terapia/update";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Model model, @ModelAttribute("terapia") Terapia newTerapia) {
        try {
//            Calendar fecha = Calendar.getInstance();
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            fecha.setTime(format.parse(terapia.getStrFecha()));
//            terapia.setFecha(fecha.getTime());
//
//            Paciente paciente = srvPaciente.retrieve(terapia.getIdpaciente());
//            Medico medico = srvMedico.retrieve(terapia.getIdmedico());
//
//            terapia.setPacienteId(paciente);
//            terapia.setMedicoId(medico);
            Terapia terapia = srvTerapia.retrieve(newTerapia.getTerapiaId());
            
            terapia.setDuracion(newTerapia.getDuracion());
            terapia.setObservacion(newTerapia.getObservacion());
            terapia.setRealizada(newTerapia.getRealizada());
            
            srvTerapia.update(terapia);
            return "redirect:list.htm";

        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(Model model, @PathVariable String id) {
        try {
            int pk = Integer.parseInt(id);
            Terapia terapia = srvTerapia.retrieve(pk);
            model.addAttribute("terapia", terapia);
            return "terapia/delete";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(Model model, @ModelAttribute("terapia") Terapia terapia) {
        try {
            srvTerapia.delete(terapia.getTerapiaId());
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
