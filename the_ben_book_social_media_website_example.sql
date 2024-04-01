DROP DATABASE IF EXISTS ben_book;
CREATE DATABASE ben_book;
USE ben_book; 

CREATE TABLE ben_users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE ben_photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES ben_users(id)
);

CREATE TABLE ben_comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES ben_photos(id),
    FOREIGN KEY(user_id) REFERENCES ben_users(id)
);

CREATE TABLE ben_likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES ben_users(id),
    FOREIGN KEY(photo_id) REFERENCES ben_photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE ben_follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES ben_users(id),
    FOREIGN KEY(followee_id) REFERENCES ben_users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE ben_tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE ben_photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES ben_photos(id),
    FOREIGN KEY(tag_id) REFERENCES ben_tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO ben_users (username, created_at) VALUES 
('Kenton_Kirlin', '2017-02-16 18:22:10.846'), 
('Andy_Purdy85', '2017-04-02 17:11:21.417'), 
('Harley_Lind18', '2017-02-21 11:12:32.574'), 
('Arely_Bogan63', '2016-08-13 01:28:43.085'), 
('Antonty_Hackett', '2016-12-07 01:04:39.298'), 
('Paul.Waters', '2017-04-30 13:26:14.496'), 
('Kasandra_Homenick', '2016-12-12 06:50:07.996'), 
('Tabitha_Schamberger11', '2016-08-20 02:19:45.512'),
 ('Nat93', '2016-06-24 19:36:30.978'), 
 ('Presley_McClure', '2016-08-07 16:25:48.561'), 
 ('Greg_27', '2017-05-04 16:32:15.577'),
 ('Dereck65', '2017-01-19 01:34:14.296'), 
 ('Gus35', '2017-03-29 17:09:02.344'), 
 ('Jaclyn81', '2017-02-06 23:29:16.394'), 
 ('Billy52', '2016-10-05 14:10:20.453'), 
 ('Harri.Hughes16', '2016-08-02 21:32:45.646'), 
 ('Norbert_Carroll35', '2017-02-06 22:05:43.425'), 
 ('Odessa2', '2016-10-21 18:16:56.390'), 
 ('Hailee26', '2017-04-29 18:53:39.650'), 
 ('Delpha.Kihn', '2016-08-31 02:42:30.288');

INSERT INTO ben_photos(image_url, user_id) VALUES 
('http://elijah.biz', 1), 
('https://shanon.org', 1), ('http://vicky.biz', 1), ('http://oleta.net', 1), ('https://jennings.biz', 1), 
('https://quinn.biz', 2), ('https://selina.name', 2), ('http://malvina.org', 2), ('https://branson.biz', 2),
('https://elenor.name', 3), ('https://marcelino.com', 3), ('http://felicity.name', 3), ('https://fred.com', 3), 
('https://gerhard.biz', 4), ('https://sherwood.net', 4), ('https://maudie.org', 4), ('http://annamae.name', 6), 
('https://mac.org', 6), ('http://miracle.info', 6), ('http://emmet.com', 6), ('https://nat.com', 6),
('https://brooklyn.name', 8), ('http://madison.net', 8), ('http://annie.name', 8), 
 ('http://benny.info', 8), ('http://saige.com', 9),  ('https://reece.net', 9),('http://vance.org', 9), ('http://ignacio.net', 9), 
 ('http://kenny.com', 10),  ('http://remington.name', 10), ('http://kurtis.info', 10),  ('https://alisha.com', 11), 
 ('https://henderson.com', 11), ('http://bonnie.info', 11),  ('http://kennith.net', 11), ('http://camille.name', 11),
 ('http://alena.net', 12),  ('http://ralph.name', 12), ('https://tyshawn.com', 12), ('https://adella.net', 12), 
 ('https://cielo.info', 13), ('https://easter.net', 13), ('http://golden.org', 13),
 ('http://kendall.biz', 13),  ('https://glenda.info', 13),
 ('http://dominic.biz', 15), ('http://tressie.info', 15),
 ('http://estevan.org', 15), ('http://zena.com', 15), ('https://abagail.com', 16), 
 ('https://hershel.com', 16), ('http://collin.com', 16), ('https://clair.com', 16), ('https://deondre.com', 17),
 ('http://tristin.name', 17), ('http://kirk.org', 17), ('https://modesta.info', 18), 
 ('http://rylan.biz', 19), ('https://noemie.com', 19), ('https://dejon.name', 20);
 
INSERT INTO ben_follows(follower_id, followee_id) VALUES
 (2, 1), (2, 3), (2, 4), (2, 5), (2, 6), 
 (4, 5), (5,4), (6, 10), (14, 19), (3, 17), (3, 9), (3, 7);
 
INSERT INTO ben_comments(comment_text, user_id, photo_id) VALUES 
('unde at dolorem', 2, 1), ('quae ea ducimus', 3, 1), ('alias a voluptatum', 5, 1);

INSERT INTO ben_likes(user_id,photo_id) VALUES 
(2, 1), (5, 1), (9, 1), (10, 3), (1, 18), (5, 7), (9, 3), (10, 1);

INSERT INTO ben_tags(tag_name) VALUES 
('sunset'), ('photography'), ('sunrise'), ('landscape'), ('food'), ('foodie'),
 ('delicious'), ('beauty'), ('stunning'), ('dreamy'), ('lol'), ('happy'), ('fun'), ('style'), ('hair'), ('fashion'), 
 ('party'), ('concert'), ('drunk'), ('beach'), ('smile');
 
INSERT INTO ben_photo_tags(photo_id, tag_id) VALUES (1, 18), (1, 17), (1, 21), (1, 13), (1, 19), (2, 4), (2, 3);

