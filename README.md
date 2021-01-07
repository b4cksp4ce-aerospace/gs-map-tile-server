gs-map-tile-server
=========
This repository contains instructions about preparing maps and deploying 
a local tile rendering server suitable for offline usage with Mapbox GL.

## Preparing MBTiles
Preparing local MBTiles from Geofabrik data: [prepare-maps/README.md](prepare-maps/README.md)

## Serving tiles
[tileserver-gl](https://github.com/maptiler/tileserver-gl) is fully compatible with generated MBTiles file.

In case if your tiling server is tight in resources or you don't need raster tiles, take a look at
[tileserver-gl-light](https://www.npmjs.com/package/tileserver-gl-light) which performs well even on 
the 1st generation Raspberry Pi.
