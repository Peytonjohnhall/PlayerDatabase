-- Author: Peyton J. Hall (C)
/*
Fantasy Football SQL Oracle Database.
Some data are outdated, hence, 'fantasy.'
Queries to filter out the database are below.
*/

CREATE TABLE Teams (
    Team_Name VARCHAR2(10) PRIMARY KEY,
    Team_Stadium_Name VARCHAR2(50) NOT NULL,
    Team_Stadium_DMS_Coordinates VARCHAR2(26) NOT NULL
);

CREATE TABLE Coaches (
    Coach_Name VARCHAR2(50) PRIMARY KEY,
    Coach_Team VARCHAR2(10) NOT NULL, -- Foreign key
    Coach_Age NUMBER(2) NOT NULL,
    Coach_Record VARCHAR2(20) NOT NULL,
    Coach_Super_Bowl_Wins NUMBER(2) NOT NULL,
    CONSTRAINT fk_Coach_Team
    	FOREIGN KEY (Coach_Team) REFERENCES Teams(Team_Name)
);

CREATE TABLE Players (
    Player_Fantasy_SQL_ID NUMBER(5) PRIMARY KEY,
    Player_Last_Name VARCHAR2(100) NOT NULL,
    Player_First_Name VARCHAR2(100) NOT NULL,
    Player_Jersey_Number NUMBER(3) NOT NULL,
    Player_Height VARCHAR2(6) NOT NULL,
    Player_Weight NUMBER(3) NOT NULL,
    Player_Age NUMBER(2) NOT NULL,
    Player_Team VARCHAR2(10) NOT NULL, -- Foreign key
    Player_College VARCHAR2(100) NOT NULL,
    Player_Position VARCHAR2(10) NOT NULL, 
    Player_Super_Bowl_Rings NUMBER(2) NOT NULL,
    Player_Injury_History VARCHAR2(100),
    Player_Nicknames VARCHAR2(100),
    Coach_Name VARCHAR2(50),
    CONSTRAINT fk_Player_Team
    	FOREIGN KEY (Player_Team) REFERENCES Teams(Team_Name),
    CONSTRAINT fk_Player_Coach
    	FOREIGN KEY (Coach_Name) REFERENCES Coaches(Coach_Name)
);

INSERT INTO Teams VALUES ('Ravens', 'M&T Bank Stadium', '39°16''41"N 76°37''22"W');
INSERT INTO Teams VALUES ('Bills', 'Highmark Stadium', '42°46''25"N 78°47''13"W');
INSERT INTO Teams VALUES ('Bengals', 'Paul Brown Stadium', '39°05''46"N 84°31''00"W');
INSERT INTO Teams VALUES ('Browns', 'Cleveland Municipal Stadium', '41°30''22"N 81°41''58"W');
INSERT INTO Teams VALUES ('Broncos', 'Empower Field at Mile High', '39°44''38"N 105°1''12"W');
INSERT INTO Teams VALUES ('Texans', 'NRG Stadium', '29°41''04"N 95°24''38"W');
INSERT INTO Teams VALUES ('Colts', 'Lucas Oil Stadium', '39°45''36"N 86°9''49"W');
INSERT INTO Teams VALUES ('Jaguars', 'EverBank Stadium', '30°19''26"N 81°38''15"W');
INSERT INTO Teams VALUES ('Chiefs', 'Arrowhead Stadium', '39°02''56"N 94°29''02"W');
INSERT INTO Teams VALUES ('Raiders', 'Allegiant Stadium', '36°05''27"N 115°10''59"W');
INSERT INTO Teams VALUES ('Chargers', 'SoFi Stadium', '33°57''12"N 118°20''20"W');
INSERT INTO Teams VALUES ('Dolphins', 'Hard Rock Stadium', '25°57''27"N 80°14''20"W');
INSERT INTO Teams VALUES ('Patriots', 'Gillette Stadium', '42°05''27"N 71°15''50"W');
INSERT INTO Teams VALUES ('Jets', 'MetLife Stadium', '40°48''48"N 74°04''27"W');
INSERT INTO Teams VALUES ('Steelers', 'Acrisure Stadium', '40°26''48"N 80°0''57"W');
INSERT INTO Teams VALUES ('Titans', 'Nissan Stadium', '36°9''59″N 86°46''17″W');
INSERT INTO Teams VALUES ('Cardinals', 'State Farm Stadium', '33°31''38"N 112°15''45"W');
INSERT INTO Teams VALUES ('Falcons', 'Mercedes-Benz Stadium', '33°45''20"N 84°24''00"W');
INSERT INTO Teams VALUES ('Panthers', 'Bank of America Stadium', '35°13''32"N 80°31''10"W');
INSERT INTO Teams VALUES ('Bears', 'Soldier Field', '41°51''44"N 87°37''00"W');
INSERT INTO Teams VALUES ('Cowboys', 'AT&T Stadium', '32°44''52"N 97°05''34"W');
INSERT INTO Teams VALUES ('Lions', 'Ford Field', '42°20''24"N 83°2''44"W');
INSERT INTO Teams VALUES ('Packers', 'Lambeau Field', '44°30''04"N 88°03''43"W');
INSERT INTO Teams VALUES ('Rams', 'SoFi Stadium', '33°57''12"N 118°20''20"W');
INSERT INTO Teams VALUES ('Vikings', 'U.S. Bank Stadium', '44°58''25"N 93°15''26"W');
INSERT INTO Teams VALUES ('Saints', 'Caesars Superdome', '29°57''3"N 90°4''52"W');
INSERT INTO Teams VALUES ('Giants', 'Giants Stadium', '40°48''48"N 74°04''27"W');
INSERT INTO Teams VALUES ('Eagles', 'Lincoln Financial Field', '39°54''02"N 75°10''02"W');
INSERT INTO Teams VALUES ('49ers', 'Levi''s Stadium', '37°24''11"N 121°58''11"W');
INSERT INTO Teams VALUES ('Seahawks', 'Lumen Field', '47°35''42"N 122°19''53"W');
INSERT INTO Teams VALUES ('Buccaneers', 'Raymond James Stadium', '27°58''33"N 82°30''12"W');
INSERT INTO Teams VALUES ('Redskins', 'FedExField', '38°54''28"N 76°51''52"W');

-- Let’s see what we inserted:
SELECT * FROM Teams;

INSERT INTO Coaches VALUES ('John Harbaugh', 'Ravens', '60', '158–104', '1');
INSERT INTO Coaches VALUES ('Sean McDermott', 'Bills', '49', '66–41', '0');
INSERT INTO Coaches VALUES ('Zac Taylor', 'Bengals', '40', '33–38–1', '0');
INSERT INTO Coaches VALUES ('Kevin Stefanski', 'Browns', '41', '28–25', '0');
INSERT INTO Coaches VALUES ('Sean Payton', 'Broncos', '59', '161–97', '1');
INSERT INTO Coaches VALUES ('DeMeco Ryans', 'Texans', '39', '0–1', '0');
INSERT INTO Coaches VALUES ('Shane Steichen', 'Colts', '38', '0–1', '0');
INSERT INTO Coaches VALUES ('Doug Pederson', 'Jaguars', '55', '56–48–1', '1');
INSERT INTO Coaches VALUES ('Andy Reid', 'Chiefs', '65', '269–155–1', '2');
INSERT INTO Coaches VALUES ('Josh McDaniels', 'Raiders', '47', '18–28', '6');
INSERT INTO Coaches VALUES ('Brandon Staley', 'Chargers', '40', '19–17', '0');
INSERT INTO Coaches VALUES ('Mike McDaniel', 'Dolphins', '40', '10–9', '0');
INSERT INTO Coaches VALUES ('Bill Belichick', 'Patriots', '71', '329–165', '8');
INSERT INTO Coaches VALUES ('Robert Saleh', 'Jets', '44', '12–23', '1');
INSERT INTO Coaches VALUES ('Mike Tomlin', 'Steelers', '51', '171–102–2', '1');
INSERT INTO Coaches VALUES ('Mike Vrabel', 'Titans', '48', '50–37', '0');
INSERT INTO Coaches VALUES ('Jonathan Gannon', 'Cardinals', '40', '0–1', '0');
INSERT INTO Coaches VALUES ('Arthur Smith', 'Falcons', '41', '15–20', '0');
INSERT INTO Coaches VALUES ('Frank Reich', 'Panthers', '61', '41–35–1', '2');
INSERT INTO Coaches VALUES ('Matt Eberflus', 'Bears', '53', '3–15', '0');
INSERT INTO Coaches VALUES ('Mike McCarthy', 'Cowboys', '59', '166–107–2', '1');
INSERT INTO Coaches VALUES ('Dan Campbell', 'Lions', '47', '18–28–1', '0');
INSERT INTO Coaches VALUES ('Matt LaFleur', 'Packers', '43', '50–22', '0');
INSERT INTO Coaches VALUES ('Sean McVay', 'Rams', '37', '67–41', '1');
INSERT INTO Coaches VALUES ('Kevin O’Connell', 'Vikings', '38', '13–6', '1');
INSERT INTO Coaches VALUES ('Dennis Allen', 'Saints', '50', '16–38', '1');
INSERT INTO Coaches VALUES ('Brian Daboll', 'Giants', '38', '10–9–1', '5');
INSERT INTO Coaches VALUES ('Nick Sirianni', 'Eagles', '42', '26–13', '0');
INSERT INTO Coaches VALUES ('Kyle Shanahan', '49ers', '43', '59–49', '0');
INSERT INTO Coaches VALUES ('Pete Carroll', 'Seahawks', '71', '172–123–1', '1');
INSERT INTO Coaches VALUES ('Todd Bowles', 'Buccaneers', '59', '35–51', '1');
INSERT INTO Coaches VALUES ('Ron Rivera', 'Redskins', '61', '102–95–2', '0');

-- Let’s see what we inserted:
SELECT * FROM Coaches;

INSERT INTO Players VALUES ('1', 'Thielen', 'Adam', 19, '6''1"', 201, 33, 'Vikings', 'Mankato State', 'WR', 0, 'Ankle', NULL, 'Kevin O’Connell');
INSERT INTO Players VALUES ('2', 'Sherman', 'Richard', 25, '6''3"', 205, 35, 'Seahawks', 'Stanford', 'DB', 1, 'Achilles', NULL, 'Pete Carroll');
INSERT INTO Players VALUES ('3', 'Mahomes', 'Patrick', 15, '6''2"', 225, 27, 'Chiefs', 'Texas Tech', 'QB', 2, 'Ankle', NULL, 'Andy Reid');
INSERT INTO Players VALUES ('4', 'Brady', 'Tom', 12, '6''4"', 225, 46, 'Patriots', 'Michigan State', 'QB', 7, NULL, 'GOAT', 'Bill Belichick');
INSERT INTO Players VALUES ('5', 'Hill', 'Tyreek', 10, '5''10"', 185, 29, 'Chiefs', 'Oklahoma State', 'WR', 1, 'Ankle', 'Cheetah', 'Andy Reid');
INSERT INTO Players VALUES ('6', 'Lewis', 'Ray', 52, '6''1"', 250, 48, 'Ravens', 'Miami', 'MLB', 2, 'Torn tricep', NULL, 'John Harbaugh');
INSERT INTO Players VALUES ('7', 'Butler', 'Mario', 39, '6''1"', 184, 34, 'Bills', 'Georgia Tech', 'DB', 0, 'Ankle', NULL, 'Sean McDermott');
INSERT INTO Players VALUES ('8', 'Taylor', 'Lawrence', 56, '6''3"', 240, 64, 'Giants', 'North Carolina', 'OLB', 1, NULL, 'L.T.', 'Brian Daboll');
INSERT INTO Players VALUES ('9', 'Lynch', 'Marshawn', 24, '5''11"', 215, 37, 'Seahawks', 'California, Berkeley', 'FB', 1, NULL, 'Beast Mode', 'Pete Carroll');
INSERT INTO Players VALUES ('10', 'Peterson', 'Adrian', 28, '6''1"', 217, 38, 'Vikings', 'Oklahoma', 'HB', 0, 'Torn meniscus', 'All Day', 'Kevin O’Connell');
INSERT INTO Players VALUES ('11', 'Adams', 'Davante', 17, '6''1"', 216, 30, 'Raiders', 'Fresno State', 'WR', 0, 'Concussion', 'The Adams Express', 'Josh McDaniels');
INSERT INTO Players VALUES ('12', 'Buckner', 'DeForest', 99, '6''7"', 295, 29, 'Colts', 'Oregon', 'DT', 0, 'Ribs', 'DeFo', 'Shane Steichen');
INSERT INTO Players VALUES ('13', 'Hopkins', 'DeAndre', 10, '6''1"', 212, 31, 'Texans', 'Clemson', 'WR', 0, 'Torn MCL', 'Nuk', 'DeMeco Ryans');
INSERT INTO Players VALUES ('14', 'Donald', 'Aaron', 99, '6''1"', 284, 32, 'Rams', 'Pittsburgh', 'DT', 1, 'Knee', NULL, 'Sean McVay');
INSERT INTO Players VALUES ('15', 'Fleck', 'Phillip', 10, '5''10"', 191, 42, '49ers', 'Northern Illinois', 'WR', 0, NULL, 'P.J. Fleck', 'Kyle Shanahan');
INSERT INTO Players VALUES ('16', 'McCaffrey', 'Christian', 23, '5''11"', 209, 27, '49ers', 'Stanford', 'HB', 0, 'Strained hamstring', 'Run CMC', 'Kyle Shanahan');
INSERT INTO Players VALUES ('17', 'Benford', 'Christian', 47, '6''1"', 205, 22, 'Bills', 'Villanova', 'DB', 0, 'Fractured Hand', NULL, 'Sean McDermott');
INSERT INTO Players VALUES ('18', 'Rodgers', 'Aaron', 12, '6''2"', 225, 39, 'Packers', 'California, Berkeley', 'QB', 0, 'Torn achillies tendon', 'A-Rod', 'Matt LaFleur');
INSERT INTO Players VALUES ('19', 'Patterson', 'Cordarrelle', 84, '6''2"', 220, 32, 'Vikings', 'Tennessee', 'HB', 1, 'Thigh', NULL, 'Kevin O’Connell');
INSERT INTO Players VALUES ('20', 'Jefferson', 'Justin', 18, '6''1"', 203, 24, 'Vikings', 'LSU', 'WR', 0, 'Ankle', 'Jets', 'Kevin O’Connell');
INSERT INTO Players VALUES ('21', 'Winfield Jr.', 'Antoine', 31, '5''9"', 203, 25, 'Buccaneers', 'Minnesota', 'FS', 1, 'Concussion', NULL, 'Todd Bowles');
INSERT INTO Players VALUES ('22', 'Warner', 'Fred', 54, '6''3"', 229, 26, '49ers', 'BYU', 'MLB', 0, NULL, NULL, 'Kyle Shanahan');
INSERT INTO Players VALUES ('23', 'Charles', 'Jamaal', 25, '5''11"', 199, 36, 'Chiefs', 'Texas', 'HB', 0, 'Torn ACL', NULL, 'Andy Reid');
INSERT INTO Players VALUES ('24', 'Scherff', 'Brandon', 68, '6''5"', 319, 31, 'Jaguars', 'Iowa', 'OG', 0, 'Ankle', 'Paul Bunyan', 'Doug Pederson');
INSERT INTO Players VALUES ('25', 'Prescott', 'Dak', 4, '6''2"', 229, 30, 'Cowboys', 'Mississippi State', 'QB', 0, 'Ankle', NULL, 'Mike McCarthy');
INSERT INTO Players VALUES ('26', 'Ford-Wheaton', 'Bryce', 6, '6''4"', 225, 23, 'Giants', 'West Virginia', 'WR', 0, 'Torn ACL', NULL, 'Brian Daboll');
INSERT INTO Players VALUES ('27', 'Metcalf', 'DK', 14, '6''4"', 236, 25, 'Seahawks', 'Mississippi', 'WR', 0, 'Patellar', 'Wolverine', 'Pete Carroll');
INSERT INTO Players VALUES ('28', 'Facyson', 'Brandon', 35, '6''2"', 187, 29, 'Raiders', 'Virginia Tech', 'DB', 0, 'Concussion', NULL, 'Josh McDaniels');
INSERT INTO Players VALUES ('29', 'Swift', 'D''Andre', 32, '5''9"', 216, 24, 'Eagles', 'Georgia', 'HB', 0, NULL, NULL, 'Nick Sirianni');
INSERT INTO Players VALUES ('30', 'Flannigan-Fowles', 'Demetrius', 45, '6''2"', 223, 27, '49ers', 'Arizona', 'MLB', 0, 'Knee', NULL, 'Kyle Shanahan');
INSERT INTO Players VALUES ('31', 'Forrest Jr.', 'Darrick', 22, '5''11"', 200, 24, 'Redskins', 'Cincinnati', 'FS', 0, NULL, NULL, 'Ron Rivera');
INSERT INTO Players VALUES ('32', 'Mathieu', 'Tyrann', 32, '5''9"', 190, 31, 'Chiefs', 'LSU', 'SS, FS', 1, 'Torn ACL, Torn LCL', 'Honey Badger', 'Andy Reid');
INSERT INTO Players VALUES ('33', 'Henry Jr.', 'Derrick', 22, '6''3"', 247, 29, 'Titans', 'Alabama', 'HB, FB', 0, 'Hip', 'King Henry', 'Mike Vrabel');
INSERT INTO Players VALUES ('34', 'Johnson', 'Calvin', 81, '6''5"', 281, 37, 'Lions', 'Georgia Tech', 'WR', 0, 'Knee, ankle, finger', 'Megatron', 'Dan Campbell');
INSERT INTO Players VALUES ('35', '"Deebo" Samuel', 'Tyshun', 19, '6''0"', 216, 27, '49ers', 'South Carolina', 'WR', 0, 'MCL sprain, Ankle sprain', NULL, 'Kyle Shanahan');
INSERT INTO Players VALUES ('36', 'Newton', 'Cameron', 1, '6''5"', 245, 34, 'Panthers', 'Auburn', 'QB', 0, 'Fractured rib', 'Super Cam', 'Frank Reich');
INSERT INTO Players VALUES ('37', 'Allen', 'Josh', 17, '6''5"', 238, 27, 'Bills', 'Wyoming', 'QB', 0, 'Torn ulnar collateral ligament', 'The Alien', 'Sean McDermott');
INSERT INTO Players VALUES ('38', 'Stephens', 'Timothy Brandon', 21, '6''1"', 216, 25, 'Ravens', 'UCLA', 'HB', 0, NULL, NULL, 'John Harbaugh');
INSERT INTO Players VALUES ('39', 'Beckham Jr.', 'Odell', 13, '5''11"', 198, 30, 'Giants', 'LSU', 'WR', 1, 'Dislacated finger, Torn ACL', 'OBJ', 'Brian Daboll');
INSERT INTO Players VALUES ('40', 'Fitzgerald Jr.', 'Larry', 11, '6''3"', 218, 40, 'Cardinals', 'Pittsburgh', 'WR', 0, 'MCL sprain', 'Fitz, Sticky Fingers', 'Jonathan Gannon');
INSERT INTO Players VALUES ('41', 'Thomas', 'Andrew', 78, '6''5"', 315, 24, 'Giants', 'Georgia', 'OT', 0, 'Torn hamstring', NULL, 'Brian Daboll');
INSERT INTO Players VALUES ('42', 'Adebawore', 'Adetomiwa', 95, '6''2"', 282, 22, 'Colts', 'Northwestern', 'DT', 0, NULL, NULL, 'Shane Steichen');
INSERT INTO Players VALUES ('43', 'Williams', 'Quinnen', 95, '6''3"', 303, 25, 'Jets', 'Alabama', 'DT', 0, NULL, NULL, 'Robert Saleh');
INSERT INTO Players VALUES ('44', 'Stephenson', 'Dwight', 57, '6''2"', 225, 65, 'Dolphins', 'Alabama', 'C', 0, NULL, NULL, 'Mike McDaniel');
INSERT INTO Players VALUES ('45', 'Anderson Jr.', 'Abdullah', 65, '6''4"', 297, 27, 'Falcons', 'Bucknell', 'DT', 1, NULL, NULL, 'Arthur Smith');
INSERT INTO Players VALUES ('46', 'James Jr.', 'Derwin', 33, '6''2"', 216, 27, 'Chargers', 'Florida State', 'SS', 0, 'Torn left lateral meniscus', 'Pooh Bear', 'Brandon Staley');
INSERT INTO Players VALUES ('47', 'Fitzpatrick Jr.', 'Minkah', 39, '6''1"', 207, 26, 'Steelers', 'Alabama', 'FS', 0, 'Kidney injury', 'FitzMagic', 'Mike Tomlin');
INSERT INTO Players VALUES ('48', 'Heyward', 'Cameron', 97, '6''5"', 288, 34, 'Steelers', 'Ohio State', 'DT', 0, 'Groin injury', NULL, 'Mike Tomlin'); 
INSERT INTO Players VALUES ('49', 'Roethlisberger Sr.', 'Ben', 7, '6''5"', 241, 41, 'Steelers', 'Miami', 'QB', 0, 'Dislocated rib', 'Big Ben', 'Mike Tomlin');
INSERT INTO Players VALUES ('50', 'Forbes', 'Andrew', 79, '6''5"', 305, 26, 'Browns', 'Southeast Missouri State', 'T', 0, 'Back', NULL, 'Kevin Stefanski');
INSERT INTO Players VALUES ('51', 'Manning', 'Peyton', 18, '6''5"', 230, 47, 'Broncos', 'Tennessee', 'QB', 2, 'Neck', 'The Sheriff', 'Sean Payton');
INSERT INTO Players VALUES ('52', 'Burrow', 'Joe', 9, '6''4"', 215, 26, 'Bengals', 'Ohio State, LSU', 'QB', 0, 'Strained right calf', 'Joe Cool', 'Zac Taylor');
INSERT INTO Players VALUES ('53', 'Kupp', 'Cooper', 10, '6''2"', 194, 30, 'Rams', 'Eastern Washington', 'WR', 1, 'Hamstring', 'Kuppdog', 'Sean McVay');
INSERT INTO Players VALUES ('54', 'Alford', 'DeAundre "Dee"', 20, '5''11"', 175, 25, 'Falcons', 'Tusculum', 'DB', 0, 'Hamstring', 'Dee', 'Arthur Smith');
INSERT INTO Players VALUES ('55', 'Johnson', 'Juwan', 83, '6''4"', 231, 27, 'Saints', 'Penn State, Oregon', 'TE', 0, 'Quadraceps', NULL, 'Dennis Allen');
INSERT INTO Players VALUES ('56', 'Brown Sr.', 'Arthur Juan "A.J."', 20, '6''1"', 226, 26, 'Titans', 'Ole Miss', 'WR', 0, 'Knees', 'The Show', 'Mike Vrabel');
INSERT INTO Players VALUES ('57', 'Fields', 'Justin', 1, '6''3"', 227, 24, 'Bears', 'Ohio State', 'QB', 0, 'Partially torn shoulder ligaments', 'The Sally Fields', 'Matt Eberflus');
INSERT INTO Players VALUES ('58', 'Lindstrom', 'Christopher', 63, '6''4"', 306, 26, 'Falcons', 'Boston', 'OG', 0, 'Broken foot', NULL, 'Arthur Smith');
INSERT INTO Players VALUES ('59', 'Fitzpatrick', 'Desmond Emil "Dez"', 82, '6''2"', 208, 82, 'Steelers', 'Louisville', 'WR', 0, NULL, 'DEZ', 'Mike Tomlin');
INSERT INTO Players VALUES ('60', 'Mayfield', 'Baker', 6, '6''1"', 215, 28, 'Buccaneers', 'Texas Tech', 'QB', 0, 'Right shoulder', 'Record Baker', 'Todd Bowles');
INSERT INTO Players VALUES ('61', 'Armstead', 'Arik', 9, '6''7"', 280, 29, '49ers', 'Oregon', 'DE', 1, 'Torn left shoulder labrum', NULL, 'Kyle Shanahan');
INSERT INTO Players VALUES ('62', 'Lurtsema', 'Bob', 75, '6''6"', 250, 81, 'Vikings', 'Western Michigan', 'DE, DT', 0, NULL, 'Benchwarmer Bob', 'Kevin O’Connell');
INSERT INTO Players VALUES ('63', 'Freeland', 'Blake', 73, '6''8"', 302, 22, 'Colts', 'BYU', 'OT', 0, NULL, NULL, 'Shane Steichen');
INSERT INTO Players VALUES ('64', 'Fehoko', 'Breiden', 96, '6''3"', 295, 26, 'Steelers', 'LSU', 'NG', 0, NULL, NULL, 'Mike Tomlin');
INSERT INTO Players VALUES ('65', 'Thompson-Robinson', 'Dorian', 17, '6''2"', 203, 23, 'Browns', 'UCLA', 'QB', 0, NULL, 'DTR', 'Kevin Stefanski');
INSERT INTO Players VALUES ('66', 'Fowler Jr.', 'Dante', 56, '6''3"', 255, 29, 'Cowboys', 'Florida', 'DE', 0, 'Torn ACL', 'Man Child', 'Mike McCarthy');
INSERT INTO Players VALUES ('67', 'Flott', 'Cordale', 28, '6''1"', 174, 22, 'Giants', 'LSU', 'DB', 0, 'Calf', NULL, 'Brian Daboll');
INSERT INTO Players VALUES ('68', 'Felton, Jr.', 'Demetric', 25, '5''9"', 190, 25, 'Browns', 'UCLA', 'HB', 0, NULL, NULL, 'Kevin Stefanski');
INSERT INTO Players VALUES ('69', 'Fountain', 'Daurice', 82, '6''2"', 209, 27, 'Chiefs', 'Northern Iowa', 'WR', 0, 'Broken and dislocated left ankle', NULL, 'Andy Reid');
INSERT INTO Players VALUES ('70', 'Reed', 'Ed', 20, '5''11"', 205, 45, 'Ravens', 'Miami', 'SS, FS', 1, 'Torn labrum', 'Ball Hawk', 'John Harbaugh');
INSERT INTO Players VALUES ('71', 'McFarland Jr.', 'Anthony', 26, '5''8"', 194, 25, 'Steelers', 'Maryland', 'HB', 0, 'Torn MCL', NULL, 'Mike Tomlin');
INSERT INTO Players VALUES ('72', 'Gutiérrez', 'Alfredo', 77, '6''9"', 333, 27, '49ers', 'ITESM', 'OT', 0, NULL, NULL, 'Kyle Shanahan');
INSERT INTO Players VALUES ('73', 'Foreman', 'D''Onta', 21, '6''0"', 236, 27, 'Bears', 'Texas', 'HB, FB', 0, 'Ribs', NULL, 'Matt Eberflus');
INSERT INTO Players VALUES ('74', 'Diggs', 'Stefon', 14, '6''0"', 194, 29, 'Bills', 'Maryland', 'WR', 0, 'Oblique', NULL, 'Sean McDermott');
INSERT INTO Players VALUES ('75', 'Flowers', 'Dallis', 33, '6''1"', 196, 26, 'Colts', 'Grand View, Pittsburg State', 'DB', 0, NULL, NULL, 'Shane Steichen');
INSERT INTO Players VALUES ('76', 'Campbell', 'De''Vondre', 59, '6''4"', 232, 30, 'Packers', 'Minnesota', 'OLB', 0, 'Ankle', NULL, 'Matt LaFleur');

-- Let’s see what we inserted:
SELECT * FROM Players;

-- Which players went to UCLA?
SELECT Player_College AS "College", Player_First_Name AS "First Name", Player_Last_Name AS "Last Name"
FROM Players 
WHERE Player_College = 'UCLA';

-- Mario Butler just got cut from the Bills. He is now a free agent. How do we remove him from the database?
DELETE FROM Players 
WHERE Player_Last_Name = 'Butler';

-- The Chiefs are playing the Vikings. The doctor wants to see Chiefs and Vikings players' injury reports ASAP. What is the alphabetical order for Last Names?
SELECT Player_First_Name AS "First Name", Player_Last_Name AS "Last Name", Player_Injury_History AS "Injuries"
FROM Players
WHERE Player_Team IN ('Chiefs', 'Vikings')
ORDER BY Player_Last_Name ASC;

-- Out of curiosity, let's see descending alphabetical order of last names:
SELECT Player_First_Name AS "First Name", Player_Last_Name AS "Last Name" -- Note: SELECT statement orders rows.
FROM Players
ORDER BY Player_Last_Name DESC, Player_First_Name; -- Note: ORDER BY keyword orders columns.

-- What home stadium does each coach coach at? Include coordinates:
SELECT C.Coach_Name AS "Coach Name", T.Team_Name AS "Team", T.Team_Stadium_Name AS "Home Stadium", T.Team_Stadium_DMS_Coordinates AS "Location"
FROM Coaches C
JOIN Teams T ON C.Coach_Team = T.Team_Name;

-- Which Kansas City Chiefs players has Peyton collected for his fantasy team?
SELECT Player_First_Name AS "First Name", Player_Last_Name AS "Last Name", Player_Position AS "Position",
	Player_Jersey_Number AS "Jersey Number", Player_College AS "College", Player_Age AS "Age"
FROM Players 
WHERE Player_Team = 'Chiefs';

-- Which players stand between 6'4" and 7'0" (inclusive)?
SELECT Player_Height AS "Height", Player_First_Name AS "First Name", Player_Last_Name AS "Last Name"
FROM Players 
WHERE Player_Height 
BETWEEN '6''4"' AND '7''0"';

-- How many players for the Giants have a height above 6'0", a weight above 200, and an age of less than 30?
SELECT Player_First_Name AS "First Name", Player_Last_Name AS "Last Name", Player_Height AS "Height", Player_Weight AS "Weight", 
    Player_Jersey_Number AS "Jersey Number", Player_Team AS "Team", Player_Position AS "Position"
FROM Players
WHERE Player_Team = 'Giants' 
	AND Player_Height > '6''0"' 
	AND Player_Weight > 200 
	AND Player_Age < 30;
   
-- In case I need to make changes, how do I drop one table at a time?
DROP TABLE Teams;
DROP TABLE Coaches;
DROP TABLE Players;