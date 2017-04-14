# Import contour shape files into PostGis
[![Docker Automated build](https://img.shields.io/docker/automated/dolomate/import-contour.svg)](https://hub.docker.com/r/dolomate/import-contour/) [![](https://images.microbadger.com/badges/image/dolomate/import-contour.svg)](https://microbadger.com/images/dolomate/import-contour "Get your own image badge on microbadger.com")

This Docker image will import a contour shape file into PostGis.

## Usage

### Create the container locally (optional)

`make build`

### Download Contour file

...

### Import

The **import-contour** Docker container...

## Usage

First, put contour shapefiles into *data/contour/* folder. Shapefiles must be archived to ZIP files like this:

```
data/contour/contour_N48_E8.zip
               |- contour_N48_E8
                  |- contour_N48_E8.dbf 
                  |- contour_N48_E8.prj 
                  |- contour_N48_E8.shp 
                  |- contour_N48_E8.shx 
```

Name of folder and files and ZIP archive must be same. 

To import these files run

```
docker-compose run import-contour
```

`import-contour` should be used before `import-sql`.

Note that `import-contour` must be called even if you are not using contour files. When there is no ZIP files in `import/contour` folder, the script creates empty tables in order to avoid errors when exporting tiles. 
