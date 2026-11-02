
use playstoredb;
DELIMITER //
create procedure welcome_playstore()
begin
   select 'welcome to playstoreDB' as Message;
end //
DELIMITER ;
call welcome_playstore();
delimiter //
create procedure get_app_details(IN p_appid int)
begin 
   select AppName,Rating
   from apps
   where AppId=p_appid;
end //
delimiter ;
DELIMITER //

CREATE PROCEDURE CalculatePrice(IN p_id INT)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_result DECIMAL(10,2);
    SELECT Price INTO v_price
    FROM Apps
    WHERE AppID = p_id;
    SET v_result = v_price * 0.10;
    SELECT v_result AS '10% of Price';
END //
DELIMITER ;
call CalculatePrice(1001);
DELIMITER //

CREATE PROCEDURE CheckRating(IN p_id INT)
BEGIN
    DECLARE v_rating DECIMAL(3,2);
    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_id;
    IF v_rating >= 4.5 THEN
        SELECT 'Highly Rated' AS Rating_Category;

    ELSEIF v_rating >= 3.5 THEN
        SELECT 'Moderately Rated' AS Rating_Category;
    ELSE
        SELECT 'Low Rated' AS Rating_Category;
    END IF;
END //
DELIMITER ;
call checkRating(1002);
DELIMITER //
CREATE FUNCTION CheckPrice(p_price DECIMAL(10,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF p_price > 0 THEN
        RETURN 'Paid Application';
    ELSE
        RETURN 'Free Application';
    END IF;
END //
DELIMITER ;
select CheckPrice(1004);
DELIMITER //
CREATE PROCEDURE DisplayNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        SELECT i;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
call DisplayNumbers();

DELIMITER //
CREATE PROCEDURE display_applications()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(255);
    DECLARE v_rating DECIMAL(3,2);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_downloads BIGINT;
    DECLARE app_cursor CURSOR FOR
        SELECT AppName, Rating, Price, Downloads
        FROM Apps;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;
    OPEN app_cursor;
    read_loop: LOOP
        FETCH app_cursor
        INTO v_name, v_rating, v_price, v_downloads;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT
            v_name AS Application_Name,
            v_rating AS Rating,
            v_price AS Price,
            v_downloads AS Downloads;
    END LOOP;
    CLOSE app_cursor;
END //
DELIMITER ;
call display_applications();

DELIMITER //
CREATE PROCEDURE find_application(
    IN p_app_id INT
)
BEGIN
    DECLARE v_name VARCHAR(255);
    DECLARE v_rating DECIMAL(3,2);
    DECLARE v_price DECIMAL(10,2);
    DECLARE done INT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;
    SELECT AppName, Rating, Price
    INTO v_name, v_rating, v_price
    FROM Apps
    WHERE AppID = p_app_id;
    IF done THEN
        SELECT 'Application not found' AS Message;
    ELSE
        SELECT
            v_name AS Application_Name,
            v_rating AS Rating,
            v_price AS Price;
    END IF;
END //
DELIMITER ;
call find_application(1001);