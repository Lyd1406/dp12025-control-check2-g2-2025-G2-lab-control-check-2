package es.us.dp1.chess.federation.regulation;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.us.dp1.chess.federation.user.User;

@Service
public class ChessEventService {

    ChessEventRepository chessEventRepository;

    @Autowired
    public ChessEventService(ChessEventRepository chessEventRepository) {
        this.chessEventRepository = chessEventRepository;
    }   

    @Transactional(readOnly = true)
    public List<ChessEvent> getAllChessEvents() {
        return chessEventRepository.findAll();
    }

    @Transactional(readOnly = true)
    public ChessEvent getChessEventById(Integer id) {
        return chessEventRepository.findById(id).orElse(null);
    }

    @Transactional
    public ChessEvent saveChessEvent(ChessEvent chessEvent) {
        return chessEventRepository.save(chessEvent);
    }

    @Transactional(readOnly = true)
    public List<ChessEvent> getChessEventsByFederation(Integer federationId) {
        return chessEventRepository.findAllByOrganizedById(federationId);
    }

    @Transactional(readOnly = true)
    public List<User> getParticipantsByEventId(Integer eventId) {
        return chessEventRepository.findParticipantsByEventId(eventId);
    }

    @Transactional(readOnly = true)
    public List<User> getUsersWithLowUpcomingParticipations(List<Federation> federations, LocalDate date,
            Integer numParticipations) {
        return chessEventRepository.findUsersWithLowUpcomingParticipations(federations, date, numParticipations);
    }
    
}
