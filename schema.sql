CREATE TABLE Author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(120),
  last_name VARCHAR(120),
  PRIMARY KEY (id)
);

CREATE TABLE source (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(120),
  PRIMARY KEY (id)
);

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(120),
  color VARCHAR(120),
  PRIMARY KEY (id)
);

CREATE TABLE book (
  id INT GENERATED ALWAYS AS IDENTITY ,
  name VARCHAR(120),
  publisher VARCHAR(120),
  cover_state VARCHAR(120),
  PRIMARY KEY (id),
  CONSTRAINT id
    FOREIGN KEY (id)
      REFERENCES item(id)
);

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  author_id INT,
  lable_id INT,
  source_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT author_id
    FOREIGN KEY (author_id)
      REFERENCES Author(id),
  CONSTRAINT lable_id
    FOREIGN KEY (lable_id)
      REFERENCES source(id),
  CONSTRAINT source_id
    FOREIGN KEY (source_id)
      REFERENCES label(id)
);
