package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Department")
public class Department{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "department_id", nullable = false)
    private Long id;

    @Column(name = "department_name", nullable = false)
    private String name;

    @Column(name = "department_description")
    private String description;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getDescription(){ return description; }
    public void setDescription(String description){ this.description = description; }

}
