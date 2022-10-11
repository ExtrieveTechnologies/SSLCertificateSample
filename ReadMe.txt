All the batch file has to be edited with correct parameters. 

CreateCACertificate.bat
=======================

This file can be used to create a new CA Root certificate . Edit the batch file with correct parameters for Root name and subject before same is run.  
All the Client system including the server should install the CA root certificate as a one time processs.

GenIISCert.bat
=============
This will create new certificate which can be used for Interal LAN usage at Organization. Edit the batch file first with correct parameters. Once the certificate is created , pfx file can be imported in IIS , using Server certificate Option under the root system name.  
 

New certificate will be generated in NewCert folder. 

Installing of Extrieve CA certificate. 
======================================


Right click certificate and select install.  
	On Certifiate store . 
	Select - "Trusted Root Certification Authorities" by using browse option. 

Open manage computer certificate 
	open Trusted Root Certification Authorities/Certificates . 
	Extrieve certificate should be available in this list ,with validity until 2036. 

