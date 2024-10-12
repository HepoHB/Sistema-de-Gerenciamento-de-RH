package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Employee")
public class Employee{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "employee_id", nullable = false)
    private Long id;



}
