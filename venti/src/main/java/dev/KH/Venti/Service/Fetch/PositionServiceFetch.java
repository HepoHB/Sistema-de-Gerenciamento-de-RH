package dev.KH.Venti.Service.Fetch;

import dev.KH.Venti.DTO.PositionDTO;
import dev.KH.Venti.Mapper.PositionMapper;
import dev.KH.Venti.Repository.PositionRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PositionServiceFetch{
    private final PositionRepository positionRepository;
    private final PositionMapper positionMapper;

    public PositionServiceFetch(PositionRepository positionRepository, PositionMapper positionMapper){
        this.positionRepository = positionRepository;
        this.positionMapper = positionMapper;

    }

    public Optional<PositionDTO> fetchById(Long id){
        return positionRepository.findById(id).map(positionMapper::toDTO);

    }

}
