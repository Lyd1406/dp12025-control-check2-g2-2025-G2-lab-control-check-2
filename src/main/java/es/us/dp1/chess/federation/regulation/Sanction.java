package es.us.dp1.chess.federation.regulation;


import es.us.dp1.chess.federation.model.BaseEntity;
import es.us.dp1.chess.federation.user.User;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Sanction extends BaseEntity {

    @NotBlank
    @Size(min = 15, max = 70)
    String description;

    @Positive
    Double monetaryFine;

    @NotNull
    @Enumerated(EnumType.STRING)
    SanctionType type;

    @ManyToOne
    @NotNull
    Referee imposedBy;

    @ManyToOne
    @NotNull
    User imposedOn;

    @ManyToOne
    Rule ruleBroken;
    

}
