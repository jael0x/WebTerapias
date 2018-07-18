/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import javax.persistence.PersistenceContext;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import models.Paciente;
import java.util.List;

/**
 *
 * @author labctr
 */
@Service
public class PacienteService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Paciente paciente) throws ServiceException{
        em.persist(paciente);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Paciente retrieve(int id) throws ServiceException{
        return em.find(Paciente.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Paciente paciente) throws ServiceException{
        em.merge(paciente);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Paciente> list() throws ServiceException{
        return em.createNamedQuery("Paciente.findAll").getResultList();
    }
    
}
