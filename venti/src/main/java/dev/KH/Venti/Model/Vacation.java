package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Vacation")
public class Vacation{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "vacation_id", nullable = false)
    private Long id;

    @Column(name = "vacation_start")
    private String vacationStart;

    @Column(name = "vacation_end")
    private String vacationEnd;

    @ManyToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "employee_id", nullable = false)
    private Long employeeId;

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "status_id", nullable = false)
    private Long statusId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getVacationStart(){ return vacationStart; }
    public void setVacationStart(String vacationStart){ this.vacationStart = vacationStart; }

    public String getVacationEnd(){ return vacationEnd; }
    public void setVacationEnd(String vacationEnd){ this.vacationEnd = vacationEnd; }

    public Long getEmployeeId(){ return employeeId; }
    public void setEmployeeId(Long employeeId){ this.employeeId = employeeId; }

    public Long getStatusId(){ return statusId; }
    public void setStatusId(Long statusId){ this.statusId = statusId; }

}
