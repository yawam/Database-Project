-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Employee
-- -----------------------------------------------------
-- This database is a personal project
DROP SCHEMA IF EXISTS `Employee` ;

-- -----------------------------------------------------
-- Schema Employee
--
-- This database is a personal project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Employee` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Employee` ;

-- -----------------------------------------------------
-- Table `Employee`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`country` ;

CREATE TABLE IF NOT EXISTS `Employee`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_id_UNIQUE` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`rankings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`rankings` ;

CREATE TABLE IF NOT EXISTS `Employee`.`rankings` (
  `rankings_id` INT NOT NULL AUTO_INCREMENT,
  `emp_ranking` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rankings_id`),
  UNIQUE INDEX `rankings_id_UNIQUE` (`rankings_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`bank_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`bank_info` ;

CREATE TABLE IF NOT EXISTS `Employee`.`bank_info` (
  `bank_info_id` INT NOT NULL AUTO_INCREMENT,
  `acc_name` VARCHAR(90) NOT NULL,
  `acc_number` VARCHAR(12) NOT NULL,
  `routing_number` VARCHAR(9) NOT NULL,
  `zip` INT(5) NOT NULL,
  PRIMARY KEY (`bank_info_id`),
  UNIQUE INDEX `bank_info_id_UNIQUE` (`bank_info_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`states` ;

CREATE TABLE IF NOT EXISTS `Employee`.`states` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE INDEX `state_id_UNIQUE` (`state_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`employee` ;

CREATE TABLE IF NOT EXISTS `Employee`.`employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `date_of_birth` VARCHAR(45) NOT NULL,
  `sex` ENUM("M", "F") NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `SSN` VARCHAR(9) NOT NULL,
  `street_address` VARCHAR(90) NOT NULL,
  `salary` DECIMAL(7,2) NOT NULL,
  `country_id` INT NOT NULL,
  `rankings_id` INT NOT NULL,
  `bank_info_id` INT NOT NULL,
  `state_id` INT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  INDEX `fk_employee_country1_idx` (`country_id` ASC) VISIBLE,
  INDEX `fk_employee_rankings1_idx` (`rankings_id` ASC) VISIBLE,
  INDEX `fk_employee_bank_info1_idx` (`bank_info_id` ASC) VISIBLE,
  INDEX `fk_employee_states1_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `Employee`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_rankings1`
    FOREIGN KEY (`rankings_id`)
    REFERENCES `Employee`.`rankings` (`rankings_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_bank_info1`
    FOREIGN KEY (`bank_info_id`)
    REFERENCES `Employee`.`bank_info` (`bank_info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_states1`
    FOREIGN KEY (`state_id`)
    REFERENCES `Employee`.`states` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`departments` ;

CREATE TABLE IF NOT EXISTS `Employee`.`departments` (
  `departments_id` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`departments_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`.`dep_emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee`.`dep_emp` ;

CREATE TABLE IF NOT EXISTS `Employee`.`dep_emp` (
  `departments_id` INT NOT NULL,
  `emp_id` INT NOT NULL,
  `employee_start_date` DATE NOT NULL,
  `employee_end_date` DATE NULL,
  PRIMARY KEY (`departments_id`, `emp_id`),
  INDEX `fk_departments_has_employee_employee1_idx` (`emp_id` ASC) VISIBLE,
  INDEX `fk_departments_has_employee_departments_idx` (`departments_id` ASC) VISIBLE,
  CONSTRAINT `fk_departments_has_employee_departments`
    FOREIGN KEY (`departments_id`)
    REFERENCES `Employee`.`departments` (`departments_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_has_employee_employee1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `Employee`.`employee` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





USE employee;

INSERT INTO country VALUES ("1","United States"),
						   ("2","England"),
                           ("3","Spain"),
                           ("4","France"),
                           ("5","Ghana");
                           
INSERT INTO rankings VALUES ("1","Administrative"),
							("2","Executive"),
                            ("3","Coordinator"),
                            ("4","Staff"),
                            ("5","Individual Contributors");
                            
INSERT INTO bank_info VALUES ("1","REECE JAMES","65896523659","000258964","83404"),
							 ("2","ROSE BARKLEY","985632148965","000145236","76098"),
                             ("3","HAKIM ZIYECH","789632541258","000145236","85236"),
                             ("4","HUDSON ODOI","756214523698","000896523","87560"),
                             ("5","ROMELU LUKAKU","654125396874","000269852","98752"),
                             ("6","CHRISTIAN PULISIC","369145236985","000896589","45216"),
                             ("7","THIAGO SILVA","985214789632","000012893","85632"),
                             ("8","ANTONIO RUDIGER","899878985632","000128965","78874"),
                             ("9","CESAR AZPILICUETA","121212326598","000789123","18562"),
                             ("10","TIMO WERNER","582596567548","000591465","84606");
                             
 INSERT INTO states VALUES ("1","UTAH"),
						  ("2","IDAHO"),
                          ("3", "WA"),
                          ("4","NY");                             
                          
INSERT INTO employee VALUES ("1","REECE","JAMES","1996-09-01","M","208-786-3567","recjam@gmail,com","786980946","No1. Applebee Street","90000.00","1","1","1", NULL),
							("2","ROSE","BARKLEY","1995-02-03","F","243-567-1456","rosbark@gmail.com","768109856","No14 Omega Street","80000.00","2","1","2", NULL),
                            ("3","HAKIM","ZIYECH","1996-07-06","M","456-589-1234","hakziy@byui.edu","765847872","537 East 7th South","65982.00","4","2","3", NULL),
                            ("4","HUDSON","ODOI","1998-05-01","M","657-094-1267","hudsod@byui.edu","125468905","No34 Maple Street","76092.00","3","2","4", 1),
                            ("5","ROMELA","LUKAKU","1995-04-02","F","365-678-1678","romluk@yahoo.com","437654120","N067 East Center Street","86768.00","5","4","5", NULL),
                            ("6","CHRISTIAN", "PULISIC","1999-05-04","F","395-678-1456","chrispul@gmail.com","495867298","498 Apple Lane parkway","89402.00","1","5","6", 3),
                            ("7","THIAGO","SILVA","1993-11-21","M","208-988-7979","thiagsil@gmail.com","102938475","36 Broadway Street 09","97402.00","3","1","7", NULL),
                            ("8","ANTONIO","RUDIGER","1994-01-15","M","365-546-0908","antrud@gmail.com","12904578","234 South 1st West","76589.00","5","5","8", NULL),
                            ("9","ARIA","AZPILICUETA","1995-12-02","F","208-133-4756","ariazpi@byui.edu","678594092","123 West 2nd South","79123.00","2","3","9", NULL),
                            ("10","TIMO","WERNER","1999-08-24","M","238-456-1998","timwer@gmail.com","12340927","No.16 Avocado Street","89345.00","4","2","10", NULL);
                   

                              
INSERT INTO departments VALUES ("1","Accounting"),
							   ("2","Logistics"),
                               ("3","Customer-Care"),
                               ("4","Software");

INSERT INTO dep_emp VALUES ("1","1","2018-03-01", NULL),
						   ("2","2","2017-03-01", NULL),
                           ("3","3","2017-03-01", NULL),
                           ("4","4","2017-03-01", NULL),
                           ("1","5","2017-03-01", NULL),
                           ("2","6","2017-03-01", NULL),
                           ("3","7","2017-03-01", NULL),
                           ("4","8","2017-03-01", NULL),
                           ("1","9","2017-03-01", NULL),
                           ("2","10","2017-03-01", NULL);
                           

                               
