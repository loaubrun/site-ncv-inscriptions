DROP TABLE IF EXISTS climber,bloc,perf_bloc,voie,perf_voie;

CREATE TABLE climber (
    climberId int AUTO_INCREMENT PRIMARY KEY,
    prenom varchar(255) NOT NULL,
    nom varchar(255) NOT NULL,
    dateNaissance date NOT NULL,    
    sexe ENUM('M', 'F') NOT NULL,
    cs BOOLEAN DEFAULT 0,

    mail varchar(255) DEFAULT NULL,
    telephone varchar(255) DEFAULT NULL,

    niveau_bloc varchar(3) DEFAULT NULL,
    niveau_voie varchar(3) DEFAULT NULL,

    invite_ncv BOOLEAN DEFAULT 0,
    paye_ncv BOOLEAN DEFAULT 0,
    rang_ncv int DEFAULT NULL,
    sandwich_ncv INT DEFAULT NULL,
    sandwich_ncv_2 INT DEFAULT NULL,
    carte_valide BOOLEAN DEFAULT 0,

    invite_cvg BOOLEAN DEFAULT 0,
    paye_cvg BOOLEAN DEFAULT 0,
    rang_cvg int DEFAULT NULL,
    sandwich_cvg INT DEFAULT NULL,
    sandwich_cvg_2 INT DEFAULT NULL,

    t_shirt varchar(1) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE bloc (
  blocId int AUTO_INCREMENT PRIMARY KEY,
  nom varchar(255) DEFAULT NULL,

  couleur varchar(255) DEFAULT NULL,
  juge BOOLEAN DEFAULT NULL,
  secteur varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE perf_bloc (
  climberId int NOT NULL,
  blocId int NOT NULL,
  zone BOOLEAN DEFAULT 0,
  essaisZone int(11) DEFAULT NULL,
  top BOOLEAN DEFAULT 0,
  essaisTop int(11) DEFAULT NULL,

  PRIMARY KEY (climberId, blocId),
  FOREIGN KEY (climberId) REFERENCES climber (climberId),
  FOREIGN KEY (blocId) REFERENCES bloc (blocId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE voie (
  voieId int AUTO_INCREMENT PRIMARY KEY,
  nom varchar(255) DEFAULT NULL,

  couleur varchar(255) DEFAULT NULL,
  cotation varchar(10) DEFAULT NULL,
  jugé BOOLEAN DEFAULT NULL,
  nbDegaine int(11) DEFAULT NULL,
  secteur varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE perf_voie (
    climberId int NOT NULL,
    voieId int NOT NULL,
    maxDegaine int(11) DEFAULT NULL,

    PRIMARY KEY (climberId, voieId),
    FOREIGN KEY (climberId) REFERENCES climber (climberId),
    FOREIGN KEY (voieId) REFERENCES voie (voieId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

