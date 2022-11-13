CREATE TABLE Concert
(
  concert_id INT NOT NULL,
  concert_name VARCHAR(50) NOT NULL,
  Date_time Timestamp NOT NULL,
  theme VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  venue VARCHAR(50) NOT NULL,
  PRIMARY KEY (concert_id)
);

CREATE TABLE Artist
(
  artist_id INT NOT NULL,
  artist_name VARCHAR(20) NOT NULL,
  num_of_songs INT NOT NULL,
  gender enum('Male','Female','Other') NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE User
(
  user_id INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  DOB DATE NOT NULL,
  ph_no VARCHAR(10) NOT NULL,
  is_admin enum('yes','no') NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Ticket
(
  Ticket_id INT NOT NULL,
  Seat_no INT NOT NULL,
  Price Float NOT NULL,
  concert_name VARCHAR(20) NOT NULL,
  ticket_type enum('gold','platinum','vip') NOT NULL,
  concert_id INT NOT NULL,
  user_id INT,
  PRIMARY KEY (Ticket_id),
  FOREIGN KEY (concert_id) REFERENCES Concert(concert_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE properties
(
  concert_id INT NOT NULL,
  prop_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price_per_unit FLOAT NOT NULL,
  PRIMARY KEY (concert_id,prop_name),
  FOREIGN KEY (concert_id) REFERENCES Concert(concert_id)
);

CREATE TABLE performed_by
(
  concert_id INT NOT NULL,
  artist_id INT NOT NULL,
  fee FLOAT NOT NULL,
  PRIMARY KEY (concert_id, artist_id),
  FOREIGN KEY (concert_id) REFERENCES Concert(concert_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE Artist_Instrument
(
  Instrument VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (Instrument, artist_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);