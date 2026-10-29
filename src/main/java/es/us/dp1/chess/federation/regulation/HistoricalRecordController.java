package es.us.dp1.chess.federation.regulation;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import es.us.dp1.chess.federation.exceptions.ResourceNotFoundException;
import es.us.dp1.chess.federation.user.User;

@RestController
@RequestMapping("/api/v1/federation")
public class HistoricalRecordController {

    private final FederationService federationService;
    private final ChessEventService chessEventService;

    public HistoricalRecordController(FederationService federationService, ChessEventService chessEventService) {
        this.federationService = federationService;
        this.chessEventService = chessEventService;
    }

    @GetMapping("/{idFederation}/records")
    @Transactional(readOnly = true)
    public HistoricalRecord getRecords(@PathVariable Integer idFederation) {
        Federation federation = federationService.getFederationById(idFederation)
                .orElseThrow(() -> new ResourceNotFoundException("Federation", "id", idFederation));
        List<EventRecord> events = chessEventService.getChessEventsByFederation(idFederation).stream()
                .map(event -> new EventRecord(event.getName(),
                        chessEventService.getParticipantsByEventId(event.getId()).stream()
                                .map(User::getUsername).toList()))
                .toList();
        return new HistoricalRecord(federation.getName() + " - " + federation.getAcronym(), events);
    }

    public record HistoricalRecord(String federationData, List<EventRecord> events) {}

    public record EventRecord(String eventName, List<String> participants) {}
}
