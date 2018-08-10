  CREATE DATABASE IF NOT EXISTS   `scriptwebDB`;
  USE `scriptwebDB`;

/*-----TABLA DE PROYECTOS   ( PROTOTIPO HECHO EN CLASE)-------
DROP TABLE IF EXISTS `proyectos`;

CREATE TABLE `proyectos`; (
`cod_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
`name_proyecto` varchar (100) COLLATE utf8_spanish_ci NOT NULL,
`cod_descripcion` text COLLATE utf8_spanish_ci,
`created_at` TIMESTAMP NOT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;*/

/*-----TABLA DE CATEGORIA CLASES-------*/
DROP TABLE IF EXISTS `categoria_clases`;

CREATE TABLE `categoria_clases` (
  `cod_cat_clase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_cat_clase` varchar(100) COLLATE=utf8_spanish_ci NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_cat_clase`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*-----TABLA DE CLASES-------*/
DROP TABLE IF EXISTS `clases`;

CREATE TABLE `clases` (
  `cod_clase` int (10) NOT NULL AUTO_INCREMENT,
  `name_clase` varchar(100) COLLATE=utf8_spanish_ci NOT NULL,
  `cod_cat_clase` int(10) unsigned NOT NULL,
  `created_at`TIMESTAMP NOT NULL,
  `updated_at`TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_clase`),
  KEY `fkcodcatclase_categoriaclases_idx` (`cod_cat_clase`),
  CONSTRAINT `fkcodcatclase_categoriaclases` FOREIGN KEY (`cod_cat_clase`) REFERENCES `categoria_clases` (`cod_cat_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----TABLA DE PROYECTOS CLASES-----*/
DROP TABLE IF EXISTS `proyectos_clases`;

CREATE TABLE `poryctos_clases`(
  `cod_proy_clases` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_proyecto` int (10) unsigned NOT NULL,
  `cod_clase` int (10) unsigned NOT NULL,
PRIMARY KEY  (`cod_proy_clases`),
KEY `fkcodeproyecto_proyectos_idx` (`cod_proyecto`),
KEY `fkcodeclase_clases_idx` (`cod_clase`),
CONSTRAINT `fkcodproyecto_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodclase_clases` FOREIGN KEY (`cod_clase`) REFERENCES `clases` (`cod_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----TABLA DE USUARIOS------*/

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
`id_users` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_tipo_users` varchar(30) COLLATE=utf8_spanish_ci NOT NULL, /*-----LLAVE FORANEA------*/
`cod_area_formacion` int(5) unsigned NOT NULL,
`cod_area_conocimiento` int(5) unsigned NOT NULL,
`nombre_users` varchar (100) COLLATE=utf8_spanish_ci NOT NULL,
`genero_users` varchar (1) COLLATE=utf8_spanish_ci NOT NULL,
`dia_nac_users` int(2)  unsigned NOT NULL,
`mes_nac_users` int(2)  unsigned NOT NULL,
`anio_nac_users` int(4)  unsigned NOT NULL,
`documento_users`varchar (12) COLLATE=utf8_spanish_ci NOT NULL,
`cod_tipo_documento`varchar (12) COLLATE=utf8_spanish_ci NOT NULL,/*-----LLAVE FORANEA------*/
`correo_users`varchar (60) COLLATE=utf8_spanish_ci NOT NULL,
`pass_users`varchar (128) COLLATE=utf8_spanish_ci NOT NULL,
`salt_users`varchar (128) COLLATE=utf8_spanish_ci NOT NULL,
`confirmar_users`varchar (128) COLLATE=utf8_spanish_ci NOT NULL,
`celular_users`varchar (16) COLLATE=utf8_spanish_ci NOT NULL,
`telefono_users`varchar (10) COLLATE=utf8_spanish_ci NOT NULL,
`cod_pais` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_depart` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_ciudad` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_comuna` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_barrio` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_corregimiento` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`cod_vereda` int(5)  unsigned NOT NULL, /*-----LLAVE FORANEA------*/
`direccion_users` varchar (`100`) COLLATE=utf8_spanish_ci NOT NULL,
`created_at` TIMESTAMP NOT NULL,
PRIMARY KEY (`id_users`),
KEY `fkcodtipousers_tipousuarios_idx` (`cod_tipo_users`),
KEY `fkcodtipodocumento_tipodocumento_idx` (`cod_tipo_documento`),
KEY `fkcodpais_pais_idx` (`cod_pais`),
KEY `fkcoddepart_departamentos_idx` (`cod_depart`),
KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
KEY `fkcodcomuna_comuna_idx` (`cod_comuna`),
KEY `fkcodbarrio_barrio_idx` (`cod_barrio`),
KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
KEY `fkcodvereda_vereda_idx` (`cod_vereda`),
CONSTRAINT `fkcodtipousers_tipousuarios` FOREIGN KEY (`cod_tipo_users`) REFERENCES `tipo_usuarios` (`cod_tipo_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodtipodocumento_tipodocumento` FOREIGN KEY (`cod_tipo_documento`) REFERENCES `tipo_documento` (`cod_tipo_documento`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodpais_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcoddepart_departamentos` FOREIGN KEY (`cod_depart`) REFERENCES `departamentos` (`cod_depart`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodcomuna_comuna` FOREIGN KEY (`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodbarrio_barrio` FOREIGN KEY (`cod_barrio`) REFERENCES `barrio` (`cod_barrio`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodvereda_vereda` FOREIGN KEY (`cod_vereda`) REFERENCES `veredad` (`cod_vereda`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA TIPO DE USUARIOS--------------*/
DROP TABLE IF EXISTS `tipo_usuarios`;

CREATE TABLE `tipo_usuarios` (
  `cod_tipo_users` int (5) NOT NULL AUTO_INCREMENT,
  `name_tipo_users` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_tipo_users`)
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA TIPO DE DOCUMENTO--------------*/
DROP TABLE IF EXISTS `tipo_usuarios`;

CREATE TABLE `tipo_usuarios` (
  `cod_tipo_documento` int (5) NOT NULL AUTO_INCREMENT,
  `name_tipo_documento` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_tipo_documento`)
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE PAIS--------------*/
DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais`(
  `cdo_pais` int(5) NOT NULL AUTO_INCREMENT,
  `name_pais`varchar (50) COLLATE=utf8_spanish_ci NOT NULL,
  `postal_pais` varchar (5) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_pais`),
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE DEPARTAMENTOS--------------*/
DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `cod_depart` int(5) NOT NULL AUTO_INCREMENT,
  `cod_pais` int(5) unsigned NOT NULL,
  `name_depart` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_depart`).
  KEY `fkcodpais_pais_idx` (`cod_pais`),
  CONSTRAINT `fkcodpais_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE CIUDAD--------------*/
DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `cod_ciudad` int(5) NOT NULL AUTO_INCREMENT,
  `cod_depart` int(5) unsigned NOT NULL,
  `name_ciudad` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_ciudad`).
  KEY `fkcoddepart_departamentos_idx` (`cod_depart`),
  CONSTRAINT `fkcoddepart_departamentos` FOREIGN KEY (`cod_depart`) REFERENCES `departamentos` (`cod_depart`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE COMUNA--------------*/
DROP TABLE IF EXISTS `comuna`;

CREATE TABLE `comuna` (
  `cod_comuna` int(5) NOT NULL AUTO_INCREMENT,
  `cod_ciudad` int(5) unsigned NOT NULL,
  `name_comuna` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_comuna`).
  KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
  CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE CORREGIMIENTO--------------*/
DROP TABLE IF EXISTS `corregimiento`;

CREATE TABLE `corregimiento` (
  `cod_corregimiento` int(5) NOT NULL AUTO_INCREMENT,
  `cod_ciudad` int(5) unsigned NOT NULL,
  `name_corregimiento` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_corregimiento`).
  KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
  CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*-----------TABLA DE VEREDA--------------*/
DROP TABLE IF EXISTS `veredad`;

CREATE TABLE `veredad` (
  `cod_veredad` int(5) NOT NULL AUTO_INCREMENT,
  `cod_corregimiento` int(5) unsigned NOT NULL,
  `name_veredad` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_veredad`).
  KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
  CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*-----------TABLA DE BARRIO--------------*/
DROP TABLE IF EXISTS `barrio`;

CREATE TABLE `barrio` (
  `cod_barrio` int(5) NOT NULL AUTO_INCREMENT,
  `cod_comuna` int(5) unsigned NOT NULL,
  `cod_corregimiento` int(5) unsigned NOT NULL,
  `name_veredad` varchar (45) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_barrio`).
  KEY `fkcodcomuna_comuna_idx` (`cod_comuna`),
  KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
  CONSTRAINT `fkcodcomuna_comuna` FOREIGN KEY (`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;






/*>------TABLA DE PROYECTO (ACTUALIZADA)------<*/

DROP TABLE IF EXISTS `proyecto`;

CREATE TABLE `proyecto`; (
`cod_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
`name_proyecto` varchar (50) COLLATE utf8_spanish_ci NOT NULL,
`cod_cat_proyecto` varchar (5) COLLATE utf8_spanish_ci NOT NULL,/*-----LLAVE FORANEA------*/
`cod_estado_proyecto` varchar (5) COLLATE utf8_spanish_ci NOT NULL,/*-----LLAVE FORANEA------*/
`cod_subdom_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,/*-----LLAVE FORANEA------*/
`cod_descripcion` text COLLATE utf8_spanish_ci,
`cod_fases_proyecto` int(2) unsigned NOT NULL AUTO_INCREMENT,/*-----LLAVE FORANEA------*/
`created_at` TIMESTAMP NOT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_proyecto`),
KEY `fkcodcatproyeto_categoriasproyecto_idx` (`cod_cat_proyecto`),
KEY `fkcodestadoproyecto_estado_idx` (`cod_estado_proyecto`),
KEY `fkcodsubdomproyecto_subdominios_idx` (`cod_subdom_proyecto`),
KEY `fkcodfasesproyecto_fases_idx` (`cod_fases_proyecto`),
CONSTRAINT `fkcodcatproyeto_categoriasproyecto` FOREIGN KEY (`cod_cat_proyecto`) REFERENCES `categorias_proyecto` (`cod_cat_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodestadoproyecto_estado` FOREIGN KEY (`cod_estado_proyecto`) REFERENCES `estado` (`cod_estado_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodsubdomproyecto_subdominios` FOREIGN KEY (`cod_subdom_proyecto`) REFERENCES `subdominios` (`cod_subdom_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodfasesproyecto_fases` FOREIGN KEY (`cod_fases_proyecto`) REFERENCES `fases` (`cod_fases_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



/*-----------TABLA DE FASES DE PROYECTO--------------*/
DROP TABLE IF EXISTS `fases`;

CREATE TABLE `fases` (
  `cod_fases_proyecto` int (5) NOT NULL AUTO_INCREMENT,
  `name_fase` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  `tiempo_fase` varchar (5) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_fases_proyecto`)
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



/*-----------TABLA DE ESTADO DE PROYECTO--------------*/
DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `cod_estado_proyecto` int (5) NOT NULL AUTO_INCREMENT,
  `name_estado` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_estado_proyecto`)
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




/*-----------TABLA IMAGENES DE PROYECTO--------------*/
DROP TABLE IF EXISTS `imagenes`;

CREATE TABLE `imagenes` (
  `cod_imagen` int (5) NOT NULL AUTO_INCREMENT,
  `name_imagen` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  `cod_tipo_users` varchar (5) COLLATE=utf8_spanish_ci NOT NULL,/*-----LLAVE FORANEA------*/
  `cod_proyecto` varchar (5) COLLATE=utf8_spanish_ci NOT NULL,/*-----LLAVE FORANEA------*/
  PRIMARY KEY (`cod_imagen`),
  KEY `fkcodtipousers_tipousuarios_idx` (`cod_tipo_users`),
  KEY `fkcodcatproyeto_proyecto_idx` (`cod_cat_proyecto`),
  CONSTRAINT `fkcodfastipousers_tipousuarios` FOREIGN KEY (`cod_tipo_users`) REFERENCES `tipo_usuarios` (`cod_tipo_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodfasesproyecto_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




/*-----------TABLA CATEGORIAS DE PROYECTO--------------*/
DROP TABLE IF EXISTS `categorias_proyecto`;

CREATE TABLE `categorias_proyecto` (
  `cod_categorias_proyecto` int (5) NOT NULL AUTO_INCREMENT,
  `name_cat_proyecto` varchar (30) COLLATE=utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_categorias_proyecto`)
)ENGINE)InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
