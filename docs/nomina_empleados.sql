-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 192.168.0.107    Database: nomina_empleados
-- ------------------------------------------------------
-- Server version	5.6.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cargo` varchar(5) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre_cargo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `codigo_cargo` (`codigo_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'TEC','Técnico',500.00),(2,'OPT','Operador',30000.00),(3,'GTE','GERENTE',111.00),(4,'LPA','LIMPIEZA',1000.00),(5,'ING','INGENIERO',12345.00),(6,'SYS','SISTEMAS',1000.00),(7,'abcde','abcde',10000.00);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptos` (
  `id_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_concepto` varchar(5) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre_concepto` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo_concepto` enum('ASIGNACION','DEDUCCION') COLLATE utf8mb4_spanish_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_concepto`),
  UNIQUE KEY `codigo_concepto` (`codigo_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` VALUES (1,'BA','BONO ALIMENTACION','ASIGNACION',0.00),(2,'SAL','SUELDO Y SALARIOS','ASIGNACION',1.00),(3,'DNT','DIAS NO TRABAJADOS','DEDUCCION',15.00),(4,'PAN','BONO PAPAN','ASIGNACION',1.00),(10,'BAP','BONO ASISENTCIA PEFECTA','ASIGNACION',30.00),(11,'BG','BONO DE GUERRA','ASIGNACION',140.00),(12,'CUCUC','CUCUCURUCU','ASIGNACION',10.00),(14,'ABCDE','ABCDEG','ASIGNACION',10.00);
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_departamento` varchar(5) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombre_departamento` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `codigo_departamento` (`codigo_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'DT','Tecnico'),(2,'DA','Administrativo'),(3,'RRHH','RECURSOS HUMANOS 2');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `segundo_nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido_paterno` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido_materno` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nivel_academico` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  `sueldo_mensual` decimal(10,2) NOT NULL,
  `tipo_periodo` varchar(11) COLLATE utf8mb4_spanish_ci NOT NULL,
  `horario` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (2,'Edwuar','','','','V298084776','1111111','','efvefveev',1,1,'2020-09-28','0000-00-00','',0.00,'QUINCENAL','08:00AM - 05:00PM'),(3,'Edwuar Parra','','','','V4','2323232322','','wrwrw',1,1,'2024-09-28','2024-09-28','Ingeniero de sistemas',0.00,'QUINCENAL','08:00AM - 05:00PM'),(4,'Edwuar Parra','','','','V5','2323232322','','wrwrw',1,1,'2020-09-28','2024-09-28','Ingeniero de sistemas',0.00,'QUINCENAL','08:00AM - 05:00PM'),(8,'Bellota','','','','E123','45454545454','','fdfdfdfd',1,2,'2024-09-28','2024-09-28','licenciada',0.00,'QUINCENAL','08:00AM - 05:00PM'),(9,'pedro perez','eeee','eeee','ere ese ','V11222333','(0244)3456333','','no@tiene.com',1,1,'2024-09-28','2024-09-28','Básico',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(10,'Juan','Ortegadddd','Taborda dddd','Ortegadddd','V20123206','(0244)2715530','(0412)1754960','x@x.com',1,1,'2024-02-01','2006-10-25','Postgrado',1000.00,'QUINCENAL','08:00AM - 05:00PM'),(11,'juan','juan','juan','juan','juan','juan','juan','1',1,1,'2004-10-31','2004-10-31','Postgrado',3000.00,'QUINCENAL','08:00AM - 05:00PM'),(12,'a','b','a','c','20127206','(0244)3331122','(0414)2221122','a@c',1,1,'2024-10-31','2006-10-31','Básico',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(13,'CARMEN axssss','Gdd','QUERALES bssss','Gddd','V20127206','(0241)2223344','(0424)2223344','X@X',1,1,'2024-11-01','2010-07-01','Pregrado',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(14,'JOSE','A','PAREDES','B','11555663','(0244)2715530','(0414)11122211','a@b',1,1,'2024-11-01','2006-11-01','Básico',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(15,'JOSE','A','PAREDES','B','11555661','(0244)2715530','(0414)11122211','a@b',1,1,'2024-11-01','2006-11-01','Básico',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(16,'JOSE','A','PAREDES','B','11555662','(0244)2715530','(0414)11122211','a@b',1,1,'2024-11-01','2006-11-01','Básico',30000.00,'QUINCENAL','08:00AM - 05:00PM'),(17,'a','d','b','d','V7208124','(0244)','(0414)d','a',1,1,'2024-11-04','2006-11-04','Básico',50000.00,'QUINCENAL','08:00AM - 05:00PM'),(18,'aaaaaaa','cccc','bbbbbb','ddddd','V12123456','(0243)1112233','(0416)4445533','x',1,1,'2024-11-04','2006-11-04','Básico',50000.00,'QUINCENAL','08:00AM - 05:00PM'),(19,'aaaaa','dddd','dddd','dddd','V4000000','(0246)2223344','(0414)3334455','x@x',1,2,'2024-11-07','2006-11-07','Básico',0.00,'SEMANAL','08:00AM - 05:00PM'),(20,'aaaa','dddd','cccc','dddd','E20127206','(0243)3334455','(0414)4445566','x@x',1,2,'2024-11-07','2006-11-07','Pregrado',0.00,'','08:00AM - 05:00PM'),(21,'xxxx','3333','cccc','3333','V17682903','(0243)3334455','(0416)4445566','x',1,1,'2024-11-08','2006-11-08','Pregrado',0.00,'MENSUAL','08:00AM - 05:00PM'),(22,'ddddd','ddddd','ddddd','dddd','V4667890','(0244)2223344','(0414)1112233','x',1,3,'2024-11-08','2006-11-08','Básico',0.00,'SEMANAL','08:00AM - 05:00PM'),(23,'aaaaa','dddd','dddd','ddddd','V10769341','(0244)1112233','(0414)1112233','z',1,2,'2024-11-08','2006-11-08','Básico',30000.00,'bbbb','08:00AM - 05:00PM'),(24,'JOSE','B','ORTEGA','B','E10769341','(0244)1112233','(0414)3432234','X',1,4,'2024-11-08','2006-11-08','Básico',1000.00,'SEMANAL','07:00PM - 07:00AM'),(25,'abcd','aaaaa','bcda','bbbbb','V13769342','(0244)7543322','(0414)3334433','e@e.com',1,2,'2024-11-11','2006-11-11','Básico',30000.00,'SEMANAL','08:00AM - 05:00PM'),(26,'abcd','a','efghi','b','V20567456','(0244)2145566','(0414)3334433','x@x.com',1,2,'2024-11-11','2006-11-11','Básico',30000.00,'SEMANAL','08:00AM - 05:00PM'),(27,'aaaaa','dddd','bbbb','ddddd','V13769347','(0244)2223344','(0414)1112233','x@x.com',1,4,'2024-11-11','2006-11-11','Básico',1000.00,'SEMANAL','08:00AM - 05:00PM'),(28,'bbbbb','a','bbbbbbbb','a','V20127209','(0244)1112233','(0414)1112233','x@x.com',1,1,'2024-11-11','2006-11-11','Básico',50000.00,'SEMANAL','08:00AM - 05:00PM'),(29,'Jose','O','Martinez','P','V13769349','(0244)1755530','(0414)1754960','X@X.CO',1,1,'2024-11-12','2006-11-12','Básico',50000.00,'SEMANAL','08:00AM - 05:00PM'),(30,'Maria','B','Munoz','B','V13567890','(0244)3456677','(0414)1112234','maria@casa.com',1,1,'2024-11-14','2006-11-14','Básico',111.00,'SEMANAL','07:00PM - 07:00AM'),(31,'dtuiooi','efyjh','fdhgf','uyiouoi','V4000001','(0244)4646467','(0414)5675657','dousgajhdgsah@gmail.com',1,1,'2024-11-18','2006-11-18','Básico',50000.00,'SEMANAL','08:00AM - 05:00PM'),(32,'JUAN','c','TABORDA','d','V13769341','(0244)2715530','(0414)2715530','tabordajuan@gmail.om',3,6,'2024-11-18','2006-11-18','Doctorado',1000.00,'SEMANAL','08:00AM - 05:00PM'),(34,'Pedro','','Perez','','V11234567','(0244)3345433','(0424)5564356','a@x.com',1,1,'2023-06-01','2006-10-25','Pregrado',50000.00,'SEMANAL','08:00AM - 05:00PM'),(35,'bbbbb','dddd','ddddd','dddd','V18345678','(0244)2223344','(0414)3334455','a@x.com',1,1,'2024-11-21','2006-11-21','Básico',50000.00,'SEMANAL','08:00AM - 05:00PM'),(36,'aaaaa','','bbbb','','V20127200','(0244)1112233','(0414)2223344','a@b.com',1,1,'2024-11-26','2006-11-26','Básico',50000.00,'QUINCENAL','08:00AM - 05:00PM'),(37,'JOSE','A','TABARES','B','V20999111','(0244)2712277','(0414)3334422','JTABORDA@X.COM',2,1,'2024-11-27','2006-11-27','Básico',50000.00,'QUINCENAL','06:00AM - 01:00PM'),(38,'pedro','','perez','','V9999565','(0244)2723322','(0414)1123344','jose@gmail.com',1,1,'2024-11-28','2006-11-28','Pregrado',500.00,'SEMANAL','06:00AM - 01:00PM');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina_detalles`
--

DROP TABLE IF EXISTS `nomina_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina_detalles` (
  `id_nomina_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_nomina` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_nomina_detalle`),
  UNIQUE KEY `idx_nomina_empleado_concepto` (`id_nomina`,`id_empleado`,`id_concepto`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_concepto` (`id_concepto`),
  KEY `id_nomina` (`id_nomina`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `nomina_detalles_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `nomina_detalles_ibfk_3` FOREIGN KEY (`id_nomina`) REFERENCES `nominas` (`id_nomina`),
  CONSTRAINT `nomina_detalles_ibfk_4` FOREIGN KEY (`id_nomina`) REFERENCES `nominas` (`id_nomina`),
  CONSTRAINT `nomina_detalles_ibfk_5` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  CONSTRAINT `nomina_detalles_ibfk_6` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`),
  CONSTRAINT `nomina_detalles_ibfk_7` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `nomina_detalles_ibfk_8` FOREIGN KEY (`id_concepto`) REFERENCES `conceptos` (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina_detalles`
--

LOCK TABLES `nomina_detalles` WRITE;
/*!40000 ALTER TABLE `nomina_detalles` DISABLE KEYS */;
INSERT INTO `nomina_detalles` VALUES (1,3,1,1,32,1,1.00,1.00);
/*!40000 ALTER TABLE `nomina_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominas`
--

DROP TABLE IF EXISTS `nominas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nominas` (
  `id_nomina` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) NOT NULL,
  `codigo_nomina` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo_nomina` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `total_asignacion` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_deduccion` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_nomina`),
  UNIQUE KEY `idx_nomina_periodo` (`id_nomina`,`id_periodo`),
  KEY `id_periodo` (`id_periodo`),
  CONSTRAINT `nominas_ibfk_1` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominas`
--

LOCK TABLES `nominas` WRITE;
/*!40000 ALTER TABLE `nominas` DISABLE KEYS */;
INSERT INTO `nominas` VALUES (3,6,'2023','SEMANAL',0.00,0.00,0.00);
/*!40000 ALTER TABLE `nominas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_periodo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_periodo` enum('SEMANAL','QUINCENAL','MENSUAL') COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cerrada` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_periodo`),
  UNIQUE KEY `idx_periodo_fecha` (`fecha_inicio`,`fecha_fin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (6,'24302024','SEMANAL','2024-11-30','2024-11-30',1);
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador'),(2,'Privilegios'),(3,'Estandar');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `login_fallidos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (6,'admin','admin',1,1,0),(7,'123','123',1,1,0),(8,'vperez','1234',NULL,NULL,0),(9,'vramirez','vramirez',1,1,0),(10,'abc','ddd',1,1,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  9:58:17
