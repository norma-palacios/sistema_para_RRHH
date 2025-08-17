CREATE DATABASE  IF NOT EXISTS `recursoshumano_udb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recursoshumano_udb`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: recursoshumano_udb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idAsistencia` bigint NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `fecha` date NOT NULL,
  `horaEntrada` time DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  `observacion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  UNIQUE KEY `uq_asistencia` (`idEmpleado`,`fecha`),
  KEY `idx_asistencia_fecha` (`fecha`),
  CONSTRAINT `fk_asist_emp` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idCargo` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `esJefatura` tinyint(1) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCargo`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `uq_cargo_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `idContacto` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `idTipoContacto` tinyint NOT NULL,
  `valor` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `esPrincipal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idContacto`),
  KEY `fk_cont_persona` (`idPersona`),
  KEY `fk_cont_tipo` (`idTipoContacto`),
  CONSTRAINT `fk_cont_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cont_tipo` FOREIGN KEY (`idTipoContacto`) REFERENCES `tipocontacto` (`idTipoContacto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `idContrato` int NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `idDepartamento` int NOT NULL,
  `idCargo` int NOT NULL,
  `idTipoContratacion` int NOT NULL,
  `supervisorIdEmpleado` int DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  `salarioMensual` decimal(10,2) NOT NULL,
  `jornada` enum('TIEMPO_COMPLETO','MEDIO_TIEMPO','POR_HORAS') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TIEMPO_COMPLETO',
  `estado` enum('VIGENTE','FINALIZADO','SUSPENDIDO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VIGENTE',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idContrato`),
  KEY `fk_contrato_empleado` (`idEmpleado`),
  KEY `fk_contrato_depto` (`idDepartamento`),
  KEY `fk_contrato_cargo` (`idCargo`),
  KEY `fk_contrato_tipo` (`idTipoContratacion`),
  KEY `fk_contrato_superv` (`supervisorIdEmpleado`),
  KEY `idx_contrato_estado` (`estado`),
  CONSTRAINT `fk_contrato_cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `fk_contrato_depto` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`),
  CONSTRAINT `fk_contrato_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_contrato_superv` FOREIGN KEY (`supervisorIdEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_contrato_tipo` FOREIGN KEY (`idTipoContratacion`) REFERENCES `tipocontratacion` (`idTipoContratacion`),
  CONSTRAINT `contrato_chk_1` CHECK ((`salarioMensual` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idDepartamento`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `uq_departamento_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'ADM','Administración',NULL,1),(2,'TI','Tecnologías de Información',NULL,1),(3,'RRHH','Recursos Humanos',NULL,1);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `idDireccion` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `linea1` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linea2` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamentoGeo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigoPostal` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT 'El Salvador',
  `esPrincipal` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idDireccion`),
  KEY `fk_dir_persona` (`idPersona`),
  CONSTRAINT `fk_dir_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `codigoEmpleado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO','SUSPENDIDO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correoInstitucional` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `uq_empleado_codigo` (`codigoEmpleado`),
  UNIQUE KEY `uq_empleado_usuario` (`usuario`),
  UNIQUE KEY `uq_empleado_correo` (`correoInstitucional`),
  KEY `fk_emp_persona` (`idPersona`),
  KEY `idx_emp_estado` (`estado`),
  CONSTRAINT `fk_emp_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiallaboral`
--

DROP TABLE IF EXISTS `historiallaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiallaboral` (
  `idHistorial` bigint NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `fechaCambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cambio` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_hist_emp` (`idEmpleado`),
  CONSTRAINT `fk_hist_emp` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiallaboral`
--

LOCK TABLES `historiallaboral` WRITE;
/*!40000 ALTER TABLE `historiallaboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiallaboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagonomina`
--

DROP TABLE IF EXISTS `pagonomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagonomina` (
  `idPago` bigint NOT NULL AUTO_INCREMENT,
  `idPeriodo` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `salarioBase` decimal(10,2) NOT NULL,
  `horasExtras` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonificaciones` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuentos` decimal(10,2) NOT NULL DEFAULT '0.00',
  `salarioNeto` decimal(10,2) NOT NULL,
  `fechaPago` date NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_pago_empleado` (`idEmpleado`),
  KEY `idx_nomina_periodo` (`idPeriodo`,`idEmpleado`),
  CONSTRAINT `fk_pago_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_pago_periodo` FOREIGN KEY (`idPeriodo`) REFERENCES `periodonomina` (`idPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagonomina`
--

LOCK TABLES `pagonomina` WRITE;
/*!40000 ALTER TABLE `pagonomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagonomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodonomina`
--

DROP TABLE IF EXISTS `periodonomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodonomina` (
  `idPeriodo` int NOT NULL AUTO_INCREMENT,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `tipo` enum('QUINCENA','MENSUAL','SEMANAL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'QUINCENA',
  `estado` enum('ABIERTO','CERRADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ABIERTO',
  PRIMARY KEY (`idPeriodo`),
  CONSTRAINT `chk_per_nomina` CHECK ((`fechaFin` >= `fechaInicio`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodonomina`
--

LOCK TABLES `periodonomina` WRITE;
/*!40000 ALTER TABLE `periodonomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodonomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idPermiso` bigint NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `idTipoPermiso` tinyint NOT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL,
  `horas` decimal(5,2) DEFAULT NULL,
  `estado` enum('SOLICITADO','APROBADO','RECHAZADO','GOZADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SOLICITADO',
  `motivo` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`idPermiso`),
  KEY `fk_perm_emp` (`idEmpleado`),
  KEY `fk_perm_tipo` (`idTipoPermiso`),
  KEY `idx_permiso_estado` (`estado`),
  CONSTRAINT `fk_perm_emp` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE,
  CONSTRAINT `fk_perm_tipo` FOREIGN KEY (`idTipoPermiso`) REFERENCES `tipopermiso` (`idTipoPermiso`),
  CONSTRAINT `chk_fechas_permiso` CHECK ((`fechaHasta` >= `fechaDesde`)),
  CONSTRAINT `permiso_chk_1` CHECK (((`horas` is null) or (`horas` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroDui` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` enum('M','F','X') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'X',
  `estadoCivil` enum('SOLTERO','CASADO','UNIDO','DIVORCIADO','VIUDO') COLLATE utf8mb4_unicode_ci DEFAULT 'SOLTERO',
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `uq_persona_dui` (`numeroDui`),
  KEY `idx_persona_apellidos` (`apellidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontacto`
--

DROP TABLE IF EXISTS `tipocontacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocontacto` (
  `idTipoContacto` tinyint NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTipoContacto`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontacto`
--

LOCK TABLES `tipocontacto` WRITE;
/*!40000 ALTER TABLE `tipocontacto` DISABLE KEYS */;
INSERT INTO `tipocontacto` VALUES (4,'Email institucional'),(3,'Email personal'),(2,'Teléfono fijo'),(1,'Teléfono móvil'),(5,'WhatsApp');
/*!40000 ALTER TABLE `tipocontacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontratacion`
--

DROP TABLE IF EXISTS `tipocontratacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocontratacion` (
  `idTipoContratacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idTipoContratacion`),
  UNIQUE KEY `uq_tipocontratacion_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontratacion`
--

LOCK TABLES `tipocontratacion` WRITE;
/*!40000 ALTER TABLE `tipocontratacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocontratacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopermiso`
--

DROP TABLE IF EXISTS `tipopermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopermiso` (
  `idTipoPermiso` tinyint NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTipoPermiso`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopermiso`
--

LOCK TABLES `tipopermiso` WRITE;
/*!40000 ALTER TABLE `tipopermiso` DISABLE KEYS */;
INSERT INTO `tipopermiso` VALUES (6,'Capacitación'),(5,'Duelo'),(2,'Enfermedad'),(4,'Maternidad/Paternidad'),(3,'Permiso personal'),(1,'Vacaciones');
/*!40000 ALTER TABLE `tipopermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariosistema`
--

DROP TABLE IF EXISTS `usuariosistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariosistema` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idEmpleado` int DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashPassword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('ADMIN','RRHH','JEFE','EMPLEADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EMPLEADO',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_usuario_emp` (`idEmpleado`),
  CONSTRAINT `fk_usuario_emp` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariosistema`
--

LOCK TABLES `usuariosistema` WRITE;
/*!40000 ALTER TABLE `usuariosistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariosistema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-17 15:58:07
