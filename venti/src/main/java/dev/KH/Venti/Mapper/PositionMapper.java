package dev.KH.Venti.Mapper;

import dev.KH.Venti.DTO.PositionDTO;
import dev.KH.Venti.Model.Position;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface PositionMapper{
    PositionDTO toDTO(Position position);

    Position toEntity(PositionDTO positionDTO);

}
