package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Status")
public class Status{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "status_id", nullable = false)
    private Long id;

    @Column(name ="status_name", nullable = false)
    private String name;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

}
