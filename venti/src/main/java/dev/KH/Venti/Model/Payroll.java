package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Payroll")
public class Payroll{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "payroll_id", nullable = false)
    private Long id;

    @Column(name = "payroll_date", nullable = false)
    private String date;

    @Column(name = "employee")
    private Long employeeId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getDate(){ return date; }
    public void setDate(String date){ this.date = date; }

    public Long getEmployeeId(){ return employeeId; }
    public void setEmployeeId(Long employeeId){ this.employeeId = employeeId; }


}
