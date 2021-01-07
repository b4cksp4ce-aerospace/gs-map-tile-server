#!/bin/bash

# Allow execution only with superuser priviledges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Configuring tmpfs storage
mkdir /srv/store
mount -t tmpfs tmpfs /srv/store/
cd /srv/store

# Install neccessary dependencies
apt update
apt install -y --no-install-recommends git build-essential \
  liblua5.1-0 liblua5.1-0-dev libprotobuf-dev libsqlite3-dev \
  protobuf-compiler shapelib libshp-dev libboost-program-options-dev \
  libboost-filesystem-dev libboost-system-dev

# Build tilemaker
git clone https://github.com/systemed/tilemaker
cd tilemaker
make -j$(nproc)
make install

# Download and convert PBF map
mkdir /srv/store/maps
wget -O /srv/store/maps/source.pbf $1
tilemaker \
  --input /srv/store/maps/source.pbf \
  --output /srv/store/maps/result.mbtiles \
  --config /srv/store/tilemaker/resources/config-openmaptiles.json \
  --process /srv/store/tilemaker/resources/process-openmaptiles.lua
