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
import models.Terapia;
import java.util.List;

/**
 *
 * @author labctr
 */
@Service
public class TerapiaService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Terapia terapia) throws ServiceException{
        em.persist(terapia);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Terapia retrieve(int id) throws ServiceException{
        return em.find(Terapia.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Terapia terapia) throws ServiceException{
        em.merge(terapia);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Terapia> list() throws ServiceException{
        return em.createNamedQuery("Terapia.findAll").getResultList();
    }
    
}
