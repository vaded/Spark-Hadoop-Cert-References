Database|	version|	--direct support?|	connect string matches
HSQLDB	1.8.0+	No	jdbc:hsqldb:*//
MySQL	5.0+	Yes	jdbc:mysql://
Oracle	10.2.0+	Yes	jdbc:oracle:*//
PostgreSQL	8.3+	Yes (import only)	jdbc:postgresql://
CUBRID	9.2+	NO	jdbc:cubrid:*

#List database schemas present on a server.
$ sqoop list-databases (generic-args) (list-databases-args)
$ sqoop-list-databases (generic-args) (list-databases-args)
#List tables present in a database.
$ sqoop list-tables (generic-args) (list-tables-args)
$ sqoop-list-tables (generic-args) (list-tables-args)
#sqoop-create-hive-table
#The create-hive-table tool populates a Hive metastore with a definition for a table based on a database table previously imported to HDFS, or one planned to be imported. 
#This effectively performs the "--hive-import" step of sqoop-import without running the preceeding import.
$ sqoop create-hive-table (generic-args) (create-hive-table-args)
$ sqoop-create-hive-table (generic-args) (create-hive-table-args)
#sqoop create-hive-table --connect jdbc:mysql://db.example.com/corp --table employees --hive-table emps
#hive args
--hive-home <dir>	#Override $HIVE_HOME
--hive-overwrite	#Overwrite existing data in the Hive table.
--create-hive-table	#If set, then the job will fail if the target hive table exists. By default this property is false.
--hive-table <table-name>	#Sets the table name to use when importing to Hive.
--table	#The database table to read the definition from.

#merge 
#combine two datasets where entries in one dataset should overwrite entries of an older dataset.
$ sqoop merge (generic-args) (merge-args)
$ sqoop-merge (generic-args) (merge-args)
#$ sqoop merge --new-data newer --onto older --target-dir merged \
   # --jar-file datatypes.jar --class-name Foo --merge-key id
--class-name <class>	#Specify the name of the record-specific class to use during the merge job.
--jar-file <file>	#Specify the name of the jar to load the record class from.
--merge-key <col>	#Specify the name of a column to use as the merge key.
--new-data <path>	#Specify the path of the newer dataset.
--onto <path>	#Specify the path of the older dataset.
--target-dir <path>	#Specify the target path for the output of the merge job.
#running sql w sqoop
#eval tool allows users to quickly run simple SQL queries against a database;  evaluation purpose only.
$ sqoop eval (generic-args) (eval-args)
$ sqoop-eval (generic-args) (eval-args)
#sqoop jobs
$ sqoop job (generic-args) (job-args) [-- [subtool-name] (subtool-args)]
$ sqoop-job (generic-args) (job-args) [-- [subtool-name] (subtool-args)]
#sqoop job --create myjob -- import --connect jdbc:mysql://example.com/db --table mytable
--create <job-id>	#Define a new saved job with the specified job-id (name). A second Sqoop command-line, separated by a -- should be specified; this defines the saved job.
--delete <job-id>	#Delete a saved job.
--exec <job-id>	#Given a job defined with --create, run the saved job.
--show <job-id>	#Show the parameters for a saved job.
--list	#List all saved jobs
--meta-connect <jdbc-uri>	#Specifies the JDBC connect string used to connect to the metastore
#In conf/sqoop-site.xml, you can configure sqoop.metastore.client.autoconnect.url with this address, so you do not have to supply --meta-connect to use a remote metastore.
#############################################################################
#metastore 
$ sqoop metastore (generic-args) (metastore-args)
$ sqoop-metastore (generic-args) (metastore-args)
#metastore tool configures Sqoop to host a shared metadata repository
--shutdown	#Shuts down a running metastore instance on the same machine.
#properties
sqoop.metastore.server.location #The location of the metastore’s files on disk in conf/sqoop-site.xml
sqoop.metastore.server.port #available over TCP/IP.defaults to 16000.
qoop.metastore.client.autoconnect.url #connect to the metastore by specifying 
	#or --meta-connect
	# with the value jdbc:hsqldb:hsql://<server-name>:<port>/sqoop.


#codegen
#codegen tool generates Java classes which encapsulate and interpret imported records.
#there are a lot more options @http://sqoop.apache.org/docs/1.4.7/SqoopUserGuide.html#_purpose_4
$ sqoop codegen (generic-args) (codegen-args)
$ sqoop-codegen (generic-args) (codegen-args)
--connect <jdbc-uri>	#Specify JDBC connect string
--connection-manager <class-name>	#Specify connection manager class to use
--driver <class-name>	#Manually specify JDBC driver class to use
--hadoop-mapred-home <dir>	#Override $HADOOP_MAPRED_HOME

--password-file	#Set path for a file containing the authentication password
-P	#Read password from console
--password <password>	#Set authentication password
--username <username>	#Set authentication username
--connection-param-file <filename>	#Optional properties file that provides connection parameters
--relaxed-isolation	#Set connection transaction isolation to read uncommitted for the mappers.
