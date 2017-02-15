SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `BookStoreDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BookStoreDB` ;

-- -----------------------------------------------------
-- Table `BookStoreDB`.`author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`author` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`author` (
  `id` INT NOT NULL ,
  `author_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`products` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`products` (
  `id` INT NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(150) NOT NULL ,
  `decription_full` TEXT NOT NULL ,
  `author_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_products_author1_idx` (`author_id` ASC) ,
  CONSTRAINT `fk_products_author1`
    FOREIGN KEY (`author_id` )
    REFERENCES `BookStoreDB`.`author` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`user` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`user` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `is_admin` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`status` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`status` (
  `status_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_name`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`orders` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`orders` (
  `id` INT NOT NULL ,
  `shipping_adres` VARCHAR(250) NOT NULL ,
  `billing_adres` VARCHAR(250) NOT NULL ,
  `user_id` INT NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_orders_user1_idx` (`user_id` ASC) ,
  INDEX `fk_orders_status1_idx` (`status` ASC) ,
  CONSTRAINT `fk_orders_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `BookStoreDB`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_status1`
    FOREIGN KEY (`status` )
    REFERENCES `BookStoreDB`.`status` (`status_name` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`orders_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`orders_has_products` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`orders_has_products` (
  `orders_id` INT NOT NULL ,
  `products_id` INT NOT NULL ,
  PRIMARY KEY (`orders_id`, `products_id`) ,
  INDEX `fk_orders_has_products_products1_idx` (`products_id` ASC) ,
  INDEX `fk_orders_has_products_orders_idx` (`orders_id` ASC) ,
  CONSTRAINT `fk_orders_has_products_orders`
    FOREIGN KEY (`orders_id` )
    REFERENCES `BookStoreDB`.`orders` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`products_id` )
    REFERENCES `BookStoreDB`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`images` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`images` (
  `id` INT NOT NULL ,
  `path` VARCHAR(250) NOT NULL ,
  `products_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_images_products1_idx` (`products_id` ASC) ,
  CONSTRAINT `fk_images_products1`
    FOREIGN KEY (`products_id` )
    REFERENCES `BookStoreDB`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`categories` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`categories` (
  `id` INT NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(150) NOT NULL ,
  `images_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_categories_images1_idx` (`images_id` ASC) ,
  CONSTRAINT `fk_categories_images1`
    FOREIGN KEY (`images_id` )
    REFERENCES `BookStoreDB`.`images` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookStoreDB`.`categories_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookStoreDB`.`categories_has_products` ;

CREATE  TABLE IF NOT EXISTS `BookStoreDB`.`categories_has_products` (
  `categories_id` INT NOT NULL ,
  `products_id` INT NOT NULL ,
  PRIMARY KEY (`categories_id`, `products_id`) ,
  INDEX `fk_categories_has_products_products1_idx` (`products_id` ASC) ,
  INDEX `fk_categories_has_products_categories1_idx` (`categories_id` ASC) ,
  CONSTRAINT `fk_categories_has_products_categories1`
    FOREIGN KEY (`categories_id` )
    REFERENCES `BookStoreDB`.`categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_has_products_products1`
    FOREIGN KEY (`products_id` )
    REFERENCES `BookStoreDB`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `BookStoreDB` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
