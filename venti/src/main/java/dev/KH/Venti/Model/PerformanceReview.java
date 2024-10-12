package dev.KH.Venti.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "Venti_Performance_Review")
public class PerformanceReview{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "performance_review_id", nullable = false)
    private Long id;

    @Column(name = "performance_review_date")
    private String date;

    @Column(name = "performance_review_commentary")
    private String commentary;

    @ManyToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "employee_id", nullable = false)
    private Long employeeId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getDate(){ return date; }
    public void setDate(String date){ this.date = date; }

    public String getCommentary(){ return commentary; }
    public void setCommentary(String commentary){ this.commentary = commentary; }

    public Long getEmployeeId(){ return employeeId; }
    public void setEmployeeId(Long employeeId){ this.employeeId = employeeId; }

}
