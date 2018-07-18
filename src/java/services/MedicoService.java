/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.Medico;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author labctr
 */
@Service
public class MedicoService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Medico medico) throws ServiceException{
        em.persist(medico);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Medico retrieve(int id) throws ServiceException{
        return em.find(Medico.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Medico medico) throws ServiceException{
        em.merge(medico);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Medico> list() throws ServiceException{
        return em.createNamedQuery("Medico.findAll").getResultList();
    }
    
}
