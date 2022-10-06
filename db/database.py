import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Sk998877.",
    database = "Lawly",
    auth_plugin ='mysql_native_password'
)
mycursor = mydb.cursor()
# mycursor.execute("CREATE DATABASE Lawly")
mycursor.execute("SHOW DATABASES")
# for x in mycursor:
#     print(x)
"""
mycursor.execute("CREATE TABLE `lawyers` (`lwID` int(11) NOT NULL,`lwfname` varchar(20) NOT NULL,`lwlname` varchar(20) NOT NULL,`lwmail` varchar(30) NOT NULL) ")
mycursor.execute("ALTER TABLE `lawyers`ADD PRIMARY KEY (`lwID`);")
mycursor.execute("ALTER TABLE `lawyers` MODIFY `lwID` int(11) NOT NULL AUTO_INCREMENT;")"""
