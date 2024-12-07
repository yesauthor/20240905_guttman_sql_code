/* SQL installation script: Creating User and Roles on MySQL
  Name: Mona          Date Created:12/2/2024
                            Date Modified: 12/2/24
  Purpose: Second project for class
*/

SELECT '' AS 'Installation Starting!!!';

-- dropping le users

SELECT '' AS 'Dropping users';

DROP USER IF EXISTS 'prj_root'@'localhost';
DROP USER IF EXISTS 'prj_user_01'@'localhost';
DROP USER IF EXISTS 'prj_user_02'@'localhost';
DROP USER IF EXISTS 'prj_user_03'@'localhost';

-- create le users
SELECT '' AS 'Creating user';

CREATE USER IF NOT EXISTS  'prj_root'@'localhost'
        IDENTIFIED BY  'project_user0'
        PASSWORD REQUIRE CURRENT;


CREATE USER IF NOT EXISTS 'prj_user_01'@'localhost'
        IDENTIFIED BY 'prj_user1'

        FAILED_LOGIN_ATTEMPTS 0
        PASSWORD_LOCK_TIME 0
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'prj_user_02'@'localhost'
        IDENTIFIED BY 'prj_user2'

        FAILED_LOGIN_ATTEMPTS 0
        PASSWORD_LOCK_TIME 1
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'prj_user_03'@'localhost'
        IDENTIFIED BY 'prj_user3'

        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LOCK_TIME UNBOUNDED
        PASSWORD EXPIRE INTERVAL 90 DAY
        PASSWORD HISTORY 5
        PASSWORD REUSE INTERVAL 365 DAY;

-- role creation
SELECT '' AS 'CREATING ROLES';
DROP  ROLE IF EXISTS  'read_only_classicmodels_db',
                      'read_all_employees_db';

CREATE ROLE IF NOT EXISTS 'read_only_classicmodels_db',
                          'read_all_employees_db';

SELECT '' AS 'Granting privileges';
-- giving out privileges :)

GRANT  INSERT, UPDATE
  ON employees.* TO 'prj_user_01'@'localhost' WITH GRANT OPTION;

SELECT '' AS 'Privileges for prj_user_01 Created';


GRANT read_only_classicmodels_db TO 'prj_user_02'@'localhost';

SELECT '' AS 'Privileges for prj_user_02 Created';


GRANT read_only_employees_db TO 'prj_user_03'@'localhost';

SELECT '' AS 'Privileges for prj_user_03 Created';

SELECT user, show_db_priv, account_locked
FROM mysql.user;
SELECT '' AS 'Installation Completed';
