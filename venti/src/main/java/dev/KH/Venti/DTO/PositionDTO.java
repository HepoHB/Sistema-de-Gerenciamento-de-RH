package dev.KH.Venti.DTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class PositionDTO{
    private Long id;

    @Size(min = 3, max = 45, message = "O nome do cargo deve ter entre 3 e 45 caracteres")
    @NotBlank(message = "O nome do cargo não pode estar em branco.")
    private String name;

    private String description;

    public Long getId(){ return id; }

    public String getName(){ return name; }
    public void setName(@NotBlank(message = "O nome do cargo não pode estar em branco.") String name){ this.name = name; }

    public String getDescription(){ return description; }
    public void setDescription(String description){ this.description = description; }


}
