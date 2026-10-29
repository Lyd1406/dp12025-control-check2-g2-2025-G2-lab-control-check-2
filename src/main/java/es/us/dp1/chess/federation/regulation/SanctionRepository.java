package es.us.dp1.chess.federation.regulation;

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;

public interface SanctionRepository extends CrudRepository<Sanction, Integer> {

    List<Sanction> findAll();

    Optional<Sanction> findById(Integer id);


}
