CREATE TABLE IF NOT EXISTS ip2c
(
  registry	VARCHAR(7),
  cc		VARCHAR(2),
  c_long	VARCHAR(255),
  type		VARCHAR(4),
  start_ip	INT UNSIGNED NOT NULL DEFAULT 0,
  end_ip	INT UNSIGNED NOT NULL DEFAULT 0,
  date		DATETIME,
  status	VARCHAR(25),
  INDEX registry (registry),
  INDEX cc (cc),
  INDEX c_long (c_long),
  INDEX type (type),
  INDEX start_ip (start_ip),
  INDEX end_ip (end_ip)
);  

INSERT IGNORE INTO ip2c (registry,cc,c_long,type,start_ip,end_ip,date,status)
VALUES ('RFC1918','LO','RFC1918','ipv4','167772160','184549375','1996-02-01','allocated');

INSERT IGNORE INTO ip2c (registry,cc,c_long,type,start_ip,end_ip,date,status)
VALUES ('RFC1918','LO','RFC1918','ipv4','2886729728','2886795263','1996-02-01','allocated');

INSERT IGNORE INTO ip2c (registry,cc,c_long,type,start_ip,end_ip,date,status)
VALUES ('RFC1918','LO','RFC1918','ipv4','3232235520','3232301055','1996-02-01','allocated');

CREATE TABLE IF NOT EXISTS mappings
(
  registry       VARCHAR(7),
  cc             VARCHAR(2),
  c_long         VARCHAR(255),
  type           VARCHAR(4),
  ip             INT UNSIGNED NOT NULL DEFAULT 0,
  date           DATETIME,
  status         VARCHAR(25),
  age            TIMESTAMP,
  PRIMARY KEY (ip),
  INDEX registry (registry),
  INDEX cc (cc),
  INDEX c_long (c_long),
  INDEX age (age)
);

CREATE TABLE IF NOT EXISTS stats
(
  timestamp	DATETIME,
  type		TINYINT,
  object        INT UNSIGNED NOT NULL DEFAULT 0,
  count		INT UNSIGNED NOT NULL DEFAULT 0,
  INDEX type (type),
  INDEX object (object)
);

CREATE TABLE IF NOT EXISTS stat_types
(
  type		TINYINT,
  description   VARCHAR(255)
);

INSERT IGNORE INTO stat_types (type,description) VALUES ('1','Event Severity');
INSERT IGNORE INTO stat_types (type,description) VALUES ('2','Sensor ID');
INSERT IGNORE INTO stat_types (type,description) VALUES ('3','Source IP');
INSERT IGNORE INTO stat_types (type,description) VALUES ('4','Destination IP');
INSERT IGNORE INTO stat_types (type,description) VALUES ('5','Signature ID'); 
 
ALTER TABLE user_info
ADD email VARCHAR(320) NOT NULL DEFAULT 'none',
ADD type ENUM('ADMIN','USER') NOT NULL DEFAULT 'USER',
ADD timeout SMALLINT UNSIGNED NOT NULL DEFAULT '5000',
ADD tzoffset varchar(6) NOT NULL DEFAULT '+00:00';

CREATE TABLE IF NOT EXISTS filters
(
  name           VARCHAR(255),
  alias		 VARCHAR(12),
  username       VARCHAR(16),
  filter         BLOB,
  notes		 VARCHAR(255) NOT NULL DEFAULT 'None.',
  global	 TINYINT(1) NOT NULL DEFAULT 0,
  age            TIMESTAMP,
  PRIMARY KEY (username,alias)
);

INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D20436F756E74727920436F6465','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','cc','286D7372632E6363203D20272427204F52206D6473742E6363203D2027242729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D2044657374696E6174696F6E204950','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','dip','286473745F6970203D20494E45545F41544F4E282724272929');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D2044657374696E6174696F6E20506F7274','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','dpt','286473745F706F7274203D2027242729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D204950','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','ip','287372635F6970203D20494E45545F41544F4E2827242729204F52206473745F6970203D20494E45545F41544F4E282724272929');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D205369676E6174757265204944','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','sid','287369676E61747572655F6964203D2027242729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D205369676E6174757265','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','sig','287369676E6174757265204C494B45202725242527204F52207369676E6174757265204C494B4520272524252729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D20536F75726365204950','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','sip','287372635F6970203D20494E45545F41544F4E282724272929');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D20536F7572636520506F7274','546869732069732061206275696c742d696e20726561642d6f6e6c792066696c7465722e','spt','287372635F706F7274203D2027242729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D20536F7572636520436F756E74727920436F6465','546869732069732061206275696C742D696E20726561642D6F6E6C792066696C7465722E','scc','286D7372632E6363203D2027242729');
INSERT IGNORE INTO filters (username,global,name,notes,alias,filter)
VALUES ('','1','5368656C6C202D2044657374696E6174696F6E20436F756E74727920436F6465','546869732069732061206275696C742D696E20726561642D6F6E6C792066696C7465722E','dcc','286D6473742E6363203D2027242729');
