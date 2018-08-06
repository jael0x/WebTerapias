/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Medico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.MedicoService;
import services.ServiceException;



/**
 *
 * @author labctr
 */
@Controller
@RequestMapping("/medico") //Toda Url que empiece con /medico, va a ser atendida por este controlador
public class MedicoController {
    
    @Autowired //Inyección de dependencias
    private MedicoService service;
    
    @RequestMapping(value="/create", method= RequestMethod.GET)
    public String create(Model model){ //Los metodos en Spring Web MVC retornan un String
        try{
            Medico medico = new Medico();
            model.addAttribute("medico", medico);
            return "medico/create"; //Carpeta y nombre de la vista
        }
        catch(Exception ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/list", method= RequestMethod.GET)
    public String list(Model model){ //Los metodos en Spring Web MVC retornan un String
        try{
            List<Medico> medicos = service.list();
            model.addAttribute("medicos", medicos);
            return "medico/list"; //Carpeta y nombre de la vista
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/report", method= RequestMethod.GET)
    public String report(Model model){
        try{
            return "medico/report";
        }
        catch(Exception ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/retrieve/{id}", method= RequestMethod.GET) //medico/retrieve/123.htm
    public String retrieve(Model model, @PathVariable String id){ //Los metodos en Spring Web MVC retornan un String
        try{
            int pk = Integer.parseInt(id);
            Medico medico = service.retrieve(pk);
            model.addAttribute("medico", medico);
            return "medico/retrieve"; //Carpeta y nombre de la vista
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value="/update/{id}", method= RequestMethod.GET)
    public String update(Model model, @PathVariable String id){
        try{
            int pk = Integer.parseInt(id);
            Medico medico = service.retrieve(pk);
            model.addAttribute("medico", medico);
            return "medico/update";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/delete/{id}", method= RequestMethod.GET)
    public String delete(Model model, @PathVariable String id){
        try{
            int pk = Integer.parseInt(id);
            Medico medico = service.retrieve(pk);
            model.addAttribute("medico", medico);
            return "medico/delete";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/create", method= RequestMethod.POST)
    public String create(Model model, @ModelAttribute("medico") Medico medico){
        try{
            service.create(medico);
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/update", method= RequestMethod.POST)
    public String update(Model model, @ModelAttribute("medico") Medico medico){
        try{
            service.update(medico);
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/delete", method= RequestMethod.POST)
    public String delete(Model model, @ModelAttribute("medico") Medico medico){
        try{
            service.delete(medico.getMedicoId());
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
