-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO authorities(id,authority) VALUES (1,'ADMIN');
INSERT INTO appusers(id,username,password,authority) VALUES (1,'admin1','$2a$10$nMmTWAhPTqXqLDJTag3prumFrAJpsYtroxf0ojesFYq0k4PmcbWUS',1);

-- Ten player users, named player1 with passwor 0wn3r
INSERT INTO authorities(id,authority) VALUES (2,'PLAYER');
INSERT INTO appusers(id,username,password,authority) VALUES (4,'player1','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (5,'player2','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (6,'player3','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (7,'player4','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (8,'player5','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (9,'player6','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (10,'player7','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (11,'player8','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (12,'player9','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);
INSERT INTO appusers(id,username,password,authority) VALUES (13,'player10','$2a$10$DaS6KIEfF5CRTFrxIoGc7emY3BpZZ0.fVjwA3NiJ.BjpGNmocaS3e',2);

-- =============================================================================
-- REGULATIONS
-- =============================================================================

INSERT INTO federation (id, name, acronym, description, foundational_date) VALUES
  (1, 'World Chess Federation', 'WCF', 'The international chess federation', '1924-07-20'),
  (2, 'European Chess Union', 'ECU', 'European governing chess body', '1985-07-18'),
  (3, 'Spanish Chess Federation', 'FEDA', 'Governing chess organization in Spain', '1927-10-14'),
  (4, 'French Chess Federation', 'FFE', 'National governing body for chess in France', '1933-03-19');

-- 1-14 , 15-29, 30-41, 42-49 rules for each federation
INSERT INTO rule (id, name, description, active, federation_id) VALUES
  (1, 'Use of Electronic Devices', 'Prohibited to use phones, tablets, or any electronic device during the game', true, 1),
  (2, 'Fair Play', 'Players must not cheat, manipulate results, or engage in any dishonest conduct', true, 1),
  (3, 'Respect for Opponents', 'Players must show respect and courtesy towards their opponents at all times', true, 1),
  (4, 'Arbiter Decisions', 'Players must accept arbiter decisions and may only appeal through formal channels', true, 1),
  (5, 'Equipment Handling', 'Players must not tamper with clocks or boards during the game', true, 1),
  (6, 'Result Reporting', 'Players are responsible for reporting the result correctly after game completion', true, 1),
  (7, 'Timekeeping Respect', 'Players must not distract opponents when making moves or pressing the clock', true, 1),
  (8, 'Prohibited Items', 'Bringing food, drinks, or other unauthorized items to the playing area is disallowed', true, 1),
  (9, 'Post-Game Conduct', 'Players should behave professionally after the game, regardless of outcome', true, 1),
  (10, 'Standard Rules', 'Chess played under classical time controls with official FIDE guidelines', true, 1),
  (11, 'Rapid Rules', 'Games played with a time control between 10 and 60 minutes per player', true, 1),
  (12, 'Blitz Rules', 'Fast-paced games with each player having less than 10 minutes', true, 1),
  (13, 'Player Move Completion', 'A move is considered complete only when the player releases the piece on a valid square', true, 1),
  (14, 'Touch Move', 'Player must move the piece they touch unless no legal move is possible', true, 1),

  (15, 'Silent Play', 'Talking or making noise that distracts opponents is forbidden during games', true, 2),
  (16, 'Time Delay Actions', 'Players must not deliberately delay the game to gain advantage', true, 2),
  (17, 'Prohibited Behavior', 'Aggressive or unsportsmanlike behavior can lead to penalties or disqualification', true, 2),
  (18, 'Spectator Interaction', 'Players must avoid discussing the game with spectators during play', true, 2),
  (19, 'Cheating Detection', 'Players are subject to anti-cheating measures including electronic scans', true, 2),
  (20, 'Dispute Resolution', 'Disputes must be reported immediately to the arbiter for resolution', true, 2),
  (21, 'Game Abandonment', 'Leaving the playing area without permission during the game is prohibited', true, 2),
  (22, 'Timekeeping Etiquette', 'Distracting opponents during their move or clock pressing is prohibited', true, 2),
  (23, 'Unauthorized Objects', 'No food, beverages, or unauthorized objects allowed in the playing area', true, 2),
  (24, 'Post-Game Behavior', 'Players are expected to maintain professionalism after completing their game', true, 2),
  (25, 'Standard Chess Regulations', 'Classical chess played according to internationally recognized FIDE standards', true, 2),
  (26, 'Rapid Chess Format', 'Matches played with time controls ranging from 10 up to 60 minutes per side', true, 2),
  (27, 'Blitz Chess Format', 'Games where each competitor has less than ten minutes on their clock', true, 2),
  (28, 'Move Finalization', 'Moves are finalized only once the piece is placed and released on a legal square', true, 2),
  (29, 'Obligatory Touch Move', 'The player is required to move the piece they have touched unless no legal move exists', true, 2),

  (30, 'Illegal Assistance', 'Accepting help from coaches or external sources during a game is forbidden', true, 3),
  (31, 'Appearance Standards', 'Players should adhere to dress codes or standards set by the event', true, 3),
  (32, 'Use of Notation', 'Players must record moves properly unless exempted by the time control', true, 3),
  (33, 'Withdrawal Rules', 'Players withdrawing from a tournament must notify organizers properly', true, 3),
  (34, 'Respecting Time Rules', 'It is forbidden to disturb opponents when they move or press the clock', true, 3),
  (35, 'Prohibited Personal Items', 'Players cannot bring snacks, drinks, or other unauthorized items to the game area', true, 3),
  (36, 'Professional Conduct After Game', 'Professional conduct is required from players after the conclusion of their games', true, 3),
  (37, 'Traditional Chess Guidelines', 'Games are played under traditional time controls following official FIDE regulations', true, 3),
  (38, 'Rapid Game Rules', 'Chess games with a time control that lasts between ten and sixty minutes per player', true, 3),
  (39, 'Blitz Game Rules', 'Each player has less than ten minutes to complete their moves in fast-paced play', true, 3),
  (40, 'Move Completion Rules', 'A move becomes official only after the piece is released on a valid destination square', true, 3),
  (41, 'Touch Move Obligation', 'Once a piece is touched, the player must move it if a legal move is available', true, 3),

  (42, 'Respect for Timekeeping', 'Players must not distract opponents when making moves or pressing the clock', true, 4),
  (43, 'Banned Items', 'Bringing food, drinks, or other unauthorized items to the playing area is disallowed', true, 4),
  (44, 'Conduct After Match', 'Players should behave professionally after the game, regardless of outcome', true, 4),
  (45, 'Classical Chess Rules', 'Chess played under classical time controls with official FIDE guidelines', true, 4),
  (46, 'Rapid Time Control', 'Games played with a time control between 10 and 60 minutes per player', true, 4),
  (47, 'Blitz Time Control', 'Fast-paced games with each player having less than 10 minutes', true, 4),
  (48, 'Completion of Moves', 'A move is considered complete only when the player releases the piece on a valid square', true, 4),
  (49, 'Mandatory Touch Move', 'Player must move the piece they touch unless no legal move is possible', true, 4);



INSERT INTO chess_event (id, name, date, category, federation_id) VALUES
  (1, 'World Chess Championship 2025', '2025-11-01', 'WORLD', 1),
  (2, 'European Rapid Championship 2025', '2025-08-15', 'REGIONAL', 2),
  (3, 'Spanish National Open 2025', '2025-06-20', 'NATIONAL', 3),
  (4, 'European Blitz Championship 2025', '2025-09-10', 'REGIONAL', 2),
  (5, 'Spanish Chess Junior Championship 2025', '2025-07-05', 'NATIONAL', 3),
  (6, 'European Chess Education Conference 2025', '2025-10-12', 'REGIONAL', 2),
  (7, 'Spanish Chess Training Seminar 2025', '2025-04-18', 'NATIONAL', 3),
  (8, 'European Coaching & Strategy Forum 2025', '2025-05-22', 'REGIONAL', 2),
  (9, 'Spanish Conference on Modern Chess Theory 2025', '2025-03-09', 'NATIONAL', 3),
  (10, 'European Youth Blitz Cup 2025', '2025-11-22', 'REGIONAL', 2),
  (11, 'European Senior Classic 2025', '2025-12-03', 'REGIONAL', 2),
  (12, 'European Team Rapid Challenge 2025', '2025-10-29', 'REGIONAL', 2),
  (13, 'European Invitational Masters 2025', '2025-09-27', 'REGIONAL', 2),
  (14, 'Spanish Rapid Teams Cup 2025', '2025-11-12', 'NATIONAL', 3),
  (15, 'Spanish Classical University Open 2025', '2025-10-06', 'NATIONAL', 3),
  (16, 'Spanish Autumn Blitz Festival 2025', '2025-12-18', 'NATIONAL', 3);

-- rules applied in events
INSERT INTO chess_event_applies (applies_id, chess_event_id) VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 1),
  (7, 1),
  (8, 1),
  (9, 1),
  (10, 1),
  (11, 1),
  (12, 1),
  (13, 1),
  (14, 1),

  (15, 2),
  (16, 2),
  (17, 2),
  (18, 2),
  (19, 2),
  (20, 2),
  (21, 2),
  (22, 2),
  (23, 2),
  (24, 2),
  (25, 2),
  (29, 2),

  (30, 3),
  (31, 3),
  (32, 3),
  (33, 3),
  (34, 3),
  (35, 3),
  (36, 3),
  (37, 3),
  (38, 3),
  (39, 3),
  (40, 3),
  (41, 3),

  (42, 4),
  (43, 4),
  (44, 4),
  (47, 4),
  (48, 4),
  (49, 4), 

  (15, 6),
  (16, 6),
  (17, 6),
  (18, 6),
  (19, 6),

  (20, 11),
  (21, 11),
  (22, 11), 

  (23, 12),
  (24, 12),
  (25, 12),
  (26, 12),
  (27, 12),
  (28, 12),

  (30, 15),
  (31, 15),
  (32, 15),
  (33, 15),
  (34, 15),
  (35, 15),
  (36, 15),
  (37, 15),
  (38, 15),
  (39, 15),
  (40, 15),
  (41, 15);


-- participants in events
INSERT INTO chess_event_participant (chess_event_id, participant_id) VALUES
  (1,4),(1,5),(1,6),(1,7),(1,9),(1,10),(1,11), 
  (2,6),(2,7),(2,8),(2,9),(2,10),(2,12),(2,13),
  (3,4),(3,6),(3,8),(3,9),(3,11),(3,13),
  (4,5),(4,6),(4,7),(4,10),(4,11),(4,12),(4,13),
  (5,4),(5,5),(5,8),(5,9),(5,10),
  (10,4),(10,6),(10,9),
  (11,5),(11,7),(11,8),(11,10),(11,13),
  (12,6),(12,11),
  (13,4),(13,5),(13,7),(13,9),(13,10),(13,12),
  (14,9),(14,13),
  (15,4),(15,6),
  (16,5),(16,9),(16,10);

----------------------------------------------------------------

INSERT INTO referee (id, name, license_number, certification_date, certified_by_id) VALUES
  (1, 'John Peterson', 'REF2025001', '2000-01-06', 2),
  (2, 'María González', 'REF2025002', '1998-12-14', 3);

INSERT INTO sanction (id, description, monetary_fine, type, imposed_by_id, imposed_on_id, rule_broken_id) VALUES
  (1, 'Unsportsmanlike conduct. Disrespect toward an opponent.', 500.0, 'EXPULSION', 2, 9, 36),
  (2, 'The player arrived late to the playing area.', NULL, 'WARNING', 1, 6, NULL);

INSERT INTO referee_assigned_to (referee_id, assigned_to_id) VALUES
  (1, 3), (1, 4), (1, 5), (1, 6),
  (2, 3), (2, 4), (2, 7);
