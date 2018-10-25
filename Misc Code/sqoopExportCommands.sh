$ sqoop export (generic-args) (export-args)
$ sqoop-export (generic-args) (export-args)
#appends new rows to a table; each input record is transformed into an INSERT statement that adds a row to the target database table
#connections
--connect <jdbc-uri>	#Specify JDBC connect string 
						#--connect jdbc:mysql://db.example.com/foo --call barproc --export-dir /results/bar_data
--connection-manager <class-name>	#Specify connection manager class to use
--driver <class-name>	#Manually specify JDBC driver class to use
--hadoop-mapred-home <dir>	#Override $HADOOP_MAPRED_HOME

--connection-param-file <filename>	#Optional properties file that provides connection parameters
--relaxed-isolation	#Set connection transaction isolation to read uncommitted for the mappers.
#access
--password-file	#Set path for a file containing the authentication password
-P	#Read password from console
--password <password>	#Set authentication password
--username <username>	#Set authentication username

#
--help	#Print usage instructions
--verbose	#Print more information while working

#Validate the data copied, either import or export by comparing the row counts from the source and the target post copy.
--validate	#Enable validation of data copied, supports single table copy only.
--validator <class-name>	#Specify validator class to use.
--validation-threshold <class-name>	#Specify validation threshold class to use.
--validation-failurehandler <class-name>	#Specify validation failure handler class to use.

#export control
#The --export-dir argument and one of --table or --call are required.
--export-dir <dir>	#HDFS source path for the export
--columns <col,col,col…>	#Columns to export to table
--table <table-name>	#Table to populate
--call <stored-proc-name>	#Stored Procedure to call
--staging-table <staging-table-name>	#The table in which data will be staged before being inserted into the destination table.
#updates
--update-key <col-name>	#Anchor column to use for updates. Use a comma separated list of columns if there are more than one column.
						#example: sqoop-export --table foo --update-key id --export-dir /path/to/data --connect 
						#Sqoop will instead modify an existing dataset in the database
						#if an UPDATE statement modifies no rows, this is not considered an error; the export will silently continue. 
						#can be given a comma separated list of column names.
--update-mode <mode>	#Specify how updates are performed when new rows are found with non-matching keys in database.
						#Legal values for mode include updateonly (default) and allowinsert.

#input parsing options
--input-null-string <null-string>	#The string to be interpreted as null for string columns
--input-null-non-string <null-string>	The string to be interpreted as null for non-string columns
--input-enclosed-by <char>	Sets a required field encloser
--input-escaped-by <char>	Sets the input escape character
--input-fields-terminated-by <char>	Sets the input field separator
--input-lines-terminated-by <char>	Sets the input end-of-line character
--input-optionally-enclosed-by <char>	Sets a field enclosing character
#execution options
--direct	#Use direct export fast path
-m,--num-mappers <n>	#Use n map tasks to export in parallel
--clear-staging-table	#Indicates that any data present in the staging table can be deleted.
--batch	#Use batch mode for underlying statement execution.

#output options
--enclosed-by <char>	#Sets a required field enclosing character
--escaped-by <char>	#Sets the escape character
--fields-terminated-by <char>	#Sets the field separator character
--lines-terminated-by <char>	#Sets the end-of-line character
--optionally-enclosed-by <char>	#Sets a field enclosing character
--mysql-delimiters	#Uses MySQL’s default delimiter set: fields: , lines: \n escaped-by: \ optionally-enclosed-by: 