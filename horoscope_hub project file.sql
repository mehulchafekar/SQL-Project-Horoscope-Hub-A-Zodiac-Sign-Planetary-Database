CREATE DATABASE Horoscope_HubDB;
USE Horoscope_HubDB;
DROP DATABASE Horoscope_HubDB;

DROP TABLE IF EXISTS birth_chart;
DROP TABLE IF EXISTS horoscope;
DROP TABLE IF EXISTS planet;
DROP TABLE IF EXISTS planetary_position;
DROP TABLE IF EXISTS zodiac_sign;

-- Table for Zodiac Signs --
CREATE TABLE Zodiac_Sign (
    sign_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    element VARCHAR(10),
    modality VARCHAR(10),
    ruling_planet VARCHAR(20)
);

DESCRIBE Zodiac_sign;

-- Table for Planets --
CREATE TABLE Planet (
    planet_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    type VARCHAR(20),
    ruling_sign_id INT,
    FOREIGN KEY (ruling_sign_id) REFERENCES Zodiac_Sign(sign_id)
);

DESCRIBE planet;

-- Table for Planetary Positions --
CREATE TABLE Planetary_Position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    planet_id INT,
    zodiac_sign_id INT,
    degree DECIMAL(5,2),
    retrograde BOOLEAN,
    FOREIGN KEY (planet_id) REFERENCES Planet(planet_id),
    FOREIGN KEY (zodiac_sign_id) REFERENCES Zodiac_Sign(sign_id)
);

DESCRIBE planetary_position;

-- Table for Birth Charts --
CREATE TABLE Birth_Chart (
    chart_id INT PRIMARY KEY AUTO_INCREMENT,
    birthdate DATE NOT NULL,
    birthplace VARCHAR(100),
    sun_sign_id INT,
    moon_sign_id INT,
    ascendant_sign_id INT,
    FOREIGN KEY (sun_sign_id) REFERENCES Zodiac_Sign(sign_id),
    FOREIGN KEY (moon_sign_id) REFERENCES Zodiac_Sign(sign_id),
    FOREIGN KEY (ascendant_sign_id) REFERENCES Zodiac_Sign(sign_id)
);

DESCRIBE Birth_chart;

-- Table for Horoscope --
CREATE TABLE Horoscope (
    horoscope_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    zodiac_sign_id INT,
    prediction TEXT,
    category VARCHAR(20),
    FOREIGN KEY (zodiac_sign_id) REFERENCES Zodiac_Sign(sign_id)
);

DESCRIBE Horoscope;

SHOW TABLES;

-- Insert value for  Zodiac_Signs --
INSERT INTO Zodiac_Sign (name, start_date, end_date, element, modality, ruling_planet)
VALUES              --   sign_id is in  AUTO_INCREMENT
('Aries', '2023-03-21', '2023-04-19', 'Fire', 'Cardinal', 'Mars'),
('Taurus', '2023-04-20', '2023-05-20', 'Earth', 'Fixed', 'Venus'),
('Gemini', '2023-05-21', '2023-06-20', 'Air', 'Mutable', 'Mercury'),
('Cancer', '2023-06-21', '2023-07-22', 'Water', 'Cardinal', 'Moon'),
('Leo', '2023-07-23', '2023-08-22', 'Fire', 'Fixed', 'Sun'),
('Virgo', '2023-08-23', '2023-09-22', 'Earth', 'Mutable', 'Mercury'),
('Libra', '2023-09-23', '2023-10-22', 'Air', 'Cardinal', 'Venus'),
('Scorpio', '2023-10-23', '2023-11-21', 'Water', 'Fixed', 'Pluto'),
('Sagittarius', '2023-11-22', '2023-12-21', 'Fire', 'Mutable', 'Jupiter'),
('Capricorn', '2023-12-22', '2024-01-19', 'Earth', 'Cardinal', 'Saturn'),
('Aquarius', '2023-01-20', '2023-02-18', 'Air', 'Fixed', 'Uranus'),
('Pisces', '2023-02-19', '2023-03-20', 'Water', 'Mutable', 'Neptune');


-- Insert value for Planets --
INSERT INTO Planet (name, type, ruling_sign_id)
VALUES
    ('Mars', 'Inner Planet', 1),
    ('Venus', 'Inner Planet', 2),
    ('Mercury', 'Inner Planet', 3),
    ('Moon', 'Celestial Body', 4),
    ('Sun', 'Outer Planet', 5), 
    ('Pluto', 'Outer Planet', 8),
    ('Jupiter', 'Outer Planet', 9),
    ('Saturn', 'Outer Planet', 10),
    ('Uranus', 'Outer Planet', 11),
    ('Neptune', 'Outer Planet', 12),
    ('Earth', 'Inner Planet', NULL);
    
    
 -- Insert data for Planetary Positions --
INSERT INTO Planetary_Position (date, planet_id, zodiac_sign_id, degree, retrograde)
VALUES
('2023-03-01', 1, 1, 15.2, FALSE),  -- Mars in Aries at 15.2 degrees, not retrograde
('2023-04-10', 2, 2, 22.7, FALSE),  -- Venus in Taurus at 22.7 degrees, not retrograde
('2023-05-15', 3, 3, 10.4, FALSE),  -- Mercury in Gemini at 10.4 degrees, not retrograde
('2023-06-20', 4, 4, 18.6, TRUE),   -- Moon in Cancer at 18.6 degrees, retrograde
('2023-07-12', 5, 5, 27.1, FALSE),  -- Sun in Leo at 27.1 degrees, not retrograde
('2023-08-25', 6, 8, 13.5, TRUE),  --  Pluto in Scorpio at 13.5 degrees, retrograde
('2023-09-30', 7, 9, 5.9, FALSE),  -- Jupiter in Sagittarius  at 5.9 degrees, not retrograde
('2023-10-10', 8, 10, 9.3, TRUE),   -- Saturn in Capricorn at 9.3 degrees, retrograde
('2023-11-15', 9, 11, 21.4, FALSE),  -- Uranus in Acquarius at 21.4 degrees, not retrograde
('2023-12-05', 10, 12, 2.1, FALSE), -- Neptune in Pisces at 2.1 degrees, not retrograde
('2023-12-15', 11, 5, 17.8, FALSE); -- Earth in Leo at 17.8 degrees, not retrograde



-- Insert Birth Chart Data with Birthplaces --
INSERT INTO Birth_Chart (birthdate, birthplace, sun_sign_id, moon_sign_id, ascendant_sign_id)
VALUES
('1990-03-25', 'Mumbai, India', 1, 4, 5),  -- Sun in Aries, Moon in Cancer, Ascendant in Leo
('1985-07-14', 'Delhi, India', 5, 9, 10),  -- Sun in Leo, Moon in Sagittarius, Ascendant in Capricorn
('1992-11-03', 'Bangalore, India', 8, 3, 1),  -- Sun in Scorpio, Moon in Gemini, Ascendant in Aries
('2000-01-20', 'Kolkata, India', 11, 12, 9),  -- Sun in Aquarius, Moon in Pisces, Ascendant in Sagittarius
('1995-09-05', 'Chennai, India', 6, 5, 7),  -- Sun in Virgo, Moon in Leo, Ascendant in Libra
('1988-04-12', 'Pune, India', 1, 10, 8),  -- Sun in Aries, Moon in Capricorn, Ascendant in Scorpio
('1999-02-28', 'Hyderabad, India', 12, 2, 11),  -- Sun in Pisces, Moon in Taurus, Ascendant in Aquarius
('1994-06-15', 'Ahmedabad, India', 3, 9, 6),  -- Sun in Gemini, Moon in Sagittarius, Ascendant in Virgo
('1997-12-23', 'Jaipur, India', 10, 4, 3),  -- Sun in Capricorn, Moon in Cancer, Ascendant in Gemini
('1991-10-09', 'Lucknow, India', 7, 6, 12), -- Sun in Libra, Moon in Virgo, Ascendant in Pisces
('1990-08-18', 'Patna, India', 5, 3, 2),  -- Sun in Leo, Moon in Gemini, Ascendant in Taurus
('1987-11-22', 'Nagpur, India', 9, 8, 1),  -- Sun in Sagittarius, Moon in Scorpio, Ascendant in Aries
('1996-05-12', 'Bhopal, India', 2, 6, 4),  -- Sun in Taurus, Moon in Virgo, Ascendant in Cancer
('1989-04-30', 'Surat, India', 2, 11, 7),  -- Sun in Taurus, Moon in Aquarius, Ascendant in Libra
('1994-07-27', 'Indore, India', 5, 1, 9),  -- Sun in Leo, Moon in Aries, Ascendant in Sagittarius
('1998-12-05', 'Vadodara, India', 10, 2, 5),  -- Sun in Capricorn, Moon in Taurus, Ascendant in Leo
('1991-06-10', 'Visakhapatnam, India', 3, 7, 11),  -- Sun in Gemini, Moon in Libra, Ascendant in Aquarius
('1993-09-18', 'Rajkot, India', 6, 8, 3),  -- Sun in Virgo, Moon in Scorpio, Ascendant in Gemini
('1992-02-04', 'Karnataka, India', 11, 12, 6),  -- Sun in Aquarius, Moon in Pisces, Ascendant in Virgo
('1985-10-16', 'Amritsar, India', 7, 5, 10),  -- Sun in Libra, Moon in Leo, Ascendant in Capricorn
('1995-08-23', 'Khopoli,India', 2, 1, 4),  --  Sun in Taurus, Moon in Aries, Ascendant in Cancer
('1987-05-14', 'Pune,India', 1, 3, 2),  --  Sun in Aries, Moon in Gemini, Ascendant in Taurus
('1974-09-17', 'Solapur,India',4,5,6), --   sun in Cancer, Moon in leo, Ascendant in Virgo
('1988-05-25', 'Agra, India', 3, 9, 1),   -- Sun in Gemini, Moon in Sagittarius, Ascendant in Aries
('1995-12-14', 'Meerut, India', 9, 5, 10), -- Sun in Sagittarius, Moon in Leo, Ascendant in Capricorn
('1999-03-30', 'Kanpur, India', 1, 12, 6), -- Sun in Aries, Moon in Pisces, Ascendant in Virgo
('1986-10-02', 'Coimbatore, India', 7, 10, 5), -- Sun in Libra, Moon in Capricorn, Ascendant in Leo
('1993-07-08', 'Nashik, India', 4, 2, 7),  -- Sun in Cancer, Moon in Taurus, Ascendant in Libra
('1997-09-19', 'Varanasi, India', 6, 6, 3), -- Sun in Virgo, Moon in Virgo, Ascendant in Gemini
('1992-04-06', 'Aurangabad, India', 1, 4, 8), -- Sun in Aries, Moon in Cancer, Ascendant in Scorpio
('1991-08-22', 'Guwahati, India', 5, 11, 9), -- Sun in Leo, Moon in Aquarius, Ascendant in Sagittarius
('1989-11-09', 'Jodhpur, India', 8, 7, 12), -- Sun in Scorpio, Moon in Libra, Ascendant in Pisces
('1994-02-18', 'Madurai, India', 11, 9, 4); -- Sun in Aquarius, Moon in Sagittarius, Ascendant in Cancer


-- -- Insert value for  Horoscope --
INSERT INTO Horoscope (date, zodiac_sign_id, prediction, category)
VALUES
('2023-08-23', 1, 'Today is a great day for new beginnings.', 'Career'),
('2023-09-21', 2, 'You may encounter unexpected opportunities.', 'Love'),
('2023-02-27', 3, 'Take time for personal reflection.', 'Health'),
('2023-08-01', 4, 'Today is a great day for romance, Aries. Be open to new connections.','Love'),
( '2023-08-01', 5, 'focus on teamwork today. You will achieve success through collaboration.','Career'),
( '2023-08-01', 6, 'prioritize your mental health today. Meditation or relaxation is key.','Health'),
('2023-08-01', 7, 'emotional connections are strong today. Be honest with your feelings.','Love'),
('2023-08-01', 8, 'today is perfect for stepping into leadership roles. Your confidence will shine.','Career'),
('2023-08-01', 9, 'take time for self-care. Physical activity will boost your mood today.','Health'),
('2023-08-01', 10, 'balance is key in your relationship. Seek harmony and mutual understanding.','Love'),
('2023-08-01', 11, 'intense focus on your work will yield great rewards today.','Career'),
('2023-08-01', 12, 'stay active today. A good workout will lift your spirits.','Health'),
('2023-08-01', 1, 'your steady approach to love will deepen your bond today.','Love'),
('2023-08-01', 2, 'innovation in your work will bring success. Be bold in your ideas.','Career' ),
('2023-08-01', 3, 'listen to your body today. Rest and rejuvenation are necessary for your well-being.','Health'),
('2023-08-03', 1,'today you may feel a surge of creativity. Use it to solve problems in love and work.', 'Career'),
('2023-08-02', 4,'focus on your emotional well-being. Self-care is essential to maintain balance.', 'Health'),
('2023-08-02', 5,'your leadership skills will be highlighted today. Take charge confidently.', 'Career'),
('2023-08-02', 6, 'unexpected health improvements may come your way. Keep up the good work.', 'Health'),
('2023-08-02', 7, 'harmony in your relationships will bring you peace today. Focus on mutual understanding.', 'Love'),
('2023-08-02', 8, 'it’s a good day for making strategic career moves. Stay focused on your goals.', 'Career'),
('2023-08-02', 9, 'adventure calls. Take a leap of faith in your love life today.', 'Love'),
('2023-08-02', 10, 'your patience will pay off in both personal and professional matters.', 'Career'),
('2023-08-03', 2, 'financial stability is within reach. Make smart investments and trust your instincts.', 'Career'),
('2023-08-03', 3, 'an old friend may reach out today. Strengthen your social connections.', 'Love'),
('2023-08-03', 4, 'today is about nurturing yourself. Relaxation is key to maintaining your energy.', 'Health'),
('2023-08-03', 5, 'your charm is magnetic today. It’s the perfect time for romance.', 'Love'),
('2023-08-03', 6, 'organizing your surroundings will help clear your mind and improve productivity.', 'Career'),
('2023-08-03', 7, 'love is in the air. Be open to deepening emotional bonds with someone special.', 'Love'),
('2023-08-03', 8, 'your determination is strong today. Tackle tough challenges in your career.', 'Career'),
('2023-08-03', 9, 'adventure awaits in your love life. Be spontaneous and embrace new possibilities.', 'Love'),
('2023-08-03', 10, 'today is ideal for long-term planning. Set career goals that align with your ambitions.', 'Career'),
('2023-08-03', 11, 'focus on innovation in your work. A fresh idea could lead to success.', 'Career'),
('2023-08-03', 12, 'emotional balance is key today. Meditation or quiet reflection will help you recharge.', 'Health'),
('2023-08-04', 1, 'take a break and focus on self-care. Your energy will improve with rest.', 'Health'),
('2023-08-04', 2, 'a new opportunity in your career might arise. Be ready to seize it.', 'Career'),
('2023-08-04', 3, 'communication will be your strength today. Use it to mend or strengthen relationships.', 'Love');


--  to find current date prediction value ---  
INSERT INTO Horoscope (date, zodiac_sign_id, prediction, category)
VALUES
(current_date(), 5, 'Today is a great day for new beginnings.', 'Career');

SELECT * FROM zodiac_sign;

SELECT * FROM planet;

SELECT * FROM planetary_position;

SELECT * FROM birth_chart;

SELECT * FROM horoscope;


-- question on Sub-queries --

-- 1 Question: Find the birth chart for someone whose ascendant is 'Gemini'.-- 

SELECT chart_id, birthdate, birthplace, ascendant_sign_id FROM Birth_Chart
WHERE ascendant_sign_id = (SELECT sign_id FROM Zodiac_Sign WHERE name = 'Gemini');

-- 2 Question: Find the elements (Fire,Earth, Air, Water) of the sun sign for someone born on 1974-09-17 -- 

SELECT element, sign_id FROM zodiac_sign  
WHERE sign_id = (SELECT sun_sign_id FROM birth_chart  
WHERE birthdate = '1974-09-17');


-- 3 Question Find the Horoscope prediction in the Career category for someone whose moon sign is Taurus on 2023-08-04. --

SELECT zodiac_sign_id, category, prediction FROM horoscope 
WHERE zodiac_sign_id = ( SELECT sign_id FROM zodiac_sign WHERE name = 'Taurus'
AND date = '2023-08-04' AND category = 'career');

-- 4 Question Find the BirthPlace of a person with the moon sign is Virgo --

SELECT moon_sign_id , birthplace FROM birth_chart 
WHERE moon_sign_id = (SELECT sign_id FROM zodiac_sign WHERE name = 'Virgo'); 


-- 5 Question Find the BirthPlace of a person with the Ascendant sign is Taurus

SELECT ascendant_sign_id, birthplace FROM birth_chart
WHERE ascendant_sign_id = (SELECT sign_id FROM zodiac_sign WHERE name = 'Taurus');


--  6 Questionfind the birthdate of the person who born in solapur --  -- not sub queries --

SELECT birthdate, birthplace FROM birth_chart WHERE birthplace = 'Solapur,India';


-- 7 Question Find all horoscope prediction for the zodiac sign 'Cancer' and 'Leo' on '2023-08-01' across all categories.

SELECT Zodiac_sign_id, category, prediction FROM horoscope
WHERE zodiac_sign_id IN (SELECT sign_id FROM zodiac_sign WHERE name IN ('cancer', 'leo')
AND  date = '2023-08-01');


-- 8 Question Find all horoscope prediction for the zodiac sign 'Cancer' on '2023-08-01' across all categories.

SELECT zodiac_sign_id, category, prediction FROM horoscope
WHERE zodiac_sign_id = (SELECT sign_id FROM zodiac_sign WHERE name ='Cancer'
AND date = '2023-08-01');


-- 9 Question Find all planets in retrograde from planet table --

SELECT * FROM planetary_position WHERE retrograde = 1; -- BY  NORMAL QUERY METHOD


SELECT * FROM Planetary_position
WHERE planet_id IN (SELECT planet_id FROM Planetary_position
WHERE retrograde = 1);


SELECT * FROM Planetary_position
WHERE date IN ( SELECT date FROM Planetary_position
WHERE retrograde = 1);


-- joins Questions -- 

-- query 1  list all planets and their zodiac sign-- 

SELECT p.name AS planet, z.name AS zodiacsign FROM planet AS p
JOIN zodiac_sign AS z 
ON p.ruling_sign_id = z.sign_id;

-- for currrent date Synyax

SELECT current_date();

-- query 2 find horoscope prediction for specific zodiac sign for today -- 

SELECT h.prediction AS Astro_prediction , h.category AS category FROM horoscope AS h  
JOIN zodiac_sign AS z 
ON h.zodiac_sign_id = z.sign_id
WHERE z.name = 'Leo' AND h.date = current_date();



-- query 3  show the next retrograde events for each events 

SELECT p.name AS planet, min(pp.date) AS  next_retrograde FROM planetary_position AS pp
JOIN planet AS p on pp.planet_id = p.planet_id 
WHERE pp.retrograde = 1
GROUP BY p.name 
ORDER BY next_retrograde ;

-- query 4 -- list all the planetary position with their zodizc sign -- 

SELECT pp.planet_id , pp.date ,pp.retrograde, z.name from planetary_position AS pp
RIGHT join zodiac_sign AS z 
ON pp.planet_id = z.sign_id;


-- query 4 -- Find the sun, moon, and ascendant signs for all birth charts along with their corresponding element


SELECT bc.birthdate, bc.sun_sign_id AS SunSign, z_sun.element AS SunElement,
	bc.moon_sign_id AS MoonSign, z_moon.element AS MoonElement,
	bc.ascendant_sign_id AS AscendantSign, z_Asc.element AS AscendantElement FROM birth_chart AS bc
INNER JOIN zodiac_sign AS z_sun ON bc.sun_sign_id = z_sun.sign_id
INNER JOIN zodiac_sign AS z_moon  ON bc.moon_sign_id = z_moon.sign_id
INNER JOIN zodiac_sign AS z_Asc ON bc.ascendant_sign_id = z_Asc.sign_id;






-- query 5 -- Find predictions and categories for all zodiac signs, even for those zodiac signs that do not have any horoscope predictions yet, for the date '2023-09-01'

SELECT z.name, h.prediction, h.category FROM zodiac_sign AS z
LEFT JOIN Horoscope AS h 
ON z.sign_id = h.zodiac_sign_id 
AND h.date = '2023-08-04';


-- query 6 
-- Retrieve all planetary positions and their corresponding zodiac signs, along with the planet's name and retrograde status. 
-- Show all planets, even those without a zodiac sign.

SELECT pp.date, p.name AS planet_name , z.name AS sign_name, pp.degree, pp.retrograde
FROM Planetary_Position AS pp
left JOIN Planet AS p ON pp.planet_id = p.planet_id
left JOIN Zodiac_Sign AS z ON pp.zodiac_sign_id = z.sign_id;


-- query 7 Find the horoscopes for all zodiac signs along with their element (e.g., Fire, Earth, Water, Air) for 2023-08-01.

SELECT h.prediction, h.category, z.name AS sign_name, z.element FROM Horoscope AS h
INNER JOIN Zodiac_Sign AS z 
ON h.zodiac_sign_id = z.sign_id
WHERE h.date = '2023-08-01'
ORDER BY sign_name ;

-- question 8 Find all horoscopes that have predictions for Virgo

SELECT h.date, h.prediction, h.category, z.name as sign_name
FROM Horoscope AS h
RIGHT JOIN Zodiac_Sign z
ON h.zodiac_sign_id = z.sign_id
WHERE z.name = 'Virgo';


-- Question 9: Find many people have birth charts for each element sign (e.g., Fire, Earth, Air, Water).

SELECT z.element, COUNT(*) AS num_Of_charts
FROM Birth_Chart AS bc
JOIN Zodiac_Sign AS z 
ON bc.sun_sign_id = z.sign_id
GROUP BY z.element;


-- Normal Questions -- 

-- 1 Question: Retrieve all horoscope predictions that contain the word "love" anywhere in the prediction text

SELECT prediction, category
FROM Horoscope
WHERE prediction LIKE '%love%';


-- 2 Question: Find all cities in the BirthChart table where the birthplace ends with "pur" (e.g., Jaipur, Nagpur)

SELECT birthplace FROM Birth_Chart
WHERE  birthplace LIKE '%pur%';


-- 3 Question:  Find all horoscope predictions made between January 1, 2023, and March 31, 2023

SELECT prediction, category, date FROM Horoscope
WHERE date BETWEEN '2023-01-01' AND '2023-03-31';


-- 4 Question: Find all planetary positions recorded between degrees 10.00 and 20.00.

SELECT planet_id, date, degree
FROM Planetary_Position
WHERE degree BETWEEN 10.00 AND 20.00
ORDER BY degree;


-- 5 Question: Find all horoscopes that were recorded after August 3, 2023.

SELECT date, prediction, category
FROM Horoscope
WHERE date > '2023-08-03'
ORDER BY DATE;



-- 6 Question: Calculate the total number of predictions made for the "Health" category.

SELECT count(*) AS Total_prediction, category FROM horoscope
WHERE category = 'health';


-- 6 Question: Find the sum of all degrees for planetary positions that occurred after July 1, 2023.

SELECT SUM(degree) AS Total_sum_of_Degree
FROM planetary_Position
WHERE  date > '2023-07-01';


-- 6 Question: Find the average degree of all planetary positions that are not retrograde.

SELECT AVG(degree) AS Avg_Degree_of_not_Retrograde
FROM Planetary_Position
WHERE retrograde = 0;


--  7 Question: find the birthdate of the person who born in solapur -- 

SELECT birthdate, birthplace FROM birth_chart WHERE birthplace = 'Solapur,India';


--  8 Question: Count how many horoscopes are available by each category (e.g., love, career, health).

SELECT category, count(*) AS Total_num_of_prediction 
FROM horoscope
GROUP BY category;



