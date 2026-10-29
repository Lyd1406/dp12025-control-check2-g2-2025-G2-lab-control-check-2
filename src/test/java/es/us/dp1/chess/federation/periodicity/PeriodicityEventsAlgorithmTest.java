package es.us.dp1.chess.federation.periodicity;

import java.time.LocalDate;

import es.us.dp1.chess.federation.regulation.ChessEvent;
import es.us.dp1.chess.federation.regulation.EventCategory;
import es.us.dp1.chess.federation.regulation.Federation;
import es.us.dp1.chess.federation.regulation.InvalidPeriodicityForANewChessEvent;
import es.us.dp1.chess.federation.regulation.periodicity.PeriodicityEventsAlgorithm;
import es.us.dp1.chess.federation.regulation.periodicity.ValidAlgorithm;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class PeriodicityEventsAlgorithmTest {

    // This is your SUT. You MUST NOT modify this line.
    PeriodicityEventsAlgorithm algorithm = new ValidAlgorithm();

    // Please specify as many tests as you need
    @Test
    public void rejectsEventsBelowMinimumPeriodicity() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 10), EventCategory.WORLD, 1);
        Assertions.assertThrows(InvalidPeriodicityForANewChessEvent.class,
                () -> algorithm.validatePeriodicityEvents(next, previous, 10));
    }

    @Test
    public void rejectsEventsExactlyAtMinimumPeriodicity() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 11), EventCategory.WORLD, 1);
        Assertions.assertThrows(InvalidPeriodicityForANewChessEvent.class,
                () -> algorithm.validatePeriodicityEvents(next, previous, 10));
    }

    @Test
    public void allowsEventsAboveMinimumAcrossMonthBoundary() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 25), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 2, 5), EventCategory.WORLD, 1);
        Assertions.assertDoesNotThrow(() -> algorithm.validatePeriodicityEvents(next, previous, 10));
    }

    @Test
    public void allowsDifferentCategoriesOnTheSameDay() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 1), EventCategory.NATIONAL, 1);
        Assertions.assertDoesNotThrow(() -> algorithm.validatePeriodicityEvents(next, previous, 10));
    }

    @Test
    public void allowsDifferentFederationsOnTheSameDay() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 2);
        Assertions.assertDoesNotThrow(() -> algorithm.validatePeriodicityEvents(next, previous, 10));
    }

    @Test
    public void rejectsSameCategoryAndFederationOnTheSameDay() {
        ChessEvent previous = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        Assertions.assertThrows(InvalidPeriodicityForANewChessEvent.class,
                () -> algorithm.validatePeriodicityEvents(next, previous, 0));
    }

    @Test
    public void allowsFirstEvent() {
        ChessEvent next = createEvent(LocalDate.of(2025, 1, 1), EventCategory.WORLD, 1);
        Assertions.assertDoesNotThrow(() -> algorithm.validatePeriodicityEvents(next, null, 10));
    }

    // This method should not be modified
    public void setAlgorithm(PeriodicityEventsAlgorithm algorithm) {
        this.algorithm = algorithm;
    }

    // We provide this method so that you can use it in your tests to create
    // ChessEvent instances easily.
    private ChessEvent createEvent(LocalDate date, EventCategory category, Integer federationId) {
        Federation f1 = new Federation();
        f1.setId(federationId);
        ChessEvent ev = new ChessEvent();
        ev.setDate(date);
        ev.setCategory(category);
        ev.setOrganizedBy(f1);
        return ev;
    }

}
