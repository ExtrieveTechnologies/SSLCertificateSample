::Replace the CANAME and SBJECT with your company name
set CANAME=TempCA
set SUBJECT="/C=IN/ST=DELHI/L=DELHI/O=Temp Company Technologies Pvt Ltd, Inc./OU=IT/CN=TempCA"

set scriptpath=%~dp0
set modulePath="%scriptpath%\OpenSSL-3.0.5_win32\"
set OPENSSL_CONF=%scriptpath%\OpenSSL-3.0.5_win32\openssl.cnf

set CERTPATH=%scriptpath%\NewCert
cd "%CERTPATH%"

%modulePath%openssl genrsa -out %CANAME%.key 2048

%modulePath%openssl req -x509 -new -nodes -key %CANAME%.key -sha256 -days 5000 -out %CANAME%.crt -subj %SUBJECT%