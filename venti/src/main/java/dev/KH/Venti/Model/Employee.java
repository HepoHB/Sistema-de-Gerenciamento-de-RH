package dev.KH.Venti.Model;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "Venti_Employee")
public class Employee{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "employee_id", nullable = false)
    private Long id;

    @Column(name = "employee_name", nullable = false)
    private String name;

    @Column(name = "employee_cpf", nullable = false, unique = true)
    private String cpf;

    @Column(name = "employee_birthday", nullable = false)
    private String birthday;

    @Column(name = "employee_address", nullable = false)
    private String address;

    @Column(name = "employee_telephone")
    private String telephone;

    @Column(name = "employee_email", unique = true)
    private String email;

    @Column(name = "employee_salary")
    private BigDecimal salary;

    @Column(name = "employee_hiring_date")
    private String hiringDate;

    @Column(name = "employee_total_overtime")
    private int totalOvertime;

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "status_id", nullable = false)
    private Long statusId;

    @ManyToOne
    @JoinColumn(name = "position_id", referencedColumnName = "position_id", nullable = false)
    private Long positionId;

    @ManyToOne
    @JoinColumn(name = "department_id", referencedColumnName = "department_id", nullable = false)
    private Long departmentId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getCPF(){ return cpf; }
    public void setCPF(String cpf){ this.cpf = cpf; }

    public String getBirthday(){ return birthday; }
    public void setBirthday(String birthday){ this.birthday = birthday; }

    public String getAddress(){ return address; }
    public void setAddress(String address){ this.address = address; }

    public String getTelephone(){ return telephone; }
    public void setTelephone(String telephone){ this.telephone = telephone; }

    public String getEmail(){ return email; }
    public void setEmail(String email){ this.email = email; }

    public BigDecimal getSalary(){ return salary; }
    public void setSalary(BigDecimal salary){ this.salary = salary; }

    public String getHiringDate(){ return hiringDate; }
    public void setHiringDate(String hiringDate){ this.hiringDate = hiringDate; }

    public int getTotalOvertime(){ return totalOvertime; }
    public void setTotalOvertime(int totalOvertime){ this.totalOvertime = totalOvertime; }

    public Long getStatusId(){ return statusId; }
    public void setStatusId(Long statusId){ this.statusId = statusId; }

    public Long getPositionId(){ return positionId; }
    public void setPositionId(Long positionId){ this.positionId = positionId; }

    public Long getDepartmentId(){ return departmentId; }
    public void setDepartmentId(Long departmentId){ this.departmentId = departmentId; }


}
