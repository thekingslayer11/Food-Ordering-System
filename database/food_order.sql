SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:30";








CREATE TABLE admin(
  id int NOT NULL PRIMARY KEY,
  fullName varchar(50) NOT NULL,
  userName varchar(30) NOT NULL,
  password varchar(255) NOT NULL);



INSERT INTO admin VALUES
(11, 'Md Ashif', 'Ashif', '827ccb0eea8a706c4c34a16891f84e7b');


CREATE TABLE category(
  id int NOT NULL PRIMARY KEY,
  title varchar(20) NOT NULL,
  image_name varchar(30) NOT NULL,
  featured varchar(10) NOT NULL,
  active varchar(10) NOT NULL);



INSERT INTO category VALUES
(1, 'Burger', 'burger.jpg', 'Yes', 'Yes'),
(2, 'Pizza', 'pizza.jpg', 'Yes', 'Yes'),
(3, 'Cupcakes', 'cupcake.jpg', 'Yes', 'Yes'),
(4, 'Sundae', 'sundae.jpg', 'Yes', 'Yes');



CREATE TABLE customer (
  id int NOT NULL PRIMARY KEY,
  email varchar(40) NOT NULL,
  username varchar(20) NOT NULL,
  password varchar(20) NOT NULL);



INSERT INTO customer VALUES
(1, 'ashifh@gmail.com', 'Ashif', '12345');



CREATE TABLE food(
  id int NOT NULL UNIQUE,
  title varchar(100) NOT NULL PRIMARY KEY,
  description text NOT NULL,
  price decimal(10,2) NOT NULL,
  image_name varchar(50) NOT NULL,
  category_id int NOT NULL,
  featured varchar(10) NOT NULL,
  active varchar(10) NOT NULL,
  FOREIGN KEY(category_id) REFERENCES category(id));



INSERT INTO food VALUES
(1, 'Supreme Veggie Burger', 'Worlds Biggest Burger', '10.00', 'foodname-196.jpg', 1, 'No', 'Yes'),
(2, 'Hawaiian Pizza', 'Finest Hawaiian Import', '30.00', 'hawaiian-pizza.jpg', 2, 'No', 'Yes'),
(3, 'Cheese Pizza', 'Cheesy Delight', '30.00', 'cheese-pizza.jpg', 2, 'No', 'Yes'),
(4, 'BBQ Chicken Pizza', 'Chicken like No Other', '70.00', 'BBQ-Chicken-Pizza.jpg', 2, 'Yes', 'Yes'),
(5, 'Margherita Pizza', 'Marg-he-rita!', '40.00', 'Margherita-pizza.jpg', 2, 'Yes', 'Yes'),
(6, 'Paneer Pizza', 'Panner and Pizza combo always the best...', '30.00', 'paneer-pizza.jpg', 2, 'Yes', 'Yes'),
(7, 'Supreme Pizza', 'Better than the Rest', '50.00', 'supremepizza.jpg', 2, 'No', 'Yes');

INSERT INTO food VALUES
(8, 'Bacon Cheese', 'Finest Bacon', '10.00', 'bacon-cheese.jpg', 1, 'No', 'Yes'),
(9, 'Grilled Burger', 'Fried And Grilled To The Best', '20.00', 'grilled.jpg', 1, 'No', 'Yes'),
(10, 'Cheese Burger', 'Cheesy Delight', '20.00', 'cheese-burger.jpg', 1, 'No', 'Yes');

INSERT INTO food VALUES
(11, 'Chocolate Cupcake', 'Choc-Choc', '10.00', 'Chocolate-Cup.jpg', 3, 'Yes', 'Yes'),
(12, 'Dancing Queen Cupcakes', 'The Queen Of Cupcakes', '10.00', 'Dancing-Queen-Cupcakes.jpg', 3, 'Yes', 'Yes'),
(13, 'Galaxy Cupcakes', 'Stars Of The Galaxy', '20.00', 'Galaxy-Cupcakes.jpg', 3, 'Yes', 'Yes'),
(14, 'Neapolitan cupcakes', 'The Best Of The Best', '20.00', 'neapolitan-cupcakes.jpg', 3, 'No', 'Yes'),
(15, 'Vanilla Cupcake', 'Smooth Vanilla', '20.00', 'Vanilla-Cupcakes-3.jpg', 3, 'No', 'Yes');

INSERT INTO food VALUES
(16, 'Chocolate Sundae', 'Choco Delight', '20.00', 'Chocolate-Sundae.jpg', 4, 'No', 'Yes'),
(17, 'Healthy Key Lime Pie Sundae', 'Health And Taste In One', '20.00', 'Healthy-Key-Lime-Pie-Sundaes.jpg', 4, 'Yes', 'Yes'),
(18, 'Raspberry Sundae', 'Best Berry Sundae', '30.00', 'Raspberry-Sundae.jpg', 4, 'Yes', 'Yes'),
(19, 'Strawberry Sundae', 'Nah this one is better', '30.00', 'Strawberry-Sundae.jpg', 4, 'No', 'Yes');






CREATE TABLE `order` (
  id int NOT NULL PRIMARY KEY,
  food varchar(50) NOT NULL,
  price decimal(10,2) NOT NULL,
  qty int NOT NULL,
  total decimal(10,2) NOT NULL DEFAULT 0,
  order_time varchar(10) NOT NULL,
  status varchar(15) NOT NULL,
  customer_name varchar(50) NOT NULL,
  customer_contact varchar(10) NOT NULL,
  customer_email varchar(30) NOT NULL,
  customer_address varchar(55) NOT NULL,
  image_name varchar(30) NOT NULL,
  FOREIGN KEY(food) REFERENCES food(title));


INSERT INTO `order`(`id`, `food`, `price`, `qty`, `order_time`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`, `image_name`)VALUES
(1, 'Supreme Veggie Burger', '10.00', 5, '05:16:13', 'Delivered', 'Agam Jyot', '9490325275', 'agamjyot26@gmail.com', 'Hanuman Nagar, Arekere', 'foodname-196.jpg'),
(2, 'Hawaiian Pizza', '30.00', 4, '07:25:02', 'Ordered', 'Shantanu Joshi', '7424991103', 'shantu777@gmail.com', 'National Games Village, Kormangala', 'hawaiian-pizza.jpg');

UPDATE `order` SET total=price*qty;



ALTER TABLE admin
  MODIFY id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;


ALTER TABLE category
  MODIFY id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE customer
  MODIFY id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE food
  MODIFY id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `order`
  MODIFY id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

COMMIT;

