CREATE TABLE Concert
(
  concert_name VARCHAR(50) NOT NULL,
  Date_time Timestamp NOT NULL,
  concert_id INT NOT NULL,
  theme VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  venue VARCHAR(50) NOT NULL,
  PRIMARY KEY (concert_id)
);

CREATE TABLE Artist
(
  artist_name VARCHAR(20) NOT NULL,
  num_of_songs INT NOT NULL,
  artist_id INT NOT NULL,
  gender enum('Male','Female','Other') NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE User
(
  Name VARCHAR(20) NOT NULL,
  user_id INT NOT NULL,
  DOB DATE NOT NULL,
  ph_no INT NOT NULL,
  is_admin enum('yes','no') NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Ticket
(
  Ticket_id INT NOT NULL,
  Price enum(500,1000,1500) NOT NULL,
  Seat_no INT NOT NULL,
  concert_name VARCHAR(20) NOT NULL,
  ticket_type enum('gold','platinum','vip') NOT NULL,
  concert_id INT NOT NULL,
  PRIMARY KEY (Ticket_id,Seat_no),
  FOREIGN KEY (concert_id) REFERENCES Concert(concert_id)
);

CREATE TABLE properties
(
  prop_name VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price_per_unit FLOAT NOT NULL,
  concert_id INT NOT NULL,
  PRIMARY KEY (concert_id),
  FOREIGN KEY (concert_id) REFERENCES Concert(concert_id)
);

CREATE TABLE performed_by
(
  fee FLOAT NOT NULL,
  concert_id INT NOT NULL,
  artist_id INT NOT NULL,
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

CREATE TABLE bought_by
(
  user_id INT NOT NULL,
  Ticket_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (Ticket_id) REFERENCES Ticket(Ticket_id)
);