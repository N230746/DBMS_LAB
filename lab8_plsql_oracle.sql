set SERVEROUTPUT ON;
begin
    DBMS_OUTPUT.PUT_LINE('Welcome to PlayStoreDB');
end;
/
declare
  v_appname apps.AppName%type;
  v_rating apps.Rating%type;
begin
   select AppName,Rating
   into v_appname,v_rating
   from Apps
   where AppId=1001;
   DBMS_OUTPUT.PUT_LINE('App Name:'||v_appname);
   DBMS_OUTPUT.PUT_LINE('App Rating:'||v_rating);
end;
/
DECLARE
    v_price Apps.Price%TYPE;
    v_result NUMBER;
    v_id Apps.AppID%TYPE := 1001;
BEGIN
    SELECT Price INTO v_price
    FROM Apps
    WHERE AppID = v_id;

    v_result := v_price * 0.10;

    DBMS_OUTPUT.PUT_LINE('10% of Price = ' || v_result);
END;
/

DECLARE
    v_id Apps.AppID%TYPE := 1003;
    v_name Apps.AppName%TYPE;
    v_rating Apps.Rating%TYPE;
    v_price Apps.Price%TYPE;
    v_downloads Apps.Downloads%TYPE;
BEGIN
    SELECT AppName, Rating, Price, Downloads
    INTO v_name, v_rating, v_price, v_downloads
    FROM Apps
    WHERE AppID = v_id;

    DBMS_OUTPUT.PUT_LINE('Application Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Rating: ' || v_rating);
    DBMS_OUTPUT.PUT_LINE('Price: ' || v_price);
    DBMS_OUTPUT.PUT_LINE('Downloads: ' || v_downloads);
END;
/

DECLARE
    v_id Apps.AppID%TYPE := 1003;
    v_rating Apps.Rating%TYPE;
BEGIN
    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = v_id;

    IF v_rating >= 4.5 THEN
        DBMS_OUTPUT.PUT_LINE('Highly Rated');
    ELSIF v_rating >= 3.5 THEN
        DBMS_OUTPUT.PUT_LINE('Moderately Rated');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Low Rated');
    END IF;
END;
/
CREATE OR REPLACE FUNCTION CheckPrice(
    p_price IN NUMBER
)
RETURN VARCHAR2
IS
BEGIN
    IF p_price > 0 THEN
        RETURN 'Paid Application';
    ELSE
        RETURN 'Free Application';
    END IF;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(CheckPrice(100));
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

DECLARE
    CURSOR app_cursor IS
        SELECT AppName, Rating, Price, Downloads
        FROM Apps;
BEGIN
    FOR app_rec IN app_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Application Name: ' || app_rec.AppName ||
            ' Rating: ' || app_rec.Rating ||
            ' Price: ' || app_rec.Price ||
            ' Downloads: ' || app_rec.Downloads
        );

    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE find_application(
    p_app_id IN Apps.AppID%TYPE
)
IS
    v_name Apps.AppName%TYPE;
    v_rating Apps.Rating%TYPE;
    v_price Apps.Price%TYPE;
BEGIN
    SELECT AppName, Rating, Price
    INTO v_name, v_rating, v_price
    FROM Apps
    WHERE AppID = p_app_id;

    DBMS_OUTPUT.PUT_LINE('Application Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Rating: ' || v_rating);
    DBMS_OUTPUT.PUT_LINE('Price: ' || v_price);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Application not found');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;
/
BEGIN
    find_application(1001);
END;
/
