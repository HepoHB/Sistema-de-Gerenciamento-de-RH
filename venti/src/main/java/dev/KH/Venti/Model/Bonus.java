package dev.KH.Venti.Model;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "Venti_Bonus")
public class Bonus{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "bonus_id", nullable = false)
    private Long id;

    @Column(name = "bonus_name", nullable = false)
    private String name;

    @Column(name = "bonus_value", nullable = false)
    private BigDecimal value;

    @Enumerated(EnumType.STRING)
    @Column(name = "bonus_type", nullable = false)
    private Bonus_DiscountType bonus_discountType;

    @OneToMany
    @JoinColumn(name = "payroll_id", referencedColumnName = "payroll_id", nullable = false)
    private Long payrollId;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public BigDecimal getValue(){ return value; }
    public void setValue(BigDecimal value){ this.value = value; }

    public Bonus_DiscountType getBonus_discountType(){ return bonus_discountType; }
    public void setBonus_discountType(Bonus_DiscountType bonus_discountType){ this.bonus_discountType = bonus_discountType; }

    public Long getPayrollId(){ return payrollId; }
    public void setPayrollId(Long payrollId){ this.payrollId = payrollId; }

}
