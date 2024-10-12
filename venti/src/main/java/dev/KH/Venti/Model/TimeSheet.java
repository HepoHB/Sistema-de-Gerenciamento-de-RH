package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_TimeSheet")
public class TimeSheet{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "timesheet_id", nullable = false)
    private Long id;

    @Column(name = "timesheet_date")
    private String date;

    @Column(name = "timesheet_checkin_time")
    private String checkinTime;

    @Column(name = "timesheet_checkout_time")
    private String checkoutTime;

    @Column(name = "timesheet_overtime")
    private int overtime;

    @ManyToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "employee_id", nullable = false)
    private Long employeeId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getDate(){ return date; }
    public void setDate(String date){ this.date = date; }

    public String getCheckinTime(){ return checkinTime; }
    public void setCheckinTime(String checkinTime){ this.checkinTime = checkinTime; }

    public String getCheckoutTime(){ return checkoutTime; }
    public void setCheckoutTime(String checkoutTime){ this.checkoutTime = checkoutTime; }

    public int getOvertime(){ return overtime; }
    public void setOvertime(int overtime){ this.overtime = overtime; }

    public Long getEmployeeId(){ return employeeId; }
    public void setEmployeeId(Long employeeId){ this.employeeId = employeeId; }

}
