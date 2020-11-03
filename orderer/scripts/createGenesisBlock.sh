#!/bin/bash

. /tmp/env.sh

export FABRIC_CFG_PATH=$CLI_WORKING_DIR
configtxgen -profile $PROFILE_ORDERER_GENESIS_NAME -outputBlock genesis.block -channelID $SYS_CHANNEL_NAME
configtxgen -profile $PROFILE_CHANNEL_NAME -outputCreateChannelTx channel.tx -channelID $APP_CHANNEL_NAME

# copy to orderer's home
cp genesis.block $FABRIC_CA_CLIENT_HOME/${ORG_NAME}/${PEER_NAME}/genesis.block

cp channel.tx /tmp/channel.tx
chmod 757 /tmp/channel.tx