package dev.KH.Venti.Mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = {DepartmentMapper.class, PositionMapper.class, StatusMapper.class})
public interface EmployeeMapper{


}
