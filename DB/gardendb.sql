-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nomadicGardensDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nomadicGardensDB` ;

-- -----------------------------------------------------
-- Schema nomadicGardensDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nomadicGardensDB` DEFAULT CHARACTER SET utf8 ;
USE `nomadicGardensDB` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  `address_id` INT NULL,
  `img_url` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `create_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden` ;

CREATE TABLE IF NOT EXISTS `garden` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NULL,
  `size_sqft` INT NULL,
  `description` VARCHAR(1000) NULL,
  `name` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_garden_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_garden_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plot` ;

CREATE TABLE IF NOT EXISTS `plot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `plot_number` INT NULL,
  `size_sqft` INT NULL,
  `garden_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_plot_user_idx` (`user_id` ASC),
  INDEX `fk_plot_garden_idx` (`garden_id` ASC),
  CONSTRAINT `fk_plot_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plot_garden`
    FOREIGN KEY (`garden_id`)
    REFERENCES `garden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `produce` ;

CREATE TABLE IF NOT EXISTS `produce` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `img_url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `quantity` INT NULL DEFAULT 1,
  `unit` VARCHAR(45) NULL,
  `harvest_date` DATE NULL,
  `use_by_date` DATE NULL,
  `available` TINYINT NULL DEFAULT 1,
  `img_url` VARCHAR(45) NULL,
  `produce_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_user_idx` (`user_id` ASC),
  INDEX `fk_item_produce_idx` (`produce_id` ASC),
  CONSTRAINT `fk_item_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_produce`
    FOREIGN KEY (`produce_id`)
    REFERENCES `produce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cart_item` ;

CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `date_added` DATE NULL,
  `approved` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_items_user_idx` (`user_id` ASC),
  INDEX `fk_cart_items_item_idx` (`item_id` ASC),
  CONSTRAINT `fk_cart_items_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_items_item`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS gardenUser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'gardenUser'@'localhost' IDENTIFIED BY 'gardenUser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'gardenUser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '4333 South Syracuse Street', 'Denver', 'Colorado', '80237');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '3895 S Vincennes Court', 'Denver', 'Colorado', '80237');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (3, '3755 S Magnolia Way', 'Denver', 'Colorado', '80237');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (4, '3501 S Colorado Boulevard', 'Denver', 'Colorado', '80113');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (5, '601 W. Dartmouth Ave', 'Englewood', 'Colorado', '80110');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (6, '2320 S. Race St', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (7, '123 Curvy Lane', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (8, '456 Hill Road', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (9, '789 Gutter Lane', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (10, '556 Tester Road', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (11, '7897 Lone Spider Lane', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (12, '4556 Broken Leg Lane', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (13, '433 Roundabout Raod', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (14, '4345 Escort Lane', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (15, '76 Ivory Tower Road', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (16, '505 Nullification Road', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (17, '7888 Smokey Mountain Road', 'Denver', 'Colorado', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (18, '877 Crustation Street', 'Denver', 'Colorado', '80210');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (1, 'gardner', 'test', 1, 7, 'https://i.imgur.com/p34fysi.png', 'gardner@yahoo', '1112223333', 'test', 'tester', '2019-11-15');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (2, 'larry', 'larry', 1, 8, 'https://i.imgur.com/oHjEQpe.png', 'larry@yahoo.com', '3334567789', 'Larry', 'Holt', '2019-11-15');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (3, 'steven', 'steven', 1, 9, 'https://i.imgur.com/1IH7hur.png', 'steven@yahoo.com', '7896654435', 'Steven', 'Kring', '2019-11-15');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (4, 'bill', 'bill', 1, 10, 'https://i.imgur.com/I3Etlhu.png', 'bill@yahoo.com', '4564443456', 'Bill', 'Johnson', '2019-11-15');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (5, 'gardenFool', 'gardenFool', 1, 11, 'https://i.imgur.com/O36rAQ6.png', 'gardenFool@gmail.com', '4438765546', 'Sarah', 'Evrite', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (6, 'bigToms', 'bigToms', 1, 12, 'https://i.imgur.com/adZm62d.png', 'bigToms@gmail.com', '6759304657', 'Sammy', 'Smith', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (7, 'christy', 'christy', 1, 13, 'https://i.imgur.com/mdfsX64.png', 'christy@gmail.com', '8968769783', 'Christy', 'Fristy', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (8, 'iGrowGold', 'iGrowGold', 1, 14, 'https://i.imgur.com/v0zMcdT.png', 'iGrowGold@gmail.com', '4648395047', 'Kristen', 'Kay', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (9, 'miracleGrower', 'miracleGrower', 1, 15, 'https://i.imgur.com/vojrERh.jpg', 'miracleGrower@gmail.com', '6748406736', 'Harold', 'Kumar', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (10, 'tommy', 'tommy', 1, 16, 'https://i.imgur.com/S5Fgujw.png', 'tommy@gmail.com', '5647395639', 'Timmy', 'Flinter', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (11, 'rakeNhoe', 'rakeNhoe', 1, 17, NULL, 'rakeNhoe@gmail.com', '6740767684', 'Jimmy', 'Creed', '2019-11-18');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `address_id`, `img_url`, `email`, `phone_number`, `first_name`, `last_name`, `create_date`) VALUES (12, 'sprouter', 'sprouter', 1, 18, NULL, 'sprouter@gmail.com', '4530098759', 'Kraig', 'Klien', '2019-11-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `garden`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (1, 1, 2500, 'Beautiful community garden that is very popular and has robust volunteer support.', 'Syracuse Community Garden');
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (2, 2, 2000, 'An elementary school based garden with raised concrete dividers.', 'Samuels School Community Garden');
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (3, 3, 2300, 'A school based community garden that features a very spacious layout.', 'Moose Meadows Community Garden');
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (4, 4, 3000, 'A very nice rural-feeling garden with supplied plant cages and supports.', 'First Plymouth Church Community Garden');
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (5, 5, 2700, 'An organic only community garden that has a large volunteer force. Water and planting supplies included.', 'Englewood Community Garden');
INSERT INTO `garden` (`id`, `address_id`, `size_sqft`, `description`, `name`) VALUES (6, 6, 5000, 'A nice Denver University based community garden great for students and professors. We supply gardening equipment and water.  ', 'DU Bridge Community Garden');

COMMIT;


-- -----------------------------------------------------
-- Data for table `plot`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (1, 1, 1, 500, 1);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (2, 1, 2, 500, 1);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (3, 1, 3, 500, 1);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (4, 2, 4, 500, 1);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (5, 2, 5, 500, 1);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (6, 3, 1, 500, 2);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (7, 3, 2, 500, 2);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (8, 4, 3, 500, 2);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (9, 4, 4, 500, 2);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (10, 5, 1, 600, 3);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (11, 5, 2, 600, 3);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (12, 6, 3, 600, 3);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (13, 6, 4, 500, 3);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (14, 7, 1, 600, 4);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (15, 7, 2, 600, 4);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (16, 7, 3, 600, 4);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (17, 8, 4, 600, 4);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (18, 8, 5, 600, 4);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (19, 9, 1, 700, 5);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (20, 9, 2, 700, 5);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (21, 10, 3, 700, 5);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (22, 10, 4, 600, 5);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (23, 11, 1, 1000, 6);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (24, 11, 2, 1000, 6);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (25, 11, 3, 1000, 6);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (26, 12, 4, 1000, 6);
INSERT INTO `plot` (`id`, `user_id`, `plot_number`, `size_sqft`, `garden_id`) VALUES (27, 12, 5, 1000, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `produce`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (1, 'potato', 'https://i.imgur.com/btVsOOp.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (2, 'corn', 'https://i.imgur.com/H5FyCsS.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (3, 'strawberry', 'https://i.imgur.com/kOmAgvJ.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (4, 'broccoli', 'https://i.imgur.com/j0uOJo2.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (5, 'tomato', 'https://i.imgur.com/lXRDdOk.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (6, 'cucumber', 'https://i.imgur.com/KuQcRgo.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (7, 'pear', 'https://i.imgur.com/CDybfvp.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (8, 'orange', 'https://i.imgur.com/8IeZrWj.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (9, 'bell pepper', 'https://i.imgur.com/UdREVi5.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (10, 'garlic', 'https://i.imgur.com/GS4dYk0.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (11, 'apple', 'https://i.imgur.com/oteNstQ.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (12, 'raddish', 'https://i.imgur.com/1mDGliP.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (13, 'grape', 'https://i.imgur.com/CBHUxsP.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (14, 'banana', 'https://i.imgur.com/qFmH9mg.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (15, 'cabbage', 'https://i.imgur.com/t5X2EuP.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (16, 'onion', 'https://i.imgur.com/XJRh3am.jpg');
INSERT INTO `produce` (`id`, `name`, `img_url`) VALUES (17, 'carrot', 'https://i.imgur.com/J2IKePs.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (1, 1, 1, '5lb bag(s)', '2019-11-15', '2020-01-15', 1, NULL, 1);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (2, 1, 24, 'ear(s)', '2019-11-15', '2019-12-30', 1, NULL, 2);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (3, 1, 1, 'basket(s)', '2019-11-15', '2019-11-18', 1, NULL, 3);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (4, 1, 1, 'head(s)', '2019-11-15', '2019-11-20', 1, NULL, 4);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (5, 2, 1, 'pound(s)', '2019-11-15', '2019-11-22', 1, NULL, 5);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (6, 2, 2, 'pound(s)', '2019-11-15', '2019-11-24', 1, NULL, 6);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (7, 2, 3, 'pound(s)', '2019-11-15', '2019-11-20', 1, NULL, 7);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (8, 3, 1, 'pound(s)', '2019-11-15', '2019-11-20', 1, NULL, 8);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (9, 3, 1, 'pound(s)', '2019-11-15', '2019-11-28', 1, NULL, 9);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (10, 4, 8, 'ounces', '2019-11-17', '2019-12-02', 1, NULL, 10);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (11, 4, 2, 'pound(s)', '2019-11-17', '2019-12-02', 1, NULL, 11);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (12, 5, 20, 'ounces', '2019-11-17', '2019-12-02', 1, NULL, 12);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (13, 5, 13, 'ounces', '2019-11-17', '2019-12-02', 1, NULL, 13);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (14, 6, 1, 'pound(s)', '2019-11-19', '2019-12-02', 1, NULL, 14);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (15, 6, 1, 'head(s)', '2019-11-19', '2019-12-02', 1, NULL, 15);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (16, 6, 1, 'pound(s)', '2019-11-19', '2019-12-02', 1, NULL, 16);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (17, 7, 1, 'pound(s)', '2019-11-19', '2019-12-02', 1, NULL, 17);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (18, 7, 12, 'ear(s)', '2019-11-19', '2019-12-02', 1, NULL, 2);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (19, 8, 2, 'basket(s)', '2019-11-19', '2019-12-02', 1, NULL, 3);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (20, 8, 1, 'head(s)', '2019-11-21', '2019-12-02', 1, NULL, 4);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (21, 9, 1, 'pound(s)', '2019-11-21', '2019-12-04', 1, NULL, 5);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (22, 9, 1, 'pound(s)', '2019-11-21', '2019-12-04', 1, NULL, 6);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (23, 9, 1, 'pound(s)', '2019-11-21', '2019-12-04', 1, NULL, 7);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (24, 10, 1, 'pound(s)', '2019-11-21', '2019-12-04', 1, NULL, 8);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (25, 10, 1, 'pound(s)', '2019-11-21', '2019-12-04', 1, NULL, 9);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (26, 11, 12, 'ounces', '2019-11-21', '2019-12-01', 1, NULL, 10);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (27, 11, 1, 'pound(s)', '2019-11-21', '2019-12-01', 1, NULL, 11);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (28, 12, 10, 'ounces', '2019-11-21', '2019-12-01', 1, NULL, 13);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (29, 12, 14, 'ounces', '2019-11-21', '2019-12-05', 1, NULL, 14);
INSERT INTO `item` (`id`, `user_id`, `quantity`, `unit`, `harvest_date`, `use_by_date`, `available`, `img_url`, `produce_id`) VALUES (30, 12, 1, 'head(s)', '2019-11-21', '2019-12-05', 1, NULL, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cart_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `nomadicGardensDB`;
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (1, 1, 1, '2019-11-15', 0);
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (2, 2, 2, '2019-11-15', 0);
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (3, 3, 3, '2019-11-15', 0);
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (4, 2, 4, '2019-11-15', 0);
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (5, 4, 5, '2019-11-15', 0);
INSERT INTO `cart_item` (`id`, `user_id`, `item_id`, `date_added`, `approved`) VALUES (6, 5, 6, '2019-11-15', 0);

COMMIT;

