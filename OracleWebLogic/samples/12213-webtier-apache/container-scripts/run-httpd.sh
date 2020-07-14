#!/bin/bash
#
# Since: May, 2018
# Author: dongbo.xiao@oracle.com
# Description: script to start Apache HTTP Server 
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
#
# Copyright (c) 2018 Oracle and/or its affiliates. All rights reserved.
#
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.

# Apache gets grumpy about PID files pre-existing
rm -f /run/httpd/httpd.pid

echo $SSL_CERT_FILE $SSL_CERT_KEY_FILE $VIRTUAL_HOST_NAME 

if [ ! -f /config/custom_mod_wl_apache.conf ]; then
  cp /configtmp/custom_mod_wl_apache.conf /config/
fi

# In order to enable SSL from USER to Apache HTTP Server, the `VIRTUAL_HOST_NAME`
# environment variable needs to be specified. If it is not set, SSL is not enabled.
if [ -z ${VIRTUAL_HOST_NAME} ]; then 
  echo VIRTUAL_HOST_NAME environment variable is not set, and therefore SSL is not enabled.
else 
  # Set up SSL
  use_example=false
  if [ -z ${SSL_CERT_FILE} ] && [ -z ${SSL_CERT_KEY_FILE} ]; then
    export SSL_CERT_FILE=/config/ssl/example.crt
    export SSL_CERT_KEY_FILE=/config/ssl/example.key
    use_example=true
  fi

  # We only copy this file when SSL is enabled
  cp /configtmp/custom_mod_ssl_apache.conf /etc/httpd/conf.d/

  if [ -z ${SSL_CERT_FILE} ] || [ -z ${SSL_CERT_KEY_FILE} ]; then
    echo Warning: both SSL_CERT_FILE and SSL_CERT_KEY_FILE need to be specified.
  elif [ ! -f ${SSL_CERT_FILE} ] || [ ! -f ${SSL_CERT_KEY_FILE} ]; then
    if [ ${use_example} = "true" ]; then
      echo Generating self-signed certificates on the first startup
      if [ ! -d "/config/ssl" ]; then
        mkdir -p -m 777 /config/ssl
      fi
      sh /u01/oracle/container-scripts/certgen.sh
    else 
      echo Warning: $SSL_CERT_FILE or/and $SSL_CERT_KEY_FILE is missing.
    fi
  else
    echo Found required SSL certificate and key
  fi
fi

exec httpd -DFOREGROUND
