

@echo off

:: set the correct Domain name for which certificate to be created.  
set DOMAIN=MyPC.com
:: set the CANAME 
set CANAME=TempCA
:: Subject  change the subject based on the company. Keep %DOMAIN% as it is . 
set SUBJECT="/C=IN/ST=DELHI/L=DELHI/O=Temp Company Technologies Pvt Ltd, Inc./OU=IT/CN=%DOMAIN%"
:: Change the PFXPASS , this will be password used while deploying in the Webserver/IIS. 
set PFXPASS=Abc123

set scriptpath=%~dp0
set modulePath="%scriptpath%\OpenSSL-3.0.5_win32\"

set OPENSSL_CONF=%scriptpath%\OpenSSL-3.0.5_win32\openssl.cnf


set CERTPATH=%scriptpath%\NewCert



cd "%CERTPATH%"

%modulePath%openssl genrsa -out %DOMAIN%.key 2048
%modulePath%openssl req -new -key %DOMAIN%.key -out %DOMAIN%.csr -subj %SUBJECT%


echo authorityKeyIdentifier=keyid,issuer > %DOMAIN%.ext
echo basicConstraints=CA:FALSE >> %DOMAIN%.ext
echo keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment >> %DOMAIN%.ext
echo subjectAltName = @alt_names >> %DOMAIN%.ext
echo [alt_names] >> %DOMAIN%.ext
echo DNS.1 = %DOMAIN% >> %DOMAIN%.ext


%modulePath%openssl x509 -req -in %DOMAIN%.csr -CA %CANAME%.crt -CAkey %CANAME%.key -CAcreateserial -out %DOMAIN%.crt -days 825 -sha256 -extfile %DOMAIN%.ext

%modulePath%openssl pkcs12 -export -out %DOMAIN%.pfx -inkey %DOMAIN%.key -in %DOMAIN%.crt -certfile %CANAME%.crt -passout pass:%PFXPASS%

