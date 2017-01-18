#!/bin/sh

mkdir -p /etc/rexray

echo "libstorage:
  service: efs
  server:
    services:
      efs:
        driver: efs
        efs:
          tag:            rexray
          region:         $AWS_REGION
          accessKey:      $AWS_ACCESS_KEY_ID
          secretKey:      $AWS_SECRET_ACCESS_KEY
          securityGroups: $AWS_SECURITY_GROUP_ID" > /etc/rexray/config.yml

echo Rexray config to use:
cat /etc/rexray/config.yml

/usr/bin/rexray version
/usr/bin/rexray service start -f
