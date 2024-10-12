package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Position")
public class Position{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "position_id", nullable = false)
    private Long id;

    @Column(name = "position_name", nullable = false)
    private String name;

    @Column(name = "position_description")
    private String description;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getDescription(){ return description; }
    public void setDescription(String description){ this.description = description; }

}
