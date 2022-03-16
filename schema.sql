CREATE TABLE items(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre VARCHAR(250),
  author VARCHAR(250),
  source VARCHAR(250),
  label VARCHAR(250),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre VARCHAR(250),
  author VARCHAR(250),
  source VARCHAR(250),
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(250),
  cover_state VARCHAR(250),
  label_id INT,
  FOREIGN KEY(label_id) REFERENCES label(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(250),
  color VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE music_album(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre VARCHAR(250),
  author VARCHAR(250),
  source VARCHAR(250),
  label VARCHAR(250),
  on_spotify BOOLEAN,
  publish_date DATE,
  genre_id INT,
  FOREIGN KEY(genre_id) REFERENCES genre(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);
