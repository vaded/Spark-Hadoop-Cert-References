sqoop import 
	--driver com.microsoft.jdbc.sqlserver.SQLServerDriver --connect <connect-string> #mssql example
	--connect jdbc:mysql://localhost:3306/sqoop #mysql example
sqoop import-mainframe (generic-args) (import-args) #Import from mainframe
	--connect <hostname>	#Specify mainframe host to connect
	--connection-manager <class-name>	#Specify connection manager class to use
	--dataset foo #mainframe dataset 




#access
--username root 
-P #Read password from console
--password-file	#Set path for a file containing the authentication password
--password <password>	#Set authentication password
--connection-param-file <filename>	Optional properties file that provides connection parameters
--verbose	#Print more information while working
#selections
--query 'SELECT a.*, b.* FROM a JOIN b on (a.id == b.id) WHERE $CONDITIONS'
--split-by id #Specifies your splitting column.
--columns id,name 
--table customer  
#targets
--target-dir /user/cloudera/ingest/raw/customers #HDFS destination directory.
--warehouse-dir #adjust the parent directory
--hadoop-mapred-home <dir>	#Override $HADOOP_MAPRED_HOME
#execution options
-m,--num-mappers <n>	#Use n map tasks to import in parallel
 -z,--compress	#Enable compression
 --compression-codec <c>	#Use Hadoop codec (default gzip)
 --bindir <dir>	#Output directory for compiled objects
--jar-file <file>	#Disable code generation; use specified jar
--outdir <dir>	#Output directory for generated code
--package-name <name>	#Put auto-generated classes in this package
-delete-target-dir	#Delete the import target directory mainframe if it exists
#import formating
--fields-terminated-by "," 
--input-enclosed-by <char>	#Sets a required field encloser
--input-escaped-by <char>	#Sets the input escape character
--input-fields-terminated-by <char>	#Sets the input field separator
--input-lines-terminated-by <char>	#Sets the input end-of-line character
--input-optionally-enclosed-by <char>	#Sets a field enclosing character
--skip-dist-cache #in Sqoop command when launched by Oozie will skip the step which Sqoop copies its dependencies to job cache and save massive I/O.
--map-column-java id=String,value=Integer # <mapping> Override mapping from SQL to Java type for configured columns.
--map-column-hive <mapping>	 #Override mapping from SQL to Hive type for configured columns.
--check-column (col)	#Specifies the column to be examined when determining which rows to import. (the column should not be of type CHAR/NCHAR/VARCHAR/VARNCHAR/ LONGVARCHAR/LONGNVARCHAR)
--incremental (mode)	#Specifies how Sqoop determines which rows are new. Legal values for mode include append and lastmodified.
--last-value (value)	#Specifies the maximum value of the check column from the previous import.

#output types
--as-avrodatafile	#Imports data to Avro Data Files
--as-sequencefile	#Imports data to SequenceFiles
--as-textfile	#Imports data as plain text (default)
--as-parquetfile	#Imports data to Parquet Files

#output format options
--enclosed-by <char>	#Sets a required field enclosing character
--escaped-by <char>	#Sets the escape character
--fields-terminated-by <char>	#Sets the field separator character
--lines-terminated-by <char>	#Sets the end-of-line character
--mysql-delimiters	#Uses MySQL’s default delimiter set: fields: , lines: \n escaped-by: \ optionally-enclosed-by: 
					#Uses MySQL’s default delimiter set: fields: , lines: \n escaped-by: \ optionally-enclosed-by: 
--optionally-enclosed-by <char>	#Sets a field enclosing character

####Into HIVE arguments
--hive-import #Import table into Hive (Uses Hive’s default delimiters if none are set.)
--create-hive-table #Determines if set job will fail if a Hive table already exists.
--hive-table sqoop_workspace.customers #Specifies <db_name>.<table_name>
--hive-home <dir>	#Override $HIVE_HOME
--hive-table <table-name>	#Sets the table name to use when importing to Hive.
--hive-drop-import-delims	#Drops \n, \r, and \01 from string fields when importing to Hive.
--hive-delims-replacement	#Replace \n, \r, and \01 from string fields with user defined string when importing to Hive.
--hive-partition-key	#Name of a hive field to partition are sharded on
--hive-partition-value <v>	#String-value that serves as partition key for this imported into hive in this job.
--map-column-hive <map>	#Override default mapping from SQL type to Hive type for configured columns. If specify commas in this argument, use URL encoded keys and values, for example, use DECIMAL(1%2C%201) instead of DECIMAL(1, 1).
--compress #or --compression-codec import compressed tables into Hive see abv


#into HBASE
--column-family <family>	#Sets the target column family for the import
--hbase-create-table	#If specified, create missing HBase tables
--hbase-row-key <col>	#Specifies which input column to use as the row key In case, if input table contains composite key, 
						#then <col> must be in the form of a comma-separated list of composite key attributes
--hbase-table <table-name>	#Specifies an HBase table to use as the target instead of HDFS
--hbase-bulkload	#Enables bulk loading
#incompatable with --direct



#into Accumulo arguments
--accumulo-table <table-nam>	#Specifies an Accumulo table to use as the target instead of HDFS
--accumulo-column-family <family>	#Sets the target column family for the import
--accumulo-create-table	If specified, create missing Accumulo tables
--accumulo-row-key <col>	Specifies which input column to use as the row key
--accumulo-visibility <vis>	(Optional) Specifies a visibility token to apply to all rows inserted into Accumulo. Default is the empty string.
--accumulo-batch-size <size>	(Optional) Sets the size in bytes of Accumulo’s write buffer. Default is 4MB.
--accumulo-max-latency <ms>	(Optional) Sets the max latency in milliseconds for the Accumulo batch writer. Default is 0.
--accumulo-zookeepers <host:port>	Comma-separated list of Zookeeper servers used by the Accumulo instance
--accumulo-instance <table-name>	Name of the target Accumulo instance
--accumulo-user <username>	Name of the Accumulo user to import as
--accumulo-password <password>	Password for the Accumulo user

#sqoop configs
  <property>
    <name>property.name</name>
    <value>property.value</value>
  </property>
  #eqivilant to
  sqoop import -D property.name=property.value ...
#all tables
sqoop import-all-tables (generic-args) (import-args)
 sqoop-import-all-tables (generic-args) (import-args)
 --exclude-tables <tables>	#Comma separated list of tables to exclude from import process