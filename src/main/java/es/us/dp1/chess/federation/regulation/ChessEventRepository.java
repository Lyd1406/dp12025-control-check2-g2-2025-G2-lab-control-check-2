package es.us.dp1.chess.federation.regulation;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import es.us.dp1.chess.federation.user.User;

public interface ChessEventRepository extends CrudRepository<ChessEvent, Integer> {

    List<ChessEvent> findAll();

    Optional<ChessEvent> findById(Integer id);
        
    @Query("SELECT ce.participant FROM ChessEvent ce WHERE ce.id = ?1")
    List<User> findParticipantsByEventId(Integer eventId);

    List<ChessEvent> findAllByOrganizedById(Integer federationId);

    @Query("SELECT u FROM ChessEvent ce JOIN ce.participant u "
            + "WHERE ce.organizedBy IN ?1 AND ce.date > ?2 "
            + "GROUP BY u HAVING COUNT(ce) < ?3")
    List<User> findUsersWithLowUpcomingParticipations(List<Federation> federations, LocalDate date, Integer numParticipations);

}
