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

}
