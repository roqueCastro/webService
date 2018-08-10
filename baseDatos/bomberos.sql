-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.97.128.75    Database: bomberos
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_contacto` varchar(50) DEFAULT NULL,
  `encuesta1` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `fk_enc_contacto` (`encuesta1`),
  CONSTRAINT `fk_enc_contacto` FOREIGN KEY (`encuesta1`) REFERENCES `encuesta` (`id_encuesta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `id_encuesta` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_encta` varchar(80) DEFAULT NULL,
  `est_encta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'INCENDIO',1),(2,'FUGA DE GAS',1),(3,'ACCIDENTE DE TRANSITO',1);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `encuesta` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_encuesta_idx` (`encuesta`),
  KEY `fk_usuario_evento_idx` (`usuario`),
  CONSTRAINT `fk_evento_encuesta` FOREIGN KEY (`encuesta`) REFERENCES `encuesta` (`id_encuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_evento` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id_pgta` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_pgta` varchar(80) DEFAULT NULL,
  `estado_pgta` int(11) DEFAULT NULL,
  `tipo_pregunta` int(11) DEFAULT NULL,
  `encuesta2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pgta`),
  KEY `fk_pgta_tipo_pgta_idx` (`tipo_pregunta`),
  KEY `fk_encta_pgta_idx` (`encuesta2`),
  CONSTRAINT `fk_encta_pgta` FOREIGN KEY (`encuesta2`) REFERENCES `encuesta` (`id_encuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pgta_tipo_pgta` FOREIGN KEY (`tipo_pregunta`) REFERENCES `tipo_pregunta` (`id_tipo_pgta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (2,'¿Que causo el incendio?',1,2,1),(3,'¿Cuantas personas afectadas?',1,2,1),(4,'¿Se requiere servicio de ambulancia?',1,2,1),(5,'¿Diametro de la fuga?',1,1,2),(6,'¿Cuantos heridos?',1,1,3),(7,'¿Casas afectadas?',1,1,1),(8,'¿Otro?',1,1,3);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `id_rpta` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_rpta` varchar(45) DEFAULT NULL,
  `estado_rpta` int(11) DEFAULT NULL,
  `pregunta` int(11) DEFAULT NULL,
  `tipo_pregunta` enum('numerico','texto','multiple') DEFAULT NULL,
  PRIMARY KEY (`id_rpta`),
  KEY `fk_pgta_rpta_idx` (`pregunta`),
  CONSTRAINT `fk_pgta_rpta` FOREIGN KEY (`pregunta`) REFERENCES `pregunta` (`id_pgta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,'Corto circuito',1,2,'multiple'),(2,'Quimicos',1,2,'multiple'),(3,'Una vela',1,2,'multiple'),(4,'Cigarros',1,2,'multiple'),(5,'Calefaccion  o chimenas',1,2,'multiple'),(6,'si',1,4,'multiple'),(7,'no',1,4,'multiple'),(8,'Entre (1-5)',1,3,'multiple'),(9,'Entre (6-20)',1,3,'multiple'),(10,'Entre (+20)',1,3,'multiple'),(11,'Numero de heridos',1,6,'texto'),(12,'Numero de casas',1,7,'numerico');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultado` (
  `id_resultado` int(11) NOT NULL AUTO_INCREMENT,
  `evento` int(11) NOT NULL,
  `resultado` varchar(60) DEFAULT NULL,
  `respuesta` int(11) NOT NULL,
  PRIMARY KEY (`id_resultado`),
  UNIQUE KEY `uniq_resultado` (`resultado`,`evento`),
  KEY `fk_resul_rpta_idx` (`respuesta`),
  KEY `fk_resul_event_idx` (`evento`),
  CONSTRAINT `fk_resul_event` FOREIGN KEY (`evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resul_resp` FOREIGN KEY (`respuesta`) REFERENCES `respuesta` (`id_rpta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pregunta`
--

DROP TABLE IF EXISTS `tipo_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pregunta` (
  `id_tipo_pgta` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_tipo_pgta` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pgta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pregunta`
--

LOCK TABLES `tipo_pregunta` WRITE;
/*!40000 ALTER TABLE `tipo_pregunta` DISABLE KEYS */;
INSERT INTO `tipo_pregunta` VALUES (1,'Pregunta Abierta'),(2,'Pregunta Opcion Multiple ');
/*!40000 ALTER TABLE `tipo_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `login` varchar(12) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,123,'wilson','123','123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-06 14:05:51
