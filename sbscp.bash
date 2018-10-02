#!/bin/sh

#Variables-COnfig
PROD_KEYSDIRNAME="prodkeys"
PROD_DESTDIR="tca-prod"
PROD_HOSTNAME="uksmso-tca-prod-kubemaster02.trilliant.local"


PREPROD_KEYSDIRNAME="preprodkeys"
PREPROD_DESTDIR="tca-preprod"
PREPROD_HOSTNAME="grs-preprodkubemaster02.trilliant.local"

NCDEV_KEYSDIRNAME="ncdevkeys"
NCDEV_DESTDIR="tca-ncdev"
NCDEV_HOSTNAME="nc-swe-dev-kubemaster02.trilliant.linux"

DEV_KEYSDIRNAME="devkeys"
DEV_DESTDIR="tca-e2e"
DEV_HOSTNAME="grs-testkubemaster02.trilliant.local"

QA_KEYSDIRNAME="qakeys"
QA_DESTDIR="tca-soak"
QA_HOSTNAME="grs-qakubemaster02.trilliant.local"

PROD_ENV="prod"
PREPROD_ENV="preprod"
NCDEV_ENV="ncdev"
DEV_ENV="e2e"
QA_ENV="soak"

#prefixs
PROD_PREFIX_ROOT="prod-R"
PROD_PREFIX_OPERATOR="prod-O"
PROD_PREFIX_ENT="prod-E"

PREPROD_PREFIX_ROOT="preprod-R"
PREPROD_PREFIX_OPERATOR="preprod-O"
PREPROD_PREFIX_ENT="preprod-E"

NCDEV_PREFIX_ROOT="ncdev-R"
NCDEV_PREFIX_OPERATOR="ncdev-O"
NCDEV_PREFIX_ENT="ncdev-E"

DEV_PREFIX_ROOT="dev-R"
DEV_PREFIX_OPERATOR="dev-O"
DEV_PREFIX_ENT="dev-E"

QA_PREFIX_ROOT="qa-R"
QA_PREFIX_OPERATOR="qa-O"
QA_PREFIX_ENT="qa-E"

################ 
#PROD
################
KEYS_DIR_NAME=$PROD_KEYSDIRNAME
DEST_DIR=$PROD_DESTDIR
DEST_ENV=$PROD_ENV
HOST=$PROD_HOSTNAME

# Delete the dir if it exists already
if [ -d $KEYS_DIR_NAME ]; then rm -Rf $KEYS_DIR_NAME; fi

#Make some dirs
mkdir -p $KEYS_DIR_NAME;
mkdir -p $KEYS_DIR_NAME/root;
mkdir -p $KEYS_DIR_NAME/enterprise;
mkdir -p $KEYS_DIR_NAME/operator;
cd $KEYS_DIR_NAME

echo "Scp'ing in progress for Prod..."
# scp the files from the server to local
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-root-$DEST_ENV-pv/store/* ./root;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-operator-$DEST_ENV-pv/store/* ./operator;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-enterprise-$DEST_ENV-pv/store/* ./enterprise;

##Rename the keystores for easy identification from the filename
mv ./root/generated/trusted-tls-keyStore.jks ./root/generated/$PROD_PREFIX_ROOT-trusted-tls-keyStore.jks
mv ./operator/generated/trusted-tls-keyStore.jks ./operator/generated/$PROD_PREFIX_OPERATOR-trusted-tls-keyStore.jks
mv ./enterprise/generated/trusted-tls-keyStore.jks ./enterprise/generated/$PROD_PREFIX_ENT-trusted-tls-keyStore.jks
cd ..
echo `pwd`
echo "Done!"


################ 
#PREPROD
################
KEYS_DIR_NAME=$PREPROD_KEYSDIRNAME
DEST_DIR=$PREPROD_DESTDIR
DEST_ENV=$PREPROD_ENV
HOST=$PREPROD_HOSTNAME

# Delete the dir if it exists already
if [ -d $KEYS_DIR_NAME ]; then rm -Rf $KEYS_DIR_NAME; fi

#Make some dirs
mkdir -p $KEYS_DIR_NAME;
mkdir -p $KEYS_DIR_NAME/root;
mkdir -p $KEYS_DIR_NAME/enterprise;
mkdir -p $KEYS_DIR_NAME/operator;
cd $KEYS_DIR_NAME

echo "Scp'ing in progress for Pre-Prod..."
# scp the files from the server to local
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-root-$DEST_ENV-pv/store/* ./root;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-operator-$DEST_ENV-pv/store/* ./operator;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-enterprise-$DEST_ENV-pv/store/* ./enterprise;

##Rename the keystores for easy identification from the filename
mv ./root/generated/trusted-tls-keyStore.jks ./root/generated/$PREPROD_PREFIX_ROOT-trusted-tls-keyStore.jks
mv ./operator/generated/trusted-tls-keyStore.jks ./operator/generated/$PREPROD_PREFIX_OPERATOR-trusted-tls-keyStore.jks
mv ./enterprise/generated/trusted-tls-keyStore.jks ./enterprise/generated/$PREPROD_PREFIX_ENT-trusted-tls-keyStore.jks
cd ..
echo `pwd`
echo "Done!"

################ 
#NCDEV
################
KEYS_DIR_NAME=$NCDEV_KEYSDIRNAME
DEST_DIR=$NCDEV_DESTDIR
DEST_ENV=$NCDEV_ENV
HOST=$NCDEV_HOSTNAME

# Delete the dir if it exists already
if [ -d $KEYS_DIR_NAME ]; then rm -Rf $KEYS_DIR_NAME; fi

#Make some dirs
mkdir -p $KEYS_DIR_NAME;
mkdir -p $KEYS_DIR_NAME/root;
mkdir -p $KEYS_DIR_NAME/enterprise;
mkdir -p $KEYS_DIR_NAME/operator;
cd $KEYS_DIR_NAME

echo "Scp'ing in progress for NCDEV..."
# scp the files from the server to local
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-root-$DEST_ENV-pv/store/* ./root;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-operator-$DEST_ENV-pv/store/* ./operator;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-enterprise-$DEST_ENV-pv/store/* ./enterprise;

##Rename the keystores for easy identification from the filename
mv ./root/generated/trusted-tls-keyStore.jks ./root/generated/$NCDEV_PREFIX_ROOT-trusted-tls-keyStore.jks
mv ./operator/generated/trusted-tls-keyStore.jks ./operator/generated/$NCDEV_PREFIX_OPERATOR-trusted-tls-keyStore.jks
mv ./enterprise/generated/trusted-tls-keyStore.jks ./enterprise/generated/$NCDEV_PREFIX_ENT-trusted-tls-keyStore.jks
cd ..
echo `pwd`
echo "Done!"

################ 
#DEV
################
KEYS_DIR_NAME=$DEV_KEYSDIRNAME
DEST_DIR=$DEV_DESTDIR
DEST_ENV=$DEV_ENV
HOST=$DEV_HOSTNAME

# Delete the dir if it exists already
if [ -d $KEYS_DIR_NAME ]; then rm -Rf $KEYS_DIR_NAME; fi

#Make some dirs
mkdir -p $KEYS_DIR_NAME;
mkdir -p $KEYS_DIR_NAME/root;
mkdir -p $KEYS_DIR_NAME/enterprise;
mkdir -p $KEYS_DIR_NAME/operator;
cd $KEYS_DIR_NAME

echo "Scp'ing in progress for Dev..."
# scp the files from the server to local
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-root-$DEST_ENV-pv/store/* ./root;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-operator-$DEST_ENV-pv/store/* ./operator;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-enterprise-$DEST_ENV-pv/store/* ./enterprise;

##Rename the keystores for easy identification from the filename
mv ./root/generated/trusted-tls-keyStore.jks ./root/generated/$DEV_PREFIX_ROOT-trusted-tls-keyStore.jks
mv ./operator/generated/trusted-tls-keyStore.jks ./operator/generated/$DEV_PREFIX_OPERATOR-trusted-tls-keyStore.jks
mv ./enterprise/generated/trusted-tls-keyStore.jks ./enterprise/generated/$DEV_PREFIX_ENT-trusted-tls-keyStore.jks
cd ..
echo `pwd`
echo "Done!"

################ 
#QA
################
KEYS_DIR_NAME=$QA_KEYSDIRNAME
DEST_DIR=$QA_DESTDIR
DEST_ENV=$QA_ENV
HOST=$QA_HOSTNAME

# Delete the dir if it exists already
if [ -d $KEYS_DIR_NAME ]; then rm -Rf $KEYS_DIR_NAME; fi

#Make some dirs
mkdir -p $KEYS_DIR_NAME;
mkdir -p $KEYS_DIR_NAME/root;
mkdir -p $KEYS_DIR_NAME/enterprise;
mkdir -p $KEYS_DIR_NAME/operator;
cd $KEYS_DIR_NAME

echo "Scp'ing in progress for QA..."
# scp the files from the server to local
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-root-$DEST_ENV-pv/store/* ./root;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-operator-$DEST_ENV-pv/store/* ./operator;
sshpass -p "2bevil" scp -rp sbtestuser@$HOST:/usr/local/kube-storage/$DEST_DIR/tca-ca-enterprise-$DEST_ENV-pv/store/* ./enterprise;

##Rename the keystores for easy identification from the filename
mv ./root/generated/trusted-tls-keyStore.jks ./root/generated/$QA_PREFIX_ROOT-trusted-tls-keyStore.jks
mv ./operator/generated/trusted-tls-keyStore.jks ./operator/generated/$QA_PREFIX_OPERATOR-trusted-tls-keyStore.jks
mv ./enterprise/generated/trusted-tls-keyStore.jks ./enterprise/generated/$QA_PREFIX_ENT-trusted-tls-keyStore.jks
cd ..
echo `pwd`
echo "Done!"