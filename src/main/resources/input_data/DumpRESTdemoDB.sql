-- Suppression de la table si elle existe déjà
DROP TABLE IF EXISTS podcasts;

-- Création de la table podcasts
CREATE TABLE podcasts (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR(145) NOT NULL,
  feed VARCHAR(145) NOT NULL UNIQUE,
  insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(500),
  link_on_podcastpedia VARCHAR(145)
);

CREATE SEQUENCE podcast_sequence;
SELECT setval('podcast_sequence', (SELECT MAX(id) FROM podcasts));
ALTER TABLE podcasts ALTER COLUMN id SET DEFAULT nextval('podcast_sequence');

-- Insertion des données
INSERT INTO podcasts (id, title, feed, insertion_date, description, link_on_podcastpedia) VALUES
(1, 'Quarks & Co - zum Mitnehmen',
 'http://podcast.wdr.de/quarks.xml',
 '2014-01-09 20:21:10',
 'Quarks & Co: Das Wissenschaftsmagazin',
 'http://www.podcastpedia.org/podcasts/1/Quarks-Co-zum-Mitnehmen'),

(2, '- The Naked Scientists Podcast - Stripping Down Science',
 'http://www.thenakedscientists.com/naked_scientists_podcast.xml',
 '2014-01-09 20:21:10',
 'The Naked Scientists flagship science show brings you a lighthearted look at the latest scientific breakthroughs, interviews with the world top scientists, answers to your science questions and science experiments to try at home.',
 'http://www.podcastpedia.org/podcasts/792/-The-Naked-Scientists-Podcast-Stripping-Down-Science'),

(3, 'NPR: TED Radio Hour Podcast',
 'http://www.npr.org/rss/podcast.php?id=510298',
 '2014-01-09 20:21:10',
 'The TED Radio Hour is a journey through fascinating ideas: astonishing inventions, fresh approaches to old problems, new ways to think and create. Based on Talks given by riveting speakers on the world-renowned TED stage, each show is centered on a common theme - such as the source of happiness, crowd-sourcing innovation, power shifts, or inexplicable connections. The TED Radio Hour is hosted by Guy Raz, and is a co-production of NPR & TED. Follow the show @TEDRadioHour.',
 'http://www.podcastpedia.org/podcasts/1183/NPR-TED-Radio-Hour-Podcast');
