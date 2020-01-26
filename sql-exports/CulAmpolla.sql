-- MySQL Script generated by MySQL Workbench
-- Sun Jan 26 22:13:23 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CulAmpolla-DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CulAmpolla-DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CulAmpolla-DB` DEFAULT CHARACTER SET utf8 ;
USE `CulAmpolla-DB` ;

-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Plane` (
  `idPlane` INT NULL,
  PRIMARY KEY (`idPlane`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Seat` (
  `idSeat` INT NOT NULL,
  `Plane_idPlane` INT NOT NULL,
  PRIMARY KEY (`idSeat`),
  INDEX `fk_Seat_Plane_idx` (`Plane_idPlane` ASC) VISIBLE,
  CONSTRAINT `fk_Seat_Plane`
    FOREIGN KEY (`Plane_idPlane`)
    REFERENCES `CulAmpolla-DB`.`Plane` (`idPlane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Autor` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL,
  `obras` VARCHAR(45) NULL,
  `Libros_idLibro` INT NOT NULL,
  PRIMARY KEY (`idAutor`),
  UNIQUE INDEX `idAutor_UNIQUE` (`idAutor` ASC) VISIBLE,
  INDEX `fk_Autor_Libros1_idx` (`Libros_idLibro` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_Libros1`
    FOREIGN KEY (`Libros_idLibro`)
    REFERENCES `CulAmpolla-DB`.`Libros` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Cuadros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Cuadros` (
  `idCuadro` INT GENERATED ALWAYS AS (),
  `precio` VARCHAR(5) NULL,
  `table2_idAutor` INT NULL,
  PRIMARY KEY (`idCuadro`),
  UNIQUE INDEX `idQuadre_UNIQUE` (`idCuadro` ASC) VISIBLE,
  INDEX `fk_table1_table21_idx` (`table2_idAutor` ASC) VISIBLE,
  CONSTRAINT `fk_table1_table21`
    FOREIGN KEY (`table2_idAutor`)
    REFERENCES `CulAmpolla-DB`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Cliente` (
  `Cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `dni` VARCHAR(10) NOT NULL,
  `table1_idCuadro` INT NOT NULL,
  PRIMARY KEY (`Cliente`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `Cliente_UNIQUE` (`Cliente` ASC) VISIBLE,
  INDEX `fk_table3_table11_idx` (`table1_idCuadro` ASC) VISIBLE,
  CONSTRAINT `fk_table3_table11`
    FOREIGN KEY (`table1_idCuadro`)
    REFERENCES `CulAmpolla-DB`.`Cuadros` (`idCuadro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Video` (
  `idVideo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `titulo` VARCHAR(40) NULL,
  `url` VARCHAR(100) CHARACTER SET 'DEFAULT' GENERATED ALWAYS AS (https://www.youtube.com/),
  PRIMARY KEY (`idVideo`),
  UNIQUE INDEX `idVideo_UNIQUE` (`idVideo` ASC) VISIBLE,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `Video_idVideo` INT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Usuarios_Video1_idx` (`Video_idVideo` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Video1`
    FOREIGN KEY (`Video_idVideo`)
    REFERENCES `CulAmpolla-DB`.`Video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Autor` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL,
  `obras` VARCHAR(45) NULL,
  `Libros_idLibro` INT NOT NULL,
  PRIMARY KEY (`idAutor`),
  UNIQUE INDEX `idAutor_UNIQUE` (`idAutor` ASC) VISIBLE,
  INDEX `fk_Autor_Libros1_idx` (`Libros_idLibro` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_Libros1`
    FOREIGN KEY (`Libros_idLibro`)
    REFERENCES `CulAmpolla-DB`.`Libros` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Libros` (
  `idLibro` INT GENERATED ALWAYS AS (),
  `stock` VARCHAR(5) NULL,
  `precio` VARCHAR(4) NULL,
  `Autor_idAutor` INT NOT NULL,
  PRIMARY KEY (`idLibro`),
  UNIQUE INDEX `idLibro_UNIQUE` (`idLibro` ASC) VISIBLE,
  INDEX `fk_Libros_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  CONSTRAINT `fk_Libros_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `CulAmpolla-DB`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Ventas` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `Libros_idLibro` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `total` VARCHAR(5) NULL,
  PRIMARY KEY (`idVenta`),
  UNIQUE INDEX `idVenta_UNIQUE` (`idVenta` ASC) VISIBLE,
  INDEX `fk_Ventas_Libros1_idx` (`Libros_idLibro` ASC) VISIBLE,
  INDEX `fk_Ventas_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Libros1`
    FOREIGN KEY (`Libros_idLibro`)
    REFERENCES `CulAmpolla-DB`.`Libros` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `CulAmpolla-DB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Usuario` (
  `idUsuario` INT GENERATED ALWAYS AS (),
  `nombre` VARCHAR(20) NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `Fotos_idfotos` INT NULL,
  `Amigo_idAmigo` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `contraseña_UNIQUE` (`contraseña` ASC) VISIBLE,
  INDEX `fk_Usuario_Fotos1_idx` (`Fotos_idfotos` ASC) VISIBLE,
  INDEX `fk_Usuario_Amigo1_idx` (`Amigo_idAmigo` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Fotos1`
    FOREIGN KEY (`Fotos_idfotos`)
    REFERENCES `CulAmpolla-DB`.`Fotos` (`idfotos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Amigo1`
    FOREIGN KEY (`Amigo_idAmigo`)
    REFERENCES `CulAmpolla-DB`.`Amigo` (`idAmigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Fotos` (
  `idfotos` INT GENERATED ALWAYS AS (),
  `direcion` VARCHAR(45) NULL,
  `url` VARCHAR(45) GENERATED ALWAYS AS (),
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idfotos`),
  UNIQUE INDEX `idfotos_UNIQUE` (`idfotos` ASC) VISIBLE,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE,
  INDEX `fk_fotos_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_fotos_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `CulAmpolla-DB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Amigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Amigo` (
  `trabajo` INT NOT NULL,
  `ocio` VARCHAR(45) NULL,
  `internet` VARCHAR(45) NULL,
  `otros` VARCHAR(45) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `idAmigo` INT NOT NULL,
  INDEX `fk_Amigo_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  PRIMARY KEY (`idAmigo`),
  UNIQUE INDEX `idAmigo_UNIQUE` (`idAmigo` ASC) VISIBLE,
  CONSTRAINT `fk_Amigo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `CulAmpolla-DB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Usuario` (
  `idUsuario` INT GENERATED ALWAYS AS (),
  `nombre` VARCHAR(20) NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `Fotos_idfotos` INT NULL,
  `Amigo_idAmigo` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `contraseña_UNIQUE` (`contraseña` ASC) VISIBLE,
  INDEX `fk_Usuario_Fotos1_idx` (`Fotos_idfotos` ASC) VISIBLE,
  INDEX `fk_Usuario_Amigo1_idx` (`Amigo_idAmigo` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Fotos1`
    FOREIGN KEY (`Fotos_idfotos`)
    REFERENCES `CulAmpolla-DB`.`Fotos` (`idfotos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Amigo1`
    FOREIGN KEY (`Amigo_idAmigo`)
    REFERENCES `CulAmpolla-DB`.`Amigo` (`idAmigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`ContactoTelDirEmail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`ContactoTelDirEmail` (
  `telefono`  NOT NULL,
  `direccion`  NOT NULL,
  `numero`  NOT NULL,
  `piso`  NULL,
  `puerta`  NULL,
  `ciudad`  NOT NULL,
  `cp`  NOT NULL,
  `pais`  NOT NULL,
  `fax`  NULL,
  `email` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  PRIMARY KEY (`telefono`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Empleado` (
  `idEmpleado` INT GENERATED ALWAYS AS (),
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fecha inicio` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `Contacto_telefono`  NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `fk_Empleado_Contacto1_idx` (`Contacto_telefono` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Contacto1`
    FOREIGN KEY (`Contacto_telefono`)
    REFERENCES `CulAmpolla-DB`.`ContactoTelDirEmail` (`telefono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Gafas` (
  `idGafa` INT GENERATED ALWAYS AS (),
  `marca` VARCHAR(45) NULL,
  `graduacion1` VARCHAR(45) NULL,
  `graduacion2` VARCHAR(45) NULL,
  `montura` VARCHAR(45) NULL,
  `color montura` VARCHAR(45) NULL,
  `color vidrio` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  `Proveedor_idProveedor` INT UNSIGNED NOT NULL,
  `Empleado_idEmpleado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idGafa`),
  UNIQUE INDEX `idGafas_UNIQUE` (`idGafa` ASC) VISIBLE,
  INDEX `fk_Gafas_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_Gafas_Empleado1_idx` (`Empleado_idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Gafas_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `CulAmpolla-DB`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gafas_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `CulAmpolla-DB`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`Proveedor` (
  `idProveedor` INT GENERATED ALWAYS AS (),
  `nombre` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `Gafas_idGafa` INT NOT NULL,
  `Contacto_telefono`  NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `fk_Proveedor_Gafas1_idx` (`Gafas_idGafa` ASC) VISIBLE,
  INDEX `fk_Proveedor_Contacto1_idx` (`Contacto_telefono` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_Gafas1`
    FOREIGN KEY (`Gafas_idGafa`)
    REFERENCES `CulAmpolla-DB`.`Gafas` (`idGafa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_Contacto1`
    FOREIGN KEY (`Contacto_telefono`)
    REFERENCES `CulAmpolla-DB`.`ContactoTelDirEmail` (`telefono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla-DB`.`ClienteCulAmp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla-DB`.`ClienteCulAmp` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha registro` TIMESTAMP(6) NOT NULL,
  `recomendado por` VARCHAR(45) NULL,
  `Gafas_idGafa` INT NOT NULL,
  `Contacto_telefono`  NOT NULL,
  INDEX `fk_Cliente_Gafas1_idx` (`Gafas_idGafa` ASC) VISIBLE,
  INDEX `fk_ClienteCulAmp_Contacto1_idx` (`Contacto_telefono` ASC) VISIBLE,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Gafas1`
    FOREIGN KEY (`Gafas_idGafa`)
    REFERENCES `CulAmpolla-DB`.`Gafas` (`idGafa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClienteCulAmp_Contacto1`
    FOREIGN KEY (`Contacto_telefono`)
    REFERENCES `CulAmpolla-DB`.`ContactoTelDirEmail` (`telefono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
