/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author labctr
 */
@Entity
@Table(name = "terapia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Terapia.findAll", query = "SELECT t FROM Terapia t")
    , @NamedQuery(name = "Terapia.findByTerapiaId", query = "SELECT t FROM Terapia t WHERE t.terapiaId = :terapiaId")
    , @NamedQuery(name = "Terapia.findByFecha", query = "SELECT t FROM Terapia t WHERE t.fecha = :fecha")
    , @NamedQuery(name = "Terapia.findByDuracion", query = "SELECT t FROM Terapia t WHERE t.duracion = :duracion")
    , @NamedQuery(name = "Terapia.findByObservacion", query = "SELECT t FROM Terapia t WHERE t.observacion = :observacion")
    , @NamedQuery(name = "Terapia.findByRealizada", query = "SELECT t FROM Terapia t WHERE t.realizada = :realizada")})
public class Terapia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "terapia_id")
    private Integer terapiaId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Column(name = "duracion")
    private Integer duracion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "observacion")
    private String observacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "realizada")
    private boolean realizada;
    @JoinColumn(name = "medico_id", referencedColumnName = "medico_id")
    @ManyToOne(optional = false)
    private Medico medicoId;
    @JoinColumn(name = "paciente_id", referencedColumnName = "paciente_id")
    @ManyToOne(optional = false)
    private Paciente pacienteId;

    @Transient //No transaccion con la base de datos
    private String strFecha;
    
    @Transient
    private int idpaciente;
    
    @Transient
    private int idmedico;

    public String getStrFecha() {
        return strFecha;
    }

    public void setStrFecha(String strFecha) {
        this.strFecha = strFecha;
    }

    public String getFechaDesc() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
        return sdf.format(fecha);
    }

    public int getIdpaciente() {
        return idpaciente;
    }

    public void setIdpaciente(int idpaciente) {
        this.idpaciente = idpaciente;
    }

    public int getIdmedico() {
        return idmedico;
    }

    public void setIdmedico(int idmedico) {
        this.idmedico = idmedico;
    }
    
    
    public Terapia() {
    }

    public Terapia(Integer terapiaId) {
        this.terapiaId = terapiaId;
    }

    public Terapia(Integer terapiaId, Date fecha, String observacion, boolean realizada) {
        this.terapiaId = terapiaId;
        this.fecha = fecha;
        this.observacion = observacion;
        this.realizada = realizada;
    }

    public Integer getTerapiaId() {
        return terapiaId;
    }

    public void setTerapiaId(Integer terapiaId) {
        this.terapiaId = terapiaId;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public boolean getRealizada() {
        return realizada;
    }

    public void setRealizada(boolean realizada) {
        this.realizada = realizada;
    }

    public Medico getMedicoId() {
        return medicoId;
    }

    public void setMedicoId(Medico medicoId) {
        this.medicoId = medicoId;
    }

    public Paciente getPacienteId() {
        return pacienteId;
    }

    public void setPacienteId(Paciente pacienteId) {
        this.pacienteId = pacienteId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (terapiaId != null ? terapiaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Terapia)) {
            return false;
        }
        Terapia other = (Terapia) object;
        if ((this.terapiaId == null && other.terapiaId != null) || (this.terapiaId != null && !this.terapiaId.equals(other.terapiaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Terapia[ terapiaId=" + terapiaId + " ]";
    }

}
