CREATE DATABASE  IF NOT EXISTS `movilesdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `movilesdb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: movilesdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `administrador` (
  `idAdmin` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apPat` varchar(45) DEFAULT NULL,
  `apMat` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Administrador',NULL,NULL,'admin','123');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumno` (
  `boleta` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apPat` varchar(45) DEFAULT NULL,
  `apMat` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`boleta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (2015000111,'test','test','test','user','123'),(2015111222,'alguien','a','b','abc','123');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnohorario`
--

DROP TABLE IF EXISTS `alumnohorario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnohorario` (
  `idGrupo` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEdificio` int(11) NOT NULL,
  `boleta` int(11) NOT NULL,
  `lunes` time DEFAULT NULL,
  `martes` time DEFAULT NULL,
  `miercoles` time DEFAULT NULL,
  `jueves` time DEFAULT NULL,
  `viernes` time DEFAULT NULL,
  PRIMARY KEY (`idGrupo`,`idMateria`,`idEdificio`,`boleta`),
  KEY `fk_Salon_has_Alumno_Alumno1_idx` (`boleta`),
  KEY `fk_Salon_has_Alumno_Salon1_idx` (`idGrupo`,`idMateria`,`idEdificio`),
  CONSTRAINT `fk_Salon_has_Alumno_Alumno1` FOREIGN KEY (`boleta`) REFERENCES `alumno` (`boleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Salon_has_Alumno_Salon1` FOREIGN KEY (`idGrupo`, `idMateria`, `idEdificio`) REFERENCES `salon` (`idgrupo`, `idmateria`, `idedificio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnohorario`
--

LOCK TABLES `alumnohorario` WRITE;
/*!40000 ALTER TABLE `alumnohorario` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnohorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!50001 DROP VIEW IF EXISTS `disponibilidad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `disponibilidad` AS SELECT 
 1 AS `idEdificio`,
 1 AS `numEdificio`,
 1 AS `numSalon`,
 1 AS `ordenadia`,
 1 AS `nombredia`,
 1 AS `horaInicio`,
 1 AS `horaFin`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edificio` (
  `idEdificio` int(11) NOT NULL,
  `numEdificio` varchar(45) DEFAULT NULL,
  `numSalon` varchar(45) DEFAULT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idEdificio`,`idAdmin`),
  KEY `fk_Edificio_Administrador1_idx` (`idAdmin`),
  CONSTRAINT `fk_Edificio_Administrador1` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idadmin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,'1','1011',1),(2,'1','1012',1),(3,'1','1013',1),(4,'1','1014',1),(5,'1','1110',1),(6,'1','1111',1),(7,'1','1112',1),(8,'1','1113',1),(9,'1','1202',1),(10,'1','1203',1),(11,'1','1204',1),(12,'1','1205',1),(13,'1','1206',1),(14,'1','1207',1),(15,'1','1209',1),(16,'1','1210',1),(17,'1','1211',1),(18,'1','1212',1),(19,'1','1213',1),(20,'1','1214',1),(21,'2','2004',1),(22,'2','2005',1),(23,'2','2006',1),(24,'2','2007',1),(25,'2','2110',1),(26,'2','2111',1),(27,'2','2201',1),(28,'2','2202',1),(29,'2','2203',1),(30,'2','2204',1),(31,'2','2205',1),(32,'2','2206',1),(33,'2','2207',1),(34,'2','2209',1),(35,'2','2210',1),(36,'2','2211',1),(37,'2','2212',1),(38,'2','2213',1),(39,'3','3001',1),(40,'3','3015',1);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `nombreGrupo` varchar(45) DEFAULT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idGrupo`,`idAdmin`),
  KEY `fk_Grupo_Administrador1_idx` (`idAdmin`),
  CONSTRAINT `fk_Grupo_Administrador1` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idadmin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'1CM1',1),(2,'1CM10',1),(3,'1CM11',1),(4,'1CM12',1),(5,'1CM13',1),(6,'1CM14',1),(7,'1CM2',1),(8,'1CM3',1),(9,'1CM4',1),(10,'1CM5',1),(11,'1CM6',1),(12,'1CM7',1),(13,'1CM8',1),(14,'1CM9',1),(15,'1CV1',1),(16,'1CV10',1),(17,'1CV11',1),(18,'1CV12',1),(19,'1CV2',1),(20,'1CV3',1),(21,'1CV4',1),(22,'1CV5',1),(23,'1CV6',1),(24,'1CV7',1),(25,'1CV8',1),(26,'1CV9',1),(27,'2CM1',1),(28,'2CM10',1),(29,'2CM11RC',1),(30,'2CM11TC',1),(31,'2CM2',1),(32,'2CM3',1),(33,'2CM4',1),(34,'2CM5',1),(35,'2CM6',1),(36,'2CM7',1),(37,'2CM8',1),(38,'2CM9',1),(39,'2CV1',1),(40,'2CV10',1),(41,'2CV2',1),(42,'2CV3',1),(43,'2CV4',1),(44,'2CV5',1),(45,'2CV6',1),(46,'2CV7',1),(47,'2CV8',1),(48,'2CV9',1),(49,'3CM1',1),(50,'3CM10',1),(51,'3CM11',1),(52,'3CM12',1),(53,'3CM2',1),(54,'3CM3',1),(55,'3CM4',1),(56,'3CM5',1),(57,'3CM6',1),(58,'3CM7',1),(59,'3CM8',1),(60,'3CM9',1),(61,'3CV1',1),(62,'3CV10',1),(63,'3CV2',1),(64,'3CV3',1),(65,'3CV4',1),(66,'3CV5',1),(67,'3CV6',1),(68,'3CV7',1),(69,'3CV8',1),(70,'3CV9',1),(71,'4CM1',1),(72,'4CM2',1),(73,'4CM3',1),(74,'4CM4',1),(75,'4CV1',1),(76,'4CV2',1),(77,'4CV3',1),(78,'4CV4',1),(79,'5CM1',1),(80,'5CM2',1),(81,'5CM3',1),(82,'5CV1',1),(83,'5CV2',1),(84,'5CV3',1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `horas` (
  `idhoras` int(11) NOT NULL AUTO_INCREMENT,
  `ordenadia` int(2) DEFAULT NULL,
  `nombredia` varchar(10) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  PRIMARY KEY (`idhoras`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES (1,10,'LUNES','07:00:00','08:30:00'),(2,11,'LUNES','08:30:00','10:00:00'),(3,12,'LUNES','10:30:00','12:00:00'),(4,13,'LUNES','12:00:00','13:00:00'),(5,14,'LUNES','13:30:00','15:00:00'),(6,15,'LUNES','15:00:00','16:30:00'),(7,16,'LUNES','16:30:00','18:00:00'),(8,17,'LUNES','18:30:00','20:00:00'),(9,18,'LUNES','20:00:00','21:30:00'),(10,19,'MARTES','07:00:00','08:30:00'),(11,20,'MARTES','08:30:00','10:00:00'),(12,21,'MARTES','10:30:00','12:00:00'),(13,22,'MARTES','12:00:00','13:00:00'),(14,23,'MARTES','13:30:00','15:00:00'),(15,24,'MARTES','15:00:00','16:30:00'),(16,25,'MARTES','16:30:00','18:00:00'),(17,26,'MARTES','18:30:00','20:00:00'),(18,27,'MARTES','20:00:00','21:30:00'),(19,28,'MIERCOLES','07:00:00','08:30:00'),(20,29,'MIERCOLES','08:30:00','10:00:00'),(21,30,'MIERCOLES','10:30:00','12:00:00'),(22,31,'MIERCOLES','12:00:00','13:00:00'),(23,32,'MIERCOLES','13:30:00','15:00:00'),(24,33,'MIERCOLES','15:00:00','16:30:00'),(25,34,'MIERCOLES','16:30:00','18:00:00'),(26,35,'MIERCOLES','18:30:00','20:00:00'),(27,36,'MIERCOLES','20:00:00','21:30:00'),(28,37,'JUEVES','07:00:00','08:30:00'),(29,38,'JUEVES','08:30:00','10:00:00'),(30,39,'JUEVES','10:30:00','12:00:00'),(31,40,'JUEVES','12:00:00','13:00:00'),(32,41,'JUEVES','13:30:00','15:00:00'),(33,42,'JUEVES','15:00:00','16:30:00'),(34,43,'JUEVES','16:30:00','18:00:00'),(35,44,'JUEVES','18:30:00','20:00:00'),(36,45,'JUEVES','20:00:00','21:30:00'),(37,46,'VIERNES','07:00:00','08:30:00'),(38,47,'VIERNES','08:30:00','10:00:00'),(39,48,'VIERNES','10:30:00','12:00:00'),(40,49,'VIERNES','12:00:00','13:00:00'),(41,50,'VIERNES','13:30:00','15:00:00'),(42,51,'VIERNES','15:00:00','16:30:00'),(43,52,'VIERNES','16:30:00','18:00:00'),(44,53,'VIERNES','18:30:00','20:00:00'),(45,54,'VIERNES','20:00:00','21:30:00');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lunavie`
--

DROP TABLE IF EXISTS `lunavie`;
/*!50001 DROP VIEW IF EXISTS `lunavie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `lunavie` AS SELECT 
 1 AS `idEdificio`,
 1 AS `numEdificio`,
 1 AS `numSalon`,
 1 AS `idhoras`,
 1 AS `ordenadia`,
 1 AS `nombredia`,
 1 AS `horaInicio`,
 1 AS `horaFin`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `nombreMateria` varchar(45) DEFAULT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idMateria`,`idAdmin`),
  KEY `fk_Materia_Administrador1_idx` (`idAdmin`),
  CONSTRAINT `fk_Materia_Administrador1` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idadmin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'ADMINISTRACION DE PROYECTOS',1),(2,'ADMINISTRACION DE SERVICIOS EN RED',1),(3,'Administracion Financiera',1),(4,'ADVANCED COMPUTING SYSTEMS PROGRAMMING',1),(5,'Algebra lineal',1),(6,'Algoritmia y programaci�n estructurada',1),(7,'ANALISIS DE ALGORITMOS',1),(8,'Analisis fundamental de circuitos',1),(9,'An�lisis Vectorial',1),(10,'Analisis y Dise�o Orientado a Objetos',1),(11,'ANALYSIS AND DESIGN OF PARALLEL ALGORITHMS',1),(12,'APLICACIONES PARA COMUNICACIONES DE RED',1),(13,'APPLICATION DEVELOPMENT FOR MOBILE DEVICES',1),(14,'ARQUITECTURA DE COMPUTADORAS',1),(15,'ARTIFICIAL INTELLIGENCE',1),(16,'Bases de Datos',1),(17,'BASIC PROCESSING DIGITAL SIGNAL',1),(18,'BIOINFORMATICS',1),(19,'C�lculo',1),(20,'Calculo Aplicado',1),(21,'COMPILADORES',1),(22,'COMPUTATIONAL GEOMETRY',1),(23,'COMPUTING SELECTED TOPICS',1),(24,'Comunicaci�n Oral y Escrita',1),(25,'CRYPTOGRAPHY',1),(26,'DATA BASE SELECTED TOPICS',1),(27,'DATA MINING',1),(28,'DESARROLLO DE SISTEMAS DISTRIBUIDOS',1),(29,'DIGITAL PROCESSING OF VOICE AND IMAGE',1),(30,'Dise�o de sistemas Digitales',1),(31,'DISTRIBUTED DATA BASE',1),(32,'ECONOMIC ENGINEERING',1),(33,'Ecuaciones Diferenciales',1),(34,'Electronica Analogica',1),(35,'EMBEDDED SYSTEMS',1),(36,'Estructuras de datos',1),(37,'F�sica',1),(38,'Fundamentos de dise�o digital',1),(39,'Fundamentos Economicos',1),(40,'GENETIC ALGORITHMS',1),(41,'GESTION EMPRESARIAL',1),(42,'HIGH TECHNOLOGY ENTERPRISE MANAGEMENT',1),(43,'IMAGE ANALYSIS',1),(44,'INGENIERIA DE SOFTWARE',1),(45,'Ingenieria �tica y Sociedad',1),(46,'INSTRUMENTACION',1),(47,'INTRODUCCION A LOS MICROCONTROLADORES',1),(48,'IT GOVERNANCE',1),(49,'LIDERAZGO Y DESARROLLO PROFESIONAL',1),(50,'Matematicas Avanzadas para la Ingenieria',1),(51,'Matem�ticas Discretas',1),(52,'METODOS CUANTITATIVOS PARA LA TOMA DE DECISIO',1),(53,'NEURAL NETWORKS',1),(54,'PARALLEL AND CONCURRENT PROGRAMMING',1),(55,'PATTERN RECOGNITION',1),(56,'Probabilidad y Estadistica',1),(57,'Programacion Orientada a Objetos',1),(58,'Redes de computadoras',1),(59,'Sistemas Operativos',1),(60,'SOFTWARE ENGINEERING FOR MOBILE DEVICES',1),(61,'Tecnologias para la web',1),(62,'Teoria Computacional',1),(63,'TEORIA DE COMUNICACIONES Y SE�ALES',1),(64,'TRABAJO TERMINAL I',1),(65,'TRABAJO TERMINAL II',1),(66,'WEB APPLICATION DEVELOPMENT',1),(67,'WEB SECURITY',1);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesor` (
  `cedulaP` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apPat` varchar(45) DEFAULT NULL,
  `apMat` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedulaP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'AGUILAR','GARCIA','RAFAEL ','usr1','pass1'),(2,'AGUILAR','SANCHEZ','FERNANDO ','usr2','pass2'),(3,'AGUSTIN','DOMINGUEZ','VERONICA ','usr3','pass3'),(4,'ALCANTARA','MENDEZ','ALBERTO JESUS','usr4','pass4'),(5,'ALMAZAN','FARFAN','ROCIO ','usr5','pass5'),(6,'ARAGON','GARCIA','MARIBEL ','usr6','pass6'),(7,'ARAUJO','DIAZ','DAVID ','usr7','pass7'),(8,'ARZATE','GORDILLO','JACQUELINE ','usr8','pass8'),(9,'AVILA','SANCHEZ','CRISTHIAN ALEJANDRO','usr9','pass9'),(10,'BARRANCO','JIMENEZ','MARCO ANTONIO','usr10','pass10'),(11,'BAUTISTA','ROSALES','SANDRA IVETTE','usr11','pass11'),(13,'BOTELLO','CASTILLO','ALEJANDRO ','usr13','pass13'),(14,'CABRERA','CHAVEZ','GLORIA LOURDES','usr14','pass14'),(15,'CANCINO','CALDERON','SERGIO ','usr15','pass15'),(16,'CA�EDO','SUAREZ','LETICIA ','usr16','pass16'),(17,'CARBALLO','JIMENEZ','JUAN MANUEL','usr17','pass17'),(18,'CARRETO','ARELLANO','CHADWICK ','usr18','pass18'),(19,'CASTILLO','CABRERA','GELACIO ','usr19','pass19'),(20,'CASTILLO','MARRUFO','JUAN ANTONIO','usr20','pass20'),(21,'CATALAN','SALGADO','EDGAR ARMANDO','usr21','pass21'),(22,'CEBALLOS','SEBASTIAN','RICARDO ','usr22','pass22'),(23,'CELIS','DOMINGUEZ','ADRIANA BERENICE','usr23','pass23'),(24,'CERVANTES','DE ANDA','ISMAEL','usr24','pass24'),(25,'CERVANTES','ESPINOSA','LUIS MOCTEZUMA','usr25','pass25'),(26,'CHAVARRIA','BAEZ','LORENA ','usr26','pass26'),(27,'CHAVEZ','LIMA','EDUARDO ','usr27','pass27'),(28,'CIFUENTES','ALVAREZ','ALEJANDRO SIGFRIDO','usr28','pass28'),(29,'CORDERO','LOPEZ','MARTHA ROSA','usr29','pass29'),(30,'CORONILLA','CONTRERAS','UKRANIO ','usr30','pass30'),(31,'CORTES','GALICIA','JORGE ','usr31','pass31'),(32,'CORTEZ','DUARTE','NIDIA ASUNCI�N','usr32','pass32'),(33,'CRUZ','GARCIA','DANIEL ','usr33','pass33'),(34,'CRUZ','LAZARO','APOLINAR FRANCISCO','usr34','pass34'),(35,'CRUZ','MEZA','MARIA ELENA','usr35','pass35'),(36,'CRUZ','TORRES','BENJAMIN ','usr36','pass36'),(37,'DAVALOS','LOPEZ','JOSE CARLOS','usr37','pass37'),(38,'DIAZ','HUERTA','CLAUDIA CELIA','usr38','pass38'),(39,'DIAZ','SANTIAGO','RICARDO FELIPE','usr39','pass39'),(40,'DIAZ','SANTIAGO','SANDRA ','usr40','pass40'),(41,'DIAZ','TOALA','IVAN ','usr41','pass41'),(42,'DORANTES','GONZALEZ','MARCO ANTONIO','usr42','pass42'),(43,'DORANTES','VILLA','CLAUDIA JISELA','usr43','pass43'),(44,'DUR�N','CAMARILLO','EDMUNDO REN�','usr44','pass44'),(45,'DURAN','LEDEZMA','ANGEL ADALBERTO','usr45','pass45'),(46,'ENRIQUEZ','ZARATE','JOSE ASUNCION','usr46','pass46'),(47,'ESQUIVEL','CENTENO','JOSE ARMANDO','usr47','pass47'),(48,'ESTRADA','ELIZALDE','SERAFIN ','usr48','pass48'),(49,'FERRER','TENORIO','JORGE ','usr49','pass49'),(50,'FIGUEROA','DEL PRADO','FELIPE DE JESUS ','usr50','pass50'),(51,'FLORES','DELGADO','RAQUEL ','usr51','pass51'),(52,'FLORES','MENDOZA','YAXKIN ','usr52','pass52'),(53,'FRANCO','MARTINEZ','EDGARDO ADRIAN','usr53','pass53'),(54,'GALICIA','MEJIA','RUBEN ','usr54','pass54'),(55,'GALI�ANES','RODRIGUEZ','MARIA GABRIELA','usr55','pass55'),(56,'GARCIA','MENDOZA','CONSUELO VARINIA','usr56','pass56'),(57,'GARCIA','ORTEGA','VICTOR HUGO','usr57','pass57'),(58,'GARCIA','SALES','JUAN VICENTE','usr58','pass58'),(59,'GONZALEZ','ALBARRAN','GISELA ','usr59','pass59'),(60,'GONZALEZ','CISNEROS','ALEJANDRO ','usr60','pass60'),(61,'GONZALEZ','TRUJILLO','MIGUEL ','usr61','pass61'),(62,'GUTIERREZ','ALDANA','EDUARDO ','usr62','pass62'),(63,'GUTIERREZ','MEJIA','DARWIN ','usr63','pass63'),(64,'GUZMAN','AGUILAR','FLORENCIO ','usr64','pass64'),(65,'GUZMAN','FLORES','JESSIE PAULINA','usr65','pass65'),(66,'HENESTROSA','CARRASCO','LETICIA ','usr66','pass66'),(67,'HERNANDEZ','AGUILAR','JOSE LUIS','usr67','pass67'),(68,'HERNANDEZ','AVILES','FERNANDO DANTE','usr68','pass68'),(69,'HERNANDEZ','CONTRERAS','EULER ','usr69','pass69'),(70,'HERN�NDEZ','CRUZ','MACARIO ','usr70','pass70'),(71,'HERNANDEZ','GARCIA','ROSA ALBA','usr71','pass71'),(72,'HERNANDEZ','OLVERA','LUIS ENRIQUE','usr72','pass72'),(73,'HERNANDEZ','RUBIO','ERIKA ','usr73','pass73'),(74,'HERRERA','YA�EZ','CRISPIN ','usr74','pass74'),(75,'HIGUITA','BORJA','DANIEL FERNANDO','usr75','pass75'),(76,'JIMENEZ','BENITEZ','JOSE ALFREDO','usr76','pass76'),(77,'JIMENEZ','CONTRERAS','EDITH ADRIANA','usr77','pass77'),(78,'JIMENEZ','GALAN','YASMIN IVETTE','usr78','pass78'),(79,'JIMENEZ','RUIZ','RENE BALTAZAR','usr79','pass79'),(80,'JIMENEZ','VILLANUEVA','MARTHA PATRICIA','usr80','pass80'),(81,'JUAREZ','MARTINEZ','GENARO ','usr81','pass81'),(82,'JUAREZ','RAMIREZ','JAZMIN ADRIANA','usr82','pass82'),(83,'JURADO','JIMENEZ','ROBERTO ','usr83','pass83'),(84,'KOLESNIKOVA','OLGA',' ','usr84','pass84'),(85,'LAZCANO','XOXOTLA','LAURA ','usr85','pass85'),(86,'LEON','HERNANDEZ','MIGUEL ABEL','usr86','pass86'),(87,'LINARES','VALLEJO','ERICK EUGENIO','usr87','pass87'),(88,'LOPEZ','CARRERA','BENJAMIN ','usr88','pass88'),(89,'LOPEZ','LEYVA','LUIS OCTAVIO','usr89','pass89'),(90,'LOPEZ','RABADAN','JOSE JAIME','usr90','pass90'),(91,'LOPEZ','RODRIGUEZ','CLAUDIA ALEJAN','usr91','pass91'),(92,'LOPEZ','ROJAS','ARIEL ','usr92','pass92'),(93,'LOPEZ','RUIZ','GABRIELA DE JESUS ','usr93','pass93'),(94,'LUNA','BENOSO','BENJAMIN ','usr94','pass94'),(95,'LUNA','GARCIA','RENE ','usr95','pass95'),(96,'MALDONADO','MU�OZ','MIGUEL ANGEL','usr96','pass96'),(97,'MANDUJANO','JOSE','ROBERTO ','usr97','pass97'),(98,'MANZANILLA','GRANADOS','HECTOR MANUEL','usr98','pass98'),(99,'MARQUEZ','ARREGUIN','GUILLERMO ','usr99','pass99'),(100,'MARTINEZ','ACOSTA','LILIAN ','usr100','pass100'),(101,'MARTINEZ','DIAZ','JUAN CARLOS','usr101','pass101'),(102,'MART�NEZ','GARC�A','C�SAR R�MAN','usr102','pass102'),(103,'MARTINEZ','GUERRERO','JOSE ALFREDO','usr103','pass103'),(104,'MARTINEZ','PERALES','JOSE CRUZ','usr104','pass104'),(105,'MARTINEZ','ROSALES','RICARDO ','usr105','pass105'),(106,'MEDINA','MEJIA','VIRGINIA ','usr106','pass106'),(107,'MELARA','ABARCA','REYNA ELIA','usr107','pass107'),(108,'MENDOZA','MACIAS','ELBA ','usr108','pass108'),(109,'MENESES','VIVEROS','AMILCAR ','usr109','pass109'),(110,'MONTES','CASIANO','HERMES FRANCISCO','usr110','pass110'),(111,'MONTIEL','SANCHEZ','ANGEL SALVADOR','usr111','pass111'),(112,'MORALES','CRUZ','JUAN CARLOS','usr112','pass112'),(113,'MORALES','GUITRON','SANDRA LUZ','usr113','pass113'),(114,'MORENO','ARMENDARIZ','MARCO ANTONIO','usr114','pass114'),(115,'MORENO','CERVANTES','AXEL ERNESTO','usr115','pass115'),(116,'MORENO','PE�A','VICTOR RAFAEL','usr116','pass116'),(117,'MOSCOSO','MALAGON','YOSAFAT ','usr117','pass117'),(118,'MOSSO','GARCIA','IVAN GIOVANNY','usr118','pass118'),(119,'MUJICA','ASCENCIO','CESAR ','usr119','pass119'),(120,'MU�OZ','SALAZAR','LAURA ','usr120','pass120'),(121,'NAVA','LARA','JOEL ','usr121','pass121'),(122,'OCOTITLA','ROJAS','NANCY ','usr122','pass122'),(123,'ORTEGA','GONZALEZ','RUBEN ','usr123','pass123'),(124,'ORTEGA','PACHECO','JOSE DAVID','usr124','pass124'),(125,'ORTIGOZA','CAMPOS','LIC. ANDRES','usr125','pass125'),(126,'ORTIZ','RAMIREZ','JOSE ANTONIO','usr126','pass126'),(127,'ORTU�O','ARAUJO','JESUS ','usr127','pass127'),(128,'PALACIOS','SOLANO','ROCIO ','usr128','pass128'),(129,'PALMA','OROZCO','ROSAURA ','usr129','pass129'),(130,'PASTRANA','FERNANDEZ','CARLOS JESUS','usr130','pass130'),(131,'PEREDO','VALDERRAMA','RUBEN ','usr131','pass131'),(132,'PEREZ','DE LOS SANTOS','MONDRAGON TANIBET','usr132','pass132'),(133,'PEREZ','PEREZ','JOSE JUAN','usr133','pass133'),(134,'PEREZ','VERA','MONSERRAT GABRIELA','usr134','pass134'),(135,'PEREZ','VERA','SANDRA MERCEDES','usr135','pass135'),(136,'PUEBLA','LOMAS','JAIME HUGO','usr136','pass136'),(137,'RAMIREZ','ROMERO','TONAHTIU ARTURO','usr137','pass137'),(138,'RAMIREZ','TENORIO','RAFAEL ','usr138','pass138'),(139,'RANGEL','GONZALEZ','JOSUE ','usr139','pass139'),(140,'RANGEL','GUZMAN','ALFREDO ','usr140','pass140'),(141,'RESENDIZ','MU�OZ','ROCIO ','usr141','pass141'),(142,'RIOS','DE LA TORRE','IGNACIO ','usr142','pass142'),(143,'RIVERA','DE LA ROSA','MONICA ','usr143','pass143'),(144,'ROCHA','BERNABE','ROSARIO ','usr144','pass144'),(145,'RODRIGUEZ','FLORES','EDUARDO ','usr145','pass145'),(146,'RODRIGUEZ','ORDAZ','MARISOL ','usr146','pass146'),(147,'RODRIGUEZ','SARABIA','TANIA ','usr147','pass147'),(148,'ROJAS','LUNA','HECTOR ','usr148','pass148'),(149,'ROMERO','HERRERA','RODOLFO ','usr149','pass149'),(150,'ROSAS','TRIGUEROS','JORGE LUIS','usr150','pass150'),(151,'RUEDA','MELENDEZ','MARCO ANTONIO','usr151','pass151'),(152,'RUIZ','LEDESMA','ELENA FABIOLA','usr152','pass152'),(153,'SALAZAR','RAMIREZ','MANUEL ','usr153','pass153'),(154,'SALINAS','HERNANDEZ','ENCARNACION ','usr154','pass154'),(155,'SALINAS','LUGO','SERGIO ','usr155','pass155'),(156,'SANCHEZ','CRUZ','VIRGINIA ','usr156','pass156'),(157,'SANCHEZ','GARCIA','LUZ MARIA','usr157','pass157'),(158,'SANCHEZ','JUAREZ','JOSE ','usr158','pass158'),(159,'SANCHEZ','MORENO','ADRIANA DE LA P','usr159','pass159'),(160,'SANCHEZ','PALACIOS','MARIA SUSANA','usr160','pass160'),(161,'SANCHEZ','QUINTANILLA','GILBERTO ','usr161','pass161'),(162,'SANCHEZ','VARGAS','PERLA REBECA','usr162','pass162'),(163,'SANTILLAN','LUNA','RAUL ','usr163','pass163'),(164,'SAUCEDO','DELGADO','RAFAEL NORMAN','usr164','pass164'),(165,'SERRANO','TALAMANTES','J. FELIX','usr165','pass165'),(166,'SILVA','GARCIA','VICTOR MANUEL','usr166','pass166'),(167,'SILVA','MARTINEZ','JORGE JAVIER','usr167','pass167'),(168,'SOLORZA','GUZMAN','MISAEL ','usr168','pass168'),(169,'SOTO','RAMOS','MANUEL ALEJANDRO','usr169','pass169'),(170,'SUAREZ','CASTA�ON','MIGUEL SANTIAG','usr170','pass170'),(171,'TECLA','PARRA','ROBERTO ','usr171','pass171'),(172,'TELLEZ','BARRERA','JUAN CARLOS','usr172','pass172'),(173,'TELLEZ','REYES','MARIA DEL SOCORRO','usr173','pass173'),(174,'TIRADO','LULE','JUDITH MARGARITA','usr174','pass174'),(175,'TORRES','GONZALEZ','ENRIQUE ','usr175','pass175'),(176,'TORRES','MANRIQUEZ','JUAN JOSE','usr176','pass176'),(177,'VAZQUEZ','ARREGUIN','ROBERTO ','usr177','pass177'),(178,'VAZQUEZ','DE LA ROSA','DANIEL ','usr178','pass178'),(179,'VAZQUEZ','GONZALEZ','LEONOR ','usr179','pass179'),(180,'VEGA','GARCIA','NAYELI ','usr180','pass180'),(181,'VELEZ','SALDA�A','ULISES ','usr181','pass181'),(182,'VILLEGAS','NAVARRETE','SONIA ','usr182','pass182'),(183,'VIVEROS','VELA','KARINA ','usr183','pass183'),(184,'WINFIELD','REYES','ANA MARIA','usr184','pass184'),(185,'YLLANES','MEJIA','BERNARDO ','usr185','pass185'),(186,'Pierre','OUI','OUI','PR','123');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesorhorario`
--

DROP TABLE IF EXISTS `profesorhorario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesorhorario` (
  `cedulaP` int(11) NOT NULL,
  `idGrupo` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEdificio` int(11) NOT NULL,
  `lunes` varchar(5) DEFAULT NULL,
  `martes` varchar(5) DEFAULT NULL,
  `miercoles` varchar(5) DEFAULT NULL,
  `jueves` varchar(5) DEFAULT NULL,
  `viernes` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cedulaP`,`idGrupo`,`idMateria`,`idEdificio`),
  KEY `fk_Profesor_has_Salon_Salon1_idx` (`idGrupo`,`idMateria`,`idEdificio`),
  KEY `fk_Profesor_has_Salon_Profesor1_idx` (`cedulaP`),
  CONSTRAINT `fk_Profesor_has_Salon_Profesor1` FOREIGN KEY (`cedulaP`) REFERENCES `profesor` (`cedulap`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Profesor_has_Salon_Salon1` FOREIGN KEY (`idGrupo`, `idMateria`, `idEdificio`) REFERENCES `salon` (`idgrupo`, `idmateria`, `idedificio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesorhorario`
--

LOCK TABLES `profesorhorario` WRITE;
/*!40000 ALTER TABLE `profesorhorario` DISABLE KEYS */;
INSERT INTO `profesorhorario` VALUES (1,32,57,14,'07:00','','','07:00','08:30'),(1,33,57,15,'','07:00','07:00','','07:00'),(2,27,38,12,'08:30','','08:30','08:30',''),(2,32,38,14,'','10:30','10:30','','10:30'),(2,57,47,18,'10:30','08:30','','10:30',''),(3,28,39,5,'','10:30','10:30','','10:30'),(3,54,1,1,'08:30','','08:30','08:30',''),(4,3,8,9,'10:30','08:30','','10:30',''),(4,9,6,31,'-','07:00','07:00','-','07:00'),(5,31,34,13,'08:30','','08:30','08:30',''),(5,33,34,15,'','10:30','10:30','','10:30'),(6,8,24,30,'08:30','-','08:30','08:30','-'),(6,73,49,38,'12:00','','12:00','12:00',''),(7,48,59,1,'','15:00','15:00','','15:00'),(7,84,65,40,'20:00','','20:00','',''),(8,66,63,8,'13:30','13:30','','13:30',''),(8,67,63,19,'15:00','','','15:00','16:30'),(8,68,63,2,'','15:00','15:00','','15:00'),(9,4,9,10,'12:00','','12:00','12:00',''),(9,14,9,23,'08:30','','08:30','08:30',''),(10,43,50,14,'15:00','','','15:00','16:30'),(10,44,50,15,'','15:00','15:00','','15:00'),(11,45,58,5,'16:30','','16:30','16:30',''),(11,46,58,17,'20:00','','20:00','20:00',''),(11,47,58,18,'','18:30','18:30','','18:30'),(11,67,12,19,'','15:00','15:00','','15:00'),(13,39,16,11,'15:00','','','15:00','16:30'),(13,57,26,18,'','12:00','13:30','','12:00'),(13,65,27,7,'','15:00','15:00','','15:00'),(14,23,24,33,'20:00','','20:00','20:00',''),(14,41,39,12,'','18:30','18:30','','18:30'),(14,65,1,7,'18:30','16:30','','18:30',''),(15,14,8,23,'','07:00','07:00','','07:00'),(16,11,19,33,'-','10:30','10:30','-','10:30'),(16,12,19,21,'12:00','-','12:00','12:00','-'),(16,35,56,17,'10:30','08:30','','10:30',''),(17,2,33,24,'12:00','','12:00','12:00',''),(17,3,9,9,'','10:30','10:30','','10:30'),(18,35,10,17,'','07:00','07:00','','07:00'),(19,49,14,6,'08:30','','08:30','08:30',''),(19,53,14,7,'10:30','08:30','','10:30',''),(19,54,14,1,'07:00','','','07:00','08:30'),(20,27,39,12,'10:30','08:30','','10:30',''),(20,31,39,13,'','10:30','10:30','','10:30'),(21,44,16,15,'','18:30','18:30','','18:30'),(21,62,15,4,'18:30','16:30','','18:30',''),(21,75,64,34,'15:00','','','15:00',''),(22,36,56,2,'','10:30','10:30','','10:30'),(22,37,56,8,'12:00','','12:00','12:00',''),(23,10,45,31,'07:00','-','-','07:00','08:30'),(23,11,45,33,'-','07:00','07:00','-','07:00'),(23,12,45,21,'08:30','-','08:30','08:30','-'),(24,41,34,12,'16:30','','16:30','16:30',''),(24,63,46,6,'20:00','','20:00','20:00',''),(25,3,33,9,'07:00','','','07:00','08:30'),(25,4,33,10,'','07:00','07:00','','07:00'),(26,33,16,15,'10:30','08:30','','10:30',''),(26,61,26,20,'13:30','13:30','','13:30',''),(27,42,50,13,'13:30','13:30','','13:00',''),(27,60,32,35,'','10:30','10:30','','10:30'),(28,38,61,20,'08:30','','08:30','08:30',''),(28,54,13,1,'','07:00','07:00','','07:00'),(28,55,67,3,'10:30','08:30','','10:30',''),(28,57,13,18,'12:00','','12:00','12:00',''),(29,37,10,8,'10:30','08:30','','10:30',''),(29,53,44,7,'','10:30','10:30','','10:30'),(30,35,59,17,'12:00','','12:00','12:00',''),(30,71,28,36,'','07:00','07:00','','07:00'),(30,72,28,37,'08:30','','08:30','08:30',''),(30,74,28,26,'','10:30','10:30','','10:30'),(31,37,59,8,'07:00','','','07:00','08:30'),(31,38,59,20,'','07:00','07:00','','07:00'),(31,81,65,40,'08:30','','08:30','',''),(32,36,58,2,'12:00','','12:00','12:00',''),(32,60,25,35,'08:30','','08:30','08:30',''),(33,16,36,24,'','15:00','15:00','','15:00'),(33,34,57,16,'08:30','','08:30','08:30',''),(33,42,57,13,'15:00','','','15:00','16:30'),(34,24,45,31,'16:30','','16:30','16:30',''),(34,77,49,36,'20:00','','20:00','20:00',''),(35,49,55,6,'','12:00','13:30','','10:00'),(35,56,17,4,'','10:30','10:30','10:30',''),(35,56,43,4,'','10:30','10:30','','10:30'),(36,48,61,1,'16:30','','16:30','16:30',''),(36,75,28,34,'','15:00','15:00','','15:00'),(36,77,28,36,'18:30','16:30','','18:30',''),(36,78,28,37,'','18:30','18:30','','18:30'),(37,5,36,11,'10:30','08:30','','10:30',''),(37,10,6,32,'08:30','-','08:30','08:30','-'),(37,13,6,22,'12:00','-','12:00','12:00','-'),(38,15,19,27,'16:30','','16:30','16:30',''),(38,25,33,22,'','18:30','18:30','','18:30'),(39,31,62,13,'07:00','','','07:00','08:30'),(40,27,62,12,'','12:00','13:30','','12:00'),(41,33,38,15,'12:00','','12:00','12:00',''),(41,50,63,25,'','08:30','','10:30','08:30'),(41,56,63,4,'','12:00','13:30','','12:00'),(41,59,63,34,'08:30','','08:30','08:30',''),(42,36,10,2,'08:30','','08:30','08:30',''),(42,55,44,3,'','12:00','13:30','','12:00'),(43,8,51,30,'12:30','-','12:00','12:00','12:00'),(43,13,51,22,'13:30','10:30','10:30','-','10:30'),(44,4,8,10,'','10:30','10:30','','10:30'),(44,27,34,12,'','07:00','07:00','','07:00'),(44,79,65,40,'07:00','','','07:00',''),(45,17,9,9,'20:00','','20:00','20:00',''),(45,22,19,32,'18:30','16:30','','18:30',''),(45,25,9,22,'16:30','','16:30','16:30',''),(46,73,28,38,'10:30','08:30','','10:30',''),(47,20,37,30,'18:30','16:30','','18:30',''),(47,21,37,21,'','18:30','18:30','','18:30'),(47,26,33,23,'20:00','','20:00','20:00',''),(48,44,3,15,'13:30','13:30','','13:30',''),(48,44,39,15,'15:00','','','15:00','16:30'),(49,71,49,36,'10:30','08:30','','10:30',''),(49,72,49,37,'','10:30','10:30','','10:30'),(50,2,8,24,'08:30','','08:30','08:30',''),(51,24,24,31,'15:00','','','15:00','16:30'),(51,78,49,37,'13:30','13:30','','13:30',''),(52,27,57,12,'12:00','','12:00','12:00',''),(52,31,57,13,'','12:00','13:30','','12:00'),(52,41,57,12,'13:30','13:30','','13:30',''),(53,14,36,23,'12:00','','12:00','12:00',''),(53,53,7,7,'08:30','','08:30','08:30',''),(53,54,7,1,'10:30','08:30','','10:30',''),(54,35,30,17,'08:30','','08:30','08:30',''),(54,38,30,20,'12:00','','12:00','12:00',''),(55,45,3,5,'15:00','','','15:00','16:30'),(55,48,3,1,'','18:30','18:30','','18:30'),(56,49,7,6,'','07:00','07:00','','07:00'),(56,55,7,3,'07:00','','','07:00','08:30'),(57,55,14,3,'','10:30','10:30','','10:30'),(57,62,35,4,'13:30','13:30','','13:30',''),(58,12,6,21,'-','10:30','10:30','-','10:30'),(58,21,6,21,'13:30','13:30','','13:30',''),(58,43,57,14,'','15:00','15:00','','15:00'),(59,20,24,30,'','18:30','18:30','','18:30'),(59,21,24,21,'18:30','16:30','','18:30',''),(59,76,49,35,'15:00','','','15:00','16:30'),(60,20,19,30,'','15:00','15:00','','15:00'),(60,38,56,20,'','12:00','13:30','','12:00'),(61,7,9,29,'08:30','-','08:30','08:30','-'),(61,10,19,32,'10:30','08:30','-','10:30','-'),(62,35,58,17,'','10:30','10:30','','10:30'),(62,57,63,18,'07:00','','','07:00','08:30'),(62,66,47,8,'16:30','','16:30','16:30',''),(62,72,2,37,'','07:00','07:00','','07:00'),(62,74,2,26,'10:30','08:30','','10:30',''),(63,19,9,29,'16:30','','16:30','16:30',''),(63,26,5,23,'','15:00','15:00','','15:00'),(64,1,9,28,'-','07:00','07:00','','07:00'),(64,11,37,33,'07:00','-','-','07:00','08:30'),(65,62,48,4,'','15:00','15:00','','15:00'),(65,63,1,6,'13:30','13:30','','13:30',''),(66,29,58,5,'10:30','08:30','','10:30',''),(67,42,34,13,'18:30','16:30','','18:30',''),(67,61,46,20,'','18:30','18:30','','18:30'),(67,65,46,7,'15:00','','','15:00','16:30'),(68,70,67,36,'','15:00','15:00','','15:00'),(69,41,16,12,'','15:00','15:00','','15:00'),(69,60,31,35,'13:30','13:30','','13:30',''),(69,77,64,36,'15:00','','','15:00',''),(70,46,61,17,'15:00','','','15:00','16:30'),(71,20,45,30,'16:30','','16:30','16:30',''),(71,75,49,34,'18:30','16:30','','18:30',''),(72,41,62,12,'15:00','','','15:00','16:30'),(72,66,21,8,'','15:00','15:00','','15:00'),(72,67,21,19,'16:30','','16:30','16:30',''),(72,68,21,2,'18:30','16:30','','18:30',''),(73,28,16,5,'12:00','','12:00','12:00',''),(73,34,16,16,'','10:30','10:30','','10:30'),(73,82,65,40,'15:00','','','15:00',''),(74,9,51,31,'07:00','12:00','-','07:00','08:30'),(74,10,51,32,'13:30','07:00','07:00','-','07:00'),(75,15,37,27,'18:30','16:30','','18:30',''),(75,19,37,29,'','18:30','18:30','','18:30'),(76,45,59,5,'20:00','','20:00','20:00',''),(76,47,59,18,'15:00','','','15:00','16:30'),(77,1,19,28,'12:00','','12:00','12:00',''),(77,21,19,21,'16:30','','16:30','16:30',''),(78,46,3,17,'18:30','16:30','','18:30',''),(78,75,41,34,'16:30','','16:30','16:30',''),(78,78,41,37,'','15:00','15:00','','15:00'),(78,83,65,40,'','','18:30','','18:30'),(79,41,38,12,'18:30','16:30','','18:30',''),(79,46,30,17,'','15:00','15:00','','15:00'),(80,5,19,11,'','07:00','07:00','','07:00'),(80,7,19,29,'10:30','08:30','-','10:30','-'),(80,71,64,36,'07:00','','','07:00',''),(81,34,62,16,'10:30','08:30','','10:30',''),(81,39,62,11,'13:30','13:30','','13:30',''),(81,59,23,34,'07:00','','','07:00','08:30'),(82,5,33,11,'08:30','','08:30','08:30',''),(82,14,33,23,'','10:30','10:30','','10:30'),(83,19,19,29,'18:30','16:30','','18:30',''),(83,24,19,31,'20:00','','20:00','20:00',''),(84,18,51,10,'15:00','13:30','','15:00','16:30'),(84,69,23,3,'','15:00','15:00','','15:00'),(85,22,24,32,'','18:30','18:30','','18:30'),(86,23,37,33,'15:00','','','15:00','16:30'),(86,24,37,31,'','15:00','15:00','','15:00'),(87,43,38,14,'20:00','','20:00','20:00',''),(87,45,30,5,'','18:30','18:30','','18:30'),(87,65,14,7,'13:30','13:30','','13:30',''),(88,33,50,15,'07:00','','','07:00','08:30'),(88,34,50,16,'','07:00','07:00','','07:00'),(89,42,38,13,'','18:30','18:30','','18:30'),(89,48,30,1,'20:00','','20:00','20:00',''),(90,50,44,25,'','10:30','10:30','','10:30'),(91,36,30,2,'10:30','08:30','','10:30',''),(91,37,30,8,'','10:30','10:30','','10:30'),(92,51,42,19,'','10:30','10:30','','10:30'),(92,56,52,4,'12:00','','12:00','12:00',''),(92,59,52,34,'','12:00','13:30','','12:00'),(93,45,10,5,'','15:00','15:00','','15:00'),(93,45,61,5,'13:30','13:30','','13:30',''),(93,50,15,25,'12:00','','12:00','12:00',''),(94,26,36,23,'15:00','','','15:00','16:30'),(94,61,7,20,'','15:00','15:00','','15:00'),(94,63,7,6,'16:30','','16:30','16:30',''),(95,64,11,16,'15:00','','','15:00','16:30'),(96,73,41,38,'08:30','','08:30','08:30',''),(96,74,41,26,'12:00','','12:00','12:00',''),(96,80,65,40,'','','07:00','','07:00'),(97,45,56,5,'18:30','16:30','','18:30',''),(97,47,56,18,'20:00','','20:00','20:00',''),(98,22,37,32,'20:00','','20:00','20:00',''),(98,23,19,33,'','18:30','18:30','','18:30'),(99,52,52,19,'08:30','','08:30','08:30',''),(99,57,52,18,'','07:00','07:00','','07:00'),(99,60,52,35,'07:00','','','07:30','08:30'),(100,1,45,28,'-','10:30','10:30','','10:30'),(100,9,45,31,'12:00','-','12:00','12:00',''),(100,15,45,27,'13:30','13:30','','','13:30'),(100,73,64,38,'','12:00','13:30','',''),(101,32,34,14,'10:30','08:30','','10:30',''),(101,34,34,16,'12:00','','12:00','12:00',''),(101,49,46,6,'','10:30','10:30','','10:30'),(102,7,37,29,'-','10:30','10:30','-','10:30'),(102,12,37,21,'-','07:00','07:00','-','07:00'),(103,18,8,10,'20:00','','20:00','20:00',''),(103,26,8,23,'16:30','','16:30','16:30',''),(103,43,34,14,'','18:30','18:30','','18:30'),(104,39,39,11,'18:30','16:30','','18:30',''),(104,69,52,3,'13:30','13:30','','13:30',''),(105,56,12,4,'07:00','','','07:00','08:30'),(106,66,52,8,'18:30','16:30','','18:30',''),(106,67,52,19,'','18:30','18:30','','18:30'),(106,68,52,2,'20:00','','20:00','20:00',''),(107,38,10,20,'','10:30','10:30','','10:30'),(107,46,10,17,'13:30','13:30','','13:30',''),(107,54,44,1,'12:00','','12:00','12:00',''),(108,38,3,20,'10:30','08:30','','10:30',''),(108,54,48,1,'','10:30','10:30','','10:30'),(108,71,41,36,'08:30','','08:30','08:30',''),(109,60,54,35,'10:30','08:30','','10:30',''),(110,50,66,19,'','12:00','13:30','','12:00'),(110,64,66,16,'','15:00','15:00','','15:00'),(110,76,28,35,'16:30','','16:30','16:30',''),(111,21,51,21,'15:00','','13:30','15:00','16:30'),(111,48,56,1,'13:30','13:30','','13:30',''),(112,39,38,11,'16:30','','16:30','16:30',''),(112,67,47,19,'18:30','16:30','','18:30',''),(112,68,47,2,'','18:30','18:30','','18:30'),(113,56,40,4,'10:30','08:30','','10:30',''),(114,49,53,6,'12:00','','12:00','12:00',''),(115,28,58,5,'','07:00','07:00','','07:00'),(115,59,12,19,'12:00','','12:00','12:00',''),(115,59,12,34,'10:30','08:30','','10:30',''),(116,7,51,29,'07:00','12:00','-','07:00','08:30'),(117,18,36,10,'18:30','16:30','','18:30',''),(117,24,6,31,'','18:30','18:30','','18:30'),(117,25,36,22,'20:00','','20:00','20:00',''),(118,1,51,28,'08:30','12:00','08:30','08:30',''),(118,51,4,39,'07:00','','','',''),(118,51,13,39,'','','','','13:30'),(118,51,15,39,'13:30','','','',''),(118,51,23,39,'','','','13:30',''),(118,51,26,39,'','','','07:00',''),(118,51,27,39,'','','','','13:30'),(118,51,29,39,'','','13:30','',''),(118,51,35,39,'','','','','13:30'),(118,51,43,39,'','','','','07:00'),(118,51,53,39,'07:00','','','',''),(118,51,54,39,'','07:00','','',''),(118,51,55,39,'','','07:00','',''),(119,34,38,16,'','12:00','13:30','','12:00'),(120,8,37,30,'10:30','08:30','-','10:30','-'),(120,10,37,32,'12:00','-','12:00','12:00','-'),(120,16,20,24,'13:30','13:30','','13:30',''),(121,22,51,32,'','15:00','15:00','','1:30'),(121,23,51,33,'16:30','13:30','16:30','16:30',''),(122,31,16,13,'','07:00','07:00','','07:00'),(122,32,16,14,'08:30','','08:30','08:30',''),(123,53,46,7,'12:00','','12:00','12:00',''),(124,36,59,2,'','12:00','13:30','','12:00'),(124,63,44,6,'','15:00','15:00','','15:00'),(125,57,21,18,'08:30','','08:30','08:30',''),(126,35,61,17,'','12:00','13:30','','12:00'),(127,15,9,27,'','18:30','18:30','','18:30'),(127,16,9,24,'20:00','','20:00','20:00',''),(127,25,5,22,'15:00','','','15:00','16:30'),(127,26,9,23,'18:30','16:30','','18:30',''),(128,61,48,20,'18:30','16:30','','18:30',''),(129,42,62,13,'','15:00','15:00','','15:00'),(129,62,22,4,'15:00','','','15:00','16:30'),(130,47,30,18,'13:30','13:30','','13:30',''),(131,36,61,2,'07:00','','','07:00','08:30'),(131,37,61,8,'','07:00','07:00','','07:00'),(132,71,2,36,'','12:00','13:30','','12:00'),(132,73,2,38,'','10:30','10:30','','10:30'),(133,31,38,13,'10:30','08:30','','10:30',''),(133,56,47,4,'08:30','','08:30','08:30',''),(133,59,47,34,'12:00','','12:00','12:00',''),(133,60,47,19,'07:00','','','07:00','08:30'),(134,8,45,30,'-','10:30','10:30','-','10:30'),(134,13,45,22,'10:30','08:30','-','10:30','-'),(134,74,49,26,'07:00','','','07:00','08:30'),(135,12,24,21,'07:00','-','-','07:00','08:30'),(135,13,24,22,'','07:00','7;00','-','07:00'),(136,48,58,1,'15:00','','','15:00','16:30'),(136,60,63,35,'12:00','','12:00','12:00',''),(136,69,63,3,'16:30','','16:30','16:30',''),(137,20,6,30,'15:00','','','15:00','16:30'),(137,22,6,32,'16:30','','16:30','16:30',''),(137,64,7,16,'18:30','16:30','','18:30',''),(138,33,3,15,'','12:00','13:30','','12:00'),(138,35,3,17,'07:00','','','07:00','08:30'),(138,36,3,2,'','07:00','07:00','','07:00'),(139,46,59,17,'16:30','','16:30','16:30',''),(139,66,12,8,'15:00','','','15:00','16:30'),(139,69,12,3,'18:30','16:30','','18:30',''),(139,76,2,35,'','18:30','18:30','','18:30'),(140,25,20,22,'18:30','16:30','','18:30',''),(140,39,50,11,'','18:30','18:30','','18:30'),(140,40,56,35,'','15:00','15:00','','15:00'),(140,41,50,12,'20:00','','20:00','20:00',''),(141,4,36,10,'08:30','','08:30','08:30',''),(141,11,6,33,'10:30','08:30','-','10:30','-'),(141,76,64,35,'13:30','13:30','','',''),(142,3,5,9,'08:30','','08:30','08:30',''),(142,27,50,12,'','10:30','10:30','','10:30'),(142,32,50,14,'','12:00','13:30','','12:00'),(143,53,66,7,'07:00','','','07:00','08:30'),(143,59,60,34,'','07:00','07:00','','07:00'),(143,72,64,37,'','','12:00','12:00',''),(144,5,8,11,'12:00','','12:00','12:00',''),(144,54,46,1,'','12:00','13:30','','12:00'),(145,37,3,8,'08:30','','08:30','08:30',''),(145,53,1,7,'','07:00','07:00','','07:00'),(145,55,1,3,'12:00','','12:00','12:00',''),(146,76,41,35,'18:30','16:30','','18:30',''),(147,42,16,13,'16:30','','16:30','16:30',''),(147,43,16,14,'18:30','16:30','','18:30',''),(148,5,9,11,'','12:00','13:30','','12:00'),(148,5,20,11,'','10:30','10:30','','10:30'),(149,25,8,22,'','15:00','15:00','','15:00'),(150,43,62,14,'16:30','','16:30','16:30',''),(150,69,18,3,'15:00','','','15:00','16:30'),(151,1,6,28,'07:00','','-','07:00','08:30'),(151,3,36,9,'','07:00','07:00','','07:00'),(152,3,20,9,'12:00','','12:00','12:00',''),(152,28,56,5,'07:00','','','07:00','08:30'),(153,26,20,23,'','18:30','18:30','','18:30'),(154,8,19,30,'-','07:00','07:00','-','07:00'),(154,13,19,22,'07:00','-','-','07:00','08:30'),(155,27,16,12,'07:00','','','07:00','08:30'),(155,55,31,3,'','07:00','07:00','','07:00'),(156,32,39,14,'12:00','','12:00','12:00',''),(156,49,1,6,'10:30','08:30','','10:30',''),(156,77,41,36,'13:30','13:30','','13:30',''),(157,30,62,5,'12:00','','12:00','12:00',''),(157,33,62,15,'08:30','','08:30','08:30',''),(158,2,36,24,'07:00','','','07:00','08:30'),(158,56,21,4,'','07:00','07:00','','07:00'),(159,7,45,29,'12:00','-','12:00','12:00','-'),(159,10,24,32,'-','10:30','10:30','-','10:30'),(160,11,51,33,'08:30','12:00','08:30','08:30','-'),(160,12,51,21,'10:30','08:30','-','10:30','12:00'),(161,37,58,8,'','12:00','13:30','','12:00'),(161,38,58,20,'07:00','','','07:00','08:30'),(161,57,12,18,'','10:30','10:30','','10:30'),(162,13,37,22,'08:30','-','08:30','08:30','-'),(162,14,5,23,'07:00','','','07:00','08:30'),(162,15,51,27,'','15:00','15:00','13:30','15:00'),(162,19,51,29,'15:00','13:30','','15:00','16:30'),(163,16,8,24,'18:30','16:30','','18:30',''),(163,17,8,9,'','18:30','18:30','','18:30'),(163,39,34,11,'','15:00','15:00','','15:00'),(164,15,6,27,'15:00','','','15:00','16:30'),(164,19,6,29,'','15:00','15:00','','15:00'),(164,44,62,15,'18:30','16:30','','18:30',''),(164,65,7,7,'','18:30','18:30','','18:30'),(165,65,43,7,'16:30','','16:30','16:30',''),(166,68,25,2,'15:00','','','15:00','16:30'),(167,16,33,24,'15:00','','','15:00','16:30'),(167,17,33,9,'','15:00','15:00','','15:00'),(167,18,33,10,'16:30','','16:30','16:30',''),(168,1,37,28,'10:30','08:30','-','10:30',''),(168,2,5,24,'','07:00','07:00','','07:00'),(168,9,37,31,'-','10:30','10:30','-','10:30'),(169,75,2,34,'20:00','','20:00','20:00',''),(169,77,2,36,'16:30','','16:30','16:30',''),(169,78,2,37,'18:30','16:30','','18:30',''),(170,17,36,9,'16:30','','16:30','16:30',''),(170,23,6,33,'18:30','16:30','','18:30',''),(171,7,6,29,'-','07:00','07:00','-','07:00'),(171,8,6,30,'07:00','-','-','07:00','07:00'),(171,58,21,19,'10:30','08:30','','10:30',''),(171,59,21,34,'','10:30','10:30','','10:30'),(172,55,46,3,'08:30','','08:30','08:30',''),(172,64,46,16,'13:30','13:30','','13:30',''),(173,9,24,31,'10:30','08:30','-','10:30','-'),(173,11,24,33,'12:00','-','12:00','12:00','-'),(174,16,5,24,'16:30','','16:30','16:30',''),(174,17,5,9,'18:30','16:30','','18:30',''),(175,34,39,16,'07:00','','','07:00','08:30'),(175,43,39,14,'13:30','13:30','','13:30',''),(175,72,41,37,'10:30','08:30','','10:30',''),(176,4,5,10,'10:30','08:30','','10:30',''),(176,31,50,13,'12:00','','12:00','12;00',''),(177,2,9,24,'10:30','08:30','','10:30',''),(177,6,5,36,'','10:30','10:30','','10:30'),(178,39,57,11,'20:00','','20:00','20:00',''),(178,44,57,15,'16:30','','16:30','16:30',''),(179,20,51,30,'20:00','','20:00','20:00','20:00'),(179,24,51,31,'','16:30','','18:30',''),(180,61,14,20,'16:30','','16:30','16:30',''),(180,63,14,6,'18:30','16:30','','18:30',''),(180,64,14,16,'','18:30','18:30','','18:30'),(181,47,10,18,'','15:00','15:00','','15:00'),(181,48,10,1,'18:30','16:30','','18:30',''),(181,64,44,16,'20:00','','20:00','20:00',''),(181,67,13,19,'13:30','13:30','','13:30',''),(182,21,45,21,'','15:00','15:00','','15:00'),(182,42,39,13,'20:00','','20:00','20:00',''),(182,61,1,20,'15:00','','','15:00','16:30'),(182,64,1,16,'16:30','','16:30','16:30',''),(183,2,20,24,'','10:30','10:30','','10:30'),(183,9,19,31,'08:30','-','08:30','08:30','-'),(183,14,20,23,'10:30','08:30','','10:30',''),(184,22,45,32,'15:00','','','15:00','16:30'),(184,23,45,33,'','15:00','15:00','','15:00'),(185,19,45,29,'20:00','','20:00','20:00',''),(185,47,3,18,'16:30','','16:30','16:30','');
/*!40000 ALTER TABLE `profesorhorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `profesorhorario_vista`
--

DROP TABLE IF EXISTS `profesorhorario_vista`;
/*!50001 DROP VIEW IF EXISTS `profesorhorario_vista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `profesorhorario_vista` AS SELECT 
 1 AS `cedulaP`,
 1 AS `idgrupo`,
 1 AS `idMateria`,
 1 AS `idEdificio`,
 1 AS `nombrefull`,
 1 AS `nombreGrupo`,
 1 AS `nombreMateria`,
 1 AS `numSalon`,
 1 AS `lunes`,
 1 AS `martes`,
 1 AS `miercoles`,
 1 AS `jueves`,
 1 AS `viernes`,
 1 AS `apPat`,
 1 AS `apMat`,
 1 AS `nombre`,
 1 AS `usuario`,
 1 AS `contrasena`,
 1 AS `numEdificio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservacionalumno`
--

DROP TABLE IF EXISTS `reservacionalumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservacionalumno` (
  `idGrupo` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEdificio` int(11) NOT NULL,
  `boleta` int(11) NOT NULL,
  `proposito` varchar(45) DEFAULT NULL,
  `horaInicio` varchar(45) DEFAULT NULL,
  `horaFin` varchar(45) DEFAULT NULL,
  `cantidadPers` int(11) DEFAULT NULL,
  `compartir` int(11) DEFAULT NULL,
  `disponible` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGrupo`,`idMateria`,`idEdificio`,`boleta`),
  KEY `fk_Salon_has_Alumno_Alumno2_idx` (`boleta`),
  KEY `fk_Salon_has_Alumno_Salon2_idx` (`idGrupo`,`idMateria`,`idEdificio`),
  CONSTRAINT `fk_Salon_has_Alumno_Alumno2` FOREIGN KEY (`boleta`) REFERENCES `alumno` (`boleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Salon_has_Alumno_Salon2` FOREIGN KEY (`idGrupo`, `idMateria`, `idEdificio`) REFERENCES `salon` (`idgrupo`, `idmateria`, `idedificio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacionalumno`
--

LOCK TABLES `reservacionalumno` WRITE;
/*!40000 ALTER TABLE `reservacionalumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservacionalumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacionprofesor`
--

DROP TABLE IF EXISTS `reservacionprofesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservacionprofesor` (
  `idGrupo` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEdificio` int(11) NOT NULL,
  `cedulaP` int(11) NOT NULL,
  `proposito` varchar(45) DEFAULT NULL,
  `horaInicio` varchar(45) DEFAULT NULL,
  `horaFin` varchar(45) DEFAULT NULL,
  `cantidadPers` int(11) DEFAULT NULL,
  `compartir` int(11) DEFAULT NULL,
  `disponible` int(11) DEFAULT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idGrupo`,`idMateria`,`idEdificio`,`cedulaP`,`idAdmin`),
  KEY `fk_Salon_has_Profesor_Profesor1_idx` (`cedulaP`),
  KEY `fk_Salon_has_Profesor_Salon1_idx` (`idGrupo`,`idMateria`,`idEdificio`),
  KEY `fk_ReservacionProfesor_Administrador1_idx` (`idAdmin`),
  CONSTRAINT `fk_ReservacionProfesor_Administrador1` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idadmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Salon_has_Profesor_Profesor1` FOREIGN KEY (`cedulaP`) REFERENCES `profesor` (`cedulap`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Salon_has_Profesor_Salon1` FOREIGN KEY (`idGrupo`, `idMateria`, `idEdificio`) REFERENCES `salon` (`idgrupo`, `idmateria`, `idedificio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacionprofesor`
--

LOCK TABLES `reservacionprofesor` WRITE;
/*!40000 ALTER TABLE `reservacionprofesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservacionprofesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salon` (
  `idGrupo` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEdificio` int(11) NOT NULL,
  PRIMARY KEY (`idGrupo`,`idMateria`,`idEdificio`),
  KEY `fk_Grupo_has_Materia_Materia1_idx` (`idMateria`),
  KEY `fk_Grupo_has_Materia_Grupo1_idx` (`idGrupo`),
  KEY `fk_Salon_Edificio1_idx` (`idEdificio`),
  CONSTRAINT `fk_Grupo_has_Materia_Grupo1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Grupo_has_Materia_Materia1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Salon_Edificio1` FOREIGN KEY (`idEdificio`) REFERENCES `edificio` (`idedificio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES (49,1,6),(53,1,7),(54,1,1),(55,1,3),(61,1,20),(63,1,6),(64,1,16),(65,1,7),(71,2,36),(72,2,37),(73,2,38),(74,2,26),(75,2,34),(76,2,35),(77,2,36),(78,2,37),(33,3,15),(35,3,17),(36,3,2),(37,3,8),(38,3,20),(44,3,15),(45,3,5),(46,3,17),(47,3,18),(48,3,1),(51,4,39),(2,5,24),(3,5,9),(4,5,10),(6,5,36),(14,5,23),(16,5,24),(17,5,9),(25,5,22),(26,5,23),(1,6,28),(7,6,29),(8,6,30),(9,6,31),(10,6,32),(11,6,33),(12,6,21),(13,6,22),(15,6,27),(19,6,29),(20,6,30),(21,6,21),(22,6,32),(23,6,33),(24,6,31),(49,7,6),(53,7,7),(54,7,1),(55,7,3),(61,7,20),(63,7,6),(64,7,16),(65,7,7),(2,8,24),(3,8,9),(4,8,10),(5,8,11),(14,8,23),(16,8,24),(17,8,9),(18,8,10),(25,8,22),(26,8,23),(1,9,28),(2,9,24),(3,9,9),(4,9,10),(5,9,11),(7,9,29),(14,9,23),(15,9,27),(16,9,24),(17,9,9),(19,9,29),(25,9,22),(26,9,23),(35,10,17),(36,10,2),(37,10,8),(38,10,20),(45,10,5),(46,10,17),(47,10,18),(48,10,1),(64,11,16),(56,12,4),(57,12,18),(59,12,19),(59,12,34),(66,12,8),(67,12,19),(69,12,3),(51,13,39),(54,13,1),(57,13,18),(67,13,19),(49,14,6),(53,14,7),(54,14,1),(55,14,3),(61,14,20),(63,14,6),(64,14,16),(65,14,7),(50,15,25),(51,15,39),(62,15,4),(27,16,12),(28,16,5),(31,16,13),(32,16,14),(33,16,15),(34,16,16),(39,16,11),(41,16,12),(42,16,13),(43,16,14),(44,16,15),(56,17,4),(69,18,3),(1,19,28),(5,19,11),(7,19,29),(8,19,30),(9,19,31),(10,19,32),(11,19,33),(12,19,21),(13,19,22),(15,19,27),(19,19,29),(20,19,30),(21,19,21),(22,19,32),(23,19,33),(24,19,31),(2,20,24),(3,20,9),(5,20,11),(14,20,23),(16,20,24),(25,20,22),(26,20,23),(56,21,4),(57,21,18),(58,21,19),(59,21,34),(66,21,8),(67,21,19),(68,21,2),(62,22,4),(51,23,39),(59,23,34),(69,23,3),(8,24,30),(9,24,31),(10,24,32),(11,24,33),(12,24,21),(13,24,22),(20,24,30),(21,24,21),(22,24,32),(23,24,33),(24,24,31),(60,25,35),(68,25,2),(51,26,39),(57,26,18),(61,26,20),(51,27,39),(65,27,7),(71,28,36),(72,28,37),(73,28,38),(74,28,26),(75,28,34),(76,28,35),(77,28,36),(78,28,37),(51,29,39),(35,30,17),(36,30,2),(37,30,8),(38,30,20),(45,30,5),(46,30,17),(47,30,18),(48,30,1),(55,31,3),(60,31,35),(60,32,35),(2,33,24),(3,33,9),(4,33,10),(5,33,11),(14,33,23),(16,33,24),(17,33,9),(18,33,10),(25,33,22),(26,33,23),(27,34,12),(31,34,13),(32,34,14),(33,34,15),(34,34,16),(39,34,11),(41,34,12),(42,34,13),(43,34,14),(51,35,39),(62,35,4),(2,36,24),(3,36,9),(4,36,10),(5,36,11),(14,36,23),(16,36,24),(17,36,9),(18,36,10),(25,36,22),(26,36,23),(1,37,28),(7,37,29),(8,37,30),(9,37,31),(10,37,32),(11,37,33),(12,37,21),(13,37,22),(15,37,27),(19,37,29),(20,37,30),(21,37,21),(22,37,32),(23,37,33),(24,37,31),(27,38,12),(31,38,13),(32,38,14),(33,38,15),(34,38,16),(39,38,11),(41,38,12),(42,38,13),(43,38,14),(27,39,12),(28,39,5),(31,39,13),(32,39,14),(34,39,16),(39,39,11),(41,39,12),(42,39,13),(43,39,14),(44,39,15),(56,40,4),(71,41,36),(72,41,37),(73,41,38),(74,41,26),(75,41,34),(76,41,35),(77,41,36),(78,41,37),(51,42,19),(51,43,39),(56,43,4),(65,43,7),(50,44,25),(53,44,7),(54,44,1),(55,44,3),(63,44,6),(64,44,16),(1,45,28),(7,45,29),(8,45,30),(9,45,31),(10,45,31),(11,45,33),(12,45,21),(13,45,22),(15,45,27),(19,45,29),(20,45,30),(21,45,21),(22,45,32),(23,45,33),(24,45,31),(49,46,6),(53,46,7),(54,46,1),(55,46,3),(61,46,20),(63,46,6),(64,46,16),(65,46,7),(56,47,4),(57,47,18),(59,47,34),(60,47,19),(66,47,8),(67,47,19),(68,47,2),(54,48,1),(61,48,20),(62,48,4),(71,49,36),(72,49,37),(73,49,38),(74,49,26),(75,49,34),(76,49,35),(77,49,36),(78,49,37),(27,50,12),(31,50,13),(32,50,14),(33,50,15),(34,50,16),(39,50,11),(41,50,12),(42,50,13),(43,50,14),(44,50,15),(1,51,28),(7,51,29),(8,51,30),(9,51,31),(10,51,32),(11,51,33),(12,51,21),(13,51,22),(15,51,27),(18,51,10),(19,51,29),(20,51,30),(21,51,21),(22,51,32),(23,51,33),(24,51,31),(52,52,19),(56,52,4),(57,52,18),(59,52,34),(60,52,35),(66,52,8),(67,52,19),(68,52,2),(69,52,3),(49,53,6),(51,53,39),(51,54,39),(60,54,35),(49,55,6),(51,55,39),(28,56,5),(35,56,17),(36,56,2),(37,56,8),(38,56,20),(40,56,35),(45,56,5),(47,56,18),(48,56,1),(27,57,12),(31,57,13),(32,57,14),(33,57,15),(34,57,16),(39,57,11),(41,57,12),(42,57,13),(43,57,14),(44,57,15),(28,58,5),(29,58,5),(35,58,17),(36,58,2),(37,58,8),(38,58,20),(45,58,5),(46,58,17),(47,58,18),(48,58,1),(35,59,17),(36,59,2),(37,59,8),(38,59,20),(45,59,5),(46,59,17),(47,59,18),(48,59,1),(59,60,34),(35,61,17),(36,61,2),(37,61,8),(38,61,20),(45,61,5),(46,61,17),(48,61,1),(27,62,12),(30,62,5),(31,62,13),(33,62,15),(34,62,16),(39,62,11),(41,62,12),(42,62,13),(43,62,14),(44,62,15),(50,63,25),(56,63,4),(57,63,18),(59,63,34),(60,63,35),(66,63,8),(67,63,19),(68,63,2),(69,63,3),(71,64,36),(72,64,37),(73,64,38),(75,64,34),(76,64,35),(77,64,36),(79,65,40),(80,65,40),(81,65,40),(82,65,40),(83,65,40),(84,65,40),(50,66,19),(53,66,7),(64,66,16),(55,67,3),(70,67,36);
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movilesdb'
--

--
-- Dumping routines for database 'movilesdb'
--

--
-- Final view structure for view `disponibilidad`
--

/*!50001 DROP VIEW IF EXISTS `disponibilidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disponibilidad` AS select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`a`.`ordenadia` AS `ordenadia`,`a`.`nombredia` AS `nombredia`,`a`.`horaInicio` AS `horaInicio`,`a`.`horaFin` AS `horaFin` from (`lunavie` `a` left join `profesorhorario_vista` `b` on(((`a`.`horaInicio` = `b`.`lunes`) and (`a`.`numSalon` = `b`.`numSalon`)))) where ((`a`.`nombredia` = 'LUNES') and isnull(`b`.`idMateria`)) union select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`a`.`ordenadia` AS `ordenadia`,`a`.`nombredia` AS `nombredia`,`a`.`horaInicio` AS `horaInicio`,`a`.`horaFin` AS `horaFin` from (`lunavie` `a` left join `profesorhorario_vista` `b` on(((`a`.`horaInicio` = `b`.`martes`) and (`a`.`numSalon` = `b`.`numSalon`)))) where ((`a`.`nombredia` = 'MARTES') and isnull(`b`.`idMateria`)) union select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`a`.`ordenadia` AS `ordenadia`,`a`.`nombredia` AS `nombredia`,`a`.`horaInicio` AS `horaInicio`,`a`.`horaFin` AS `horaFin` from (`lunavie` `a` left join `profesorhorario_vista` `b` on(((`a`.`horaInicio` = `b`.`miercoles`) and (`a`.`numSalon` = `b`.`numSalon`)))) where ((`a`.`nombredia` = 'MIERCOLES') and isnull(`b`.`idMateria`)) union select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`a`.`ordenadia` AS `ordenadia`,`a`.`nombredia` AS `nombredia`,`a`.`horaInicio` AS `horaInicio`,`a`.`horaFin` AS `horaFin` from (`lunavie` `a` left join `profesorhorario_vista` `b` on(((`a`.`horaInicio` = `b`.`jueves`) and (`a`.`numSalon` = `b`.`numSalon`)))) where ((`a`.`nombredia` = 'JUEVES') and isnull(`b`.`idMateria`)) union select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`a`.`ordenadia` AS `ordenadia`,`a`.`nombredia` AS `nombredia`,`a`.`horaInicio` AS `horaInicio`,`a`.`horaFin` AS `horaFin` from (`lunavie` `a` left join `profesorhorario_vista` `b` on(((`a`.`horaInicio` = `b`.`viernes`) and (`a`.`numSalon` = `b`.`numSalon`)))) where ((`a`.`nombredia` = 'VIERNES') and isnull(`b`.`idMateria`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lunavie`
--

/*!50001 DROP VIEW IF EXISTS `lunavie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lunavie` AS select `a`.`idEdificio` AS `idEdificio`,`a`.`numEdificio` AS `numEdificio`,`a`.`numSalon` AS `numSalon`,`b`.`idhoras` AS `idhoras`,`b`.`ordenadia` AS `ordenadia`,`b`.`nombredia` AS `nombredia`,`b`.`horaInicio` AS `horaInicio`,`b`.`horaFin` AS `horaFin` from (`edificio` `a` join `horas` `b`) order by `a`.`numSalon`,`b`.`ordenadia`,`b`.`horaInicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profesorhorario_vista`
--

/*!50001 DROP VIEW IF EXISTS `profesorhorario_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profesorhorario_vista` AS select `a`.`cedulaP` AS `cedulaP`,`a`.`idGrupo` AS `idgrupo`,`a`.`idMateria` AS `idMateria`,`a`.`idEdificio` AS `idEdificio`,concat(`b`.`apPat`,' ',`b`.`apMat`,' ',`b`.`nombre`) AS `nombrefull`,`c`.`nombreGrupo` AS `nombreGrupo`,`d`.`nombreMateria` AS `nombreMateria`,`e`.`numSalon` AS `numSalon`,`a`.`lunes` AS `lunes`,`a`.`martes` AS `martes`,`a`.`miercoles` AS `miercoles`,`a`.`jueves` AS `jueves`,`a`.`viernes` AS `viernes`,`b`.`apPat` AS `apPat`,`b`.`apMat` AS `apMat`,`b`.`nombre` AS `nombre`,`b`.`usuario` AS `usuario`,`b`.`contrasena` AS `contrasena`,`e`.`numEdificio` AS `numEdificio` from ((((`profesorhorario` `a` join `profesor` `b`) join `grupo` `c`) join `materia` `d`) join `edificio` `e`) where ((`a`.`cedulaP` = `b`.`cedulaP`) and (`a`.`idGrupo` = `c`.`idGrupo`) and (`a`.`idMateria` = `d`.`idMateria`) and (`a`.`idEdificio` = `e`.`idEdificio`)) order by `a`.`cedulaP`,`a`.`idGrupo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12  0:22:01
