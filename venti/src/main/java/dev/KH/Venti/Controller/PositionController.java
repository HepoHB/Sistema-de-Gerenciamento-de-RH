package dev.KH.Venti.Controller;

import dev.KH.Venti.DTO.PositionDTO;
import dev.KH.Venti.Service.Fetch.PositionServiceFetch;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("v1/positions")
@CrossOrigin(origins = "*")
public class PositionController{
    private final PositionServiceFetch positionServiceFetch;

    public PositionController(PositionServiceFetch positionServiceFetch){
        this.positionServiceFetch = positionServiceFetch;

    }

    @GetMapping("/{id}")
    public Optional<PositionDTO> findPositionById(@PathVariable Long id){
        return positionServiceFetch.fetchById(id);

    }

}
