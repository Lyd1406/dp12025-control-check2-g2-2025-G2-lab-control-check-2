package es.us.dp1.chess.federation.regulation;

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;

public interface RefereeRepository extends CrudRepository<Referee, Integer> {

    List<Referee> findAll();

    Optional<Referee> findById(Integer id);

}
