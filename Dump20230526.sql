CREATE DATABASE  IF NOT EXISTS `Escuela` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Escuela`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: Escuela
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alumno` (
  `NumControl` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido1` varchar(50) DEFAULT NULL,
  `Apellido2` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Municipio` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `CodigoPostal` int DEFAULT NULL,
  `Calle` varchar(50) DEFAULT NULL,
  `NumExt` int DEFAULT NULL,
  `NumInt` int DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Sexo` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NumControl`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Alumno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignatura`
--

DROP TABLE IF EXISTS `Asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asignatura` (
  `id` int NOT NULL,
  `id_materia` int DEFAULT NULL,
  `id_maestro` int DEFAULT NULL,
  `id_salon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materia` (`id_materia`),
  KEY `id_salon` (`id_salon`),
  CONSTRAINT `Asignatura_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `Maestro` (`id`),
  CONSTRAINT `Asignatura_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `Materia` (`id`),
  CONSTRAINT `Asignatura_ibfk_3` FOREIGN KEY (`id_salon`) REFERENCES `Salon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignatura`
--

LOCK TABLES `Asignatura` WRITE;
/*!40000 ALTER TABLE `Asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calificacion`
--

DROP TABLE IF EXISTS `Calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calificacion` (
  `id_alumno` int DEFAULT NULL,
  `id_asignatura` int DEFAULT NULL,
  `Calificacion` decimal(4,2) DEFAULT NULL,
  KEY `id_alumno` (`id_alumno`),
  KEY `id_asignatura` (`id_asignatura`),
  CONSTRAINT `Calificacion_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `Alumno` (`NumControl`),
  CONSTRAINT `Calificacion_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `Asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calificacion`
--

LOCK TABLES `Calificacion` WRITE;
/*!40000 ALTER TABLE `Calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maestro`
--

DROP TABLE IF EXISTS `Maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Maestro` (
  `id` int NOT NULL,
  `Nombre` tinytext,
  `Apellido1` varchar(50) DEFAULT NULL,
  `Apellido2` varchar(50) DEFAULT NULL,
  `id_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Maestro_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maestro`
--

LOCK TABLES `Maestro` WRITE;
/*!40000 ALTER TABLE `Maestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materia`
--

DROP TABLE IF EXISTS `Materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materia` (
  `id` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salon`
--

DROP TABLE IF EXISTS `Salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Salon` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salon`
--

LOCK TABLES `Salon` WRITE;
/*!40000 ALTER TABLE `Salon` DISABLE KEYS */;
INSERT INTO `Salon` VALUES ('1101'),('1102'),('1103'),('1104'),('1201'),('1202'),('1203'),('1204'),('2101'),('2102'),('2103'),('2104'),('2201'),('2202'),('2203'),('2204'),('CC1'),('CC2'),('CC3');
/*!40000 ALTER TABLE `Salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `NomUsuario` varchar(50) NOT NULL,
  `Contraseña` varchar(50) DEFAULT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NomUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26  1:52:12
