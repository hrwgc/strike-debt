<pre>
 /$$$$$$$            /$$ /$$ /$$                              /$$$$$           /$$       /$$ /$$                    
| $$__  $$          | $$| $$|__/                             |__  $$          | $$      |__/| $$
| $$  \ $$  /$$$$$$ | $$| $$ /$$ /$$$$$$$   /$$$$$$             | $$ /$$   /$$| $$$$$$$  /$$| $$  /$$$$$$   /$$$$$$ 
| $$$$$$$/ /$$__  $$| $$| $$| $$| $$__  $$ /$$__  $$            | $$| $$  | $$| $$__  $$| $$| $$ /$$__  $$ /$$__  $$
| $$__  $$| $$  \ $$| $$| $$| $$| $$  \ $$| $$  \ $$       /$$  | $$| $$  | $$| $$  \ $$| $$| $$| $$$$$$$$| $$$$$$$$
| $$  \ $$| $$  | $$| $$| $$| $$| $$  | $$| $$  | $$      | $$  | $$| $$  | $$| $$  | $$| $$| $$| $$_____/| $$_____/
| $$  | $$|  $$$$$$/| $$| $$| $$| $$  | $$|  $$$$$$$      |  $$$$$$/|  $$$$$$/| $$$$$$$/| $$| $$|  $$$$$$$|  $$$$$$$
|__/  |__/ \______/ |__/|__/|__/|__/  |__/ \____  $$       \______/  \______/ |_______/ |__/|__/ \_______/ \_______/
                                           /$$  \ $$
                                          |  $$$$$$/
                                           \______/
</pre>

[![](http://i.imgur.com/kKXN4YS.jpg)](http://hrwgc.github.com/strike-debt/)


===========

### Load hospitals table created from geocoded zip codes
	
```sh
$ psql -f data/hospitals.sql
```

### Convert SQLite of Debt Purchase records to PostgreSQL

```sh
$ export PG_GDAL="user=postgres host=localhost port=5432 dbname=postgis"
$ ogr2ogr \
  -f "PostgreSQL" \
  -t_srs EPGS:3785 \
  PG:"$PG_GDAL" \
  rolling-jubilee.sqlite \
  -sql "SELECT * FROM purchases"
```


### manually fix entries with missing geometry from zip codes.

```sql
update purchases set wkb_geometry = ST_GeomFromText('POINT(-86.15778 39.76833)',4326) where zip = 46212;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-84.63078  37.08424)',4326) where zip = 42502;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-85.8283 38.28701)',4326) where zip = 47151;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-86.0508  38.16396)',4326) where zip = 47160;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-85.48746 38.31062)',4326) where zip = 40056;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-85.79885 38.25146)',4326) where zip = 40251;
update purchases set wkb_geometry = ST_GeomFromText('POINT(-85.79885 38.25146)',4326) where zip = 40243;
```

### add hospital column to purchases, based on purchase number and zip (random assigned based on round of debt purchase). 


```sql
ALTER TABLE purchases ADD COLUMN hospital integer;
update purchases set hospital = 13135 where purchase_number = 1;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40213;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47163;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 46212;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47135;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40218;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 44123;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 42502;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40004;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40118;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40217;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 6513;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 6355;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 45324;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40056;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40215;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40208;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40047;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40243;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40299;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 37411;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40031;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47115;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 62223;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40229;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40210;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 29053;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 41008;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47119;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47454;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 40503;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 42104;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 72106;
update purchases set hospital = 40202 where purchase_number = 2 and zip = 47143;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40328;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40241;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47150;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47138;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40071;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40019;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47106;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40175;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 50232;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40033;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47118;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40206;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47147;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47170;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40204;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40220;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47122;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 37148;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40222;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 42206;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47164;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47161;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40258;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47111;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 48213;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 37220;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47229;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47167;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47145;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 75154;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47630;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 33187;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 42081;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 40207;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 47126;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 46385;
update purchases set hospital = 40207 where purchase_number = 2 and zip = 42754;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40013;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47129;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47165;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40508;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47130;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40108;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40228;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 43004;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40203;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40212;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47140;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40251;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40008;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47117;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47452;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40160;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47175;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40176;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47102;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47203;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40165;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 82336;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47142;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47124;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40245;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47160;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40109;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40214;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40202;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40057;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40272;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47172;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 33860;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 42420;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47112;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 56301;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 45040;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40205;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40014;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40242;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40219;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 42701;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47120;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40601;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47151;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40006;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40059;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47137;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40291;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47108;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47166;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 47469;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40211;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40146;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40223;
update purchases set hospital = 47150 where purchase_number = 2 and zip = 40216;
```
### Create table with both hospital + debtor lat/lon values to take into geoarcs.r

```sql
DROP TABLE zip_sums;
create table zip_sums AS 
SELECT
DISTINCT
max(purchases.ogc_fid) as ogc_fid,
max(purchases.ogc_fid) as Id,
max(zips.wkb_geometry) as wkb_geometry,
max(purchases.servic_date) as servic_date,
max(CAST(purchases.princ_due AS NUMERIC)) as princ_due,
max(purchases.city) as city,
max(purchases.state) as state,
max(CAST(purchases.zip as INT)) as zip,
max(CAST(purchases.hospital as INT)) as hospital,
max(ST_y(ST_Centroid(ST_Transform(zips.wkb_geometry,4326)))) as lat1,
max(ST_x(ST_Centroid(ST_Transform(zips.wkb_geometry,4326)))) as long1,
max(ST_y(ST_Centroid(ST_Transform(hospitals.wkb_geometry,4326)))) as lat2,
max(ST_x(ST_Centroid(ST_Transform(hospitals.wkb_geometry,4326)))) as long2,
max(purchases.purchase_number) as purchase_number
FROM 
purchases 
LEFT JOIN zips 
ON purchases.zip = zips.zip
LEFT JOIN hospitals
ON purchases.hospital = hospitals.zip
group by 
purchases.ogc_fid,
purchases.purchase_number;
```

### run geoarcs.r using purchase.csv as input and great-circles.shp as output. 

```sh
$ ogr2ogr \
  -f "CSV" \
  data/purchase.csv \
  PG:"$PG_GDAL" \
  -sql "SELECT * from zip_sums WHERE wkb_geometry is not null"
```
- use output csv (purchase.csv) in ```geoarcs.r```, which can be run through [R](http://www.r-project.org/)


### convert geoarcs.r output shapefile to postgis


```sh
$ ogr2ogr \
  -f "PostgreSQL" \
  -s_srs EPSG:4326 \
  -t_srs EPSG:3785 \
  PG:"$PG_GDAL" \
  great-circles.shp \
  -nln circles
```

### remove duplicate lines for a given zip code

```sql
DROP TABLE zip_tot_lines;
CREATE TABLE zip_tot_lines AS
	SELECT max(ogc_fid) as ogc_fid,
	max(wkb_geometry) as wkb_geometry,
    sum(princ_due) as zip_princ_due,
    purchase_n,
    zip
FROM circles
GROUP BY zip, purchase_n;
```

### create table of zip code polygons within TileMill

```sql
SELECT 
 max(ogc_fid) as ogc_fid,
 count(ogc_fid) as num_abolished,
 zip, max(wkb_geometry) as wkb_geometry,
 purchase_number, 
 regexp_replace(cast(purchase_number as text),'2','') as first_purchase,
 regexp_replace(CAST(purchase_number as text),'1','') as second_purchase,
 replace(to_char(cast (sum(princ_due) as INT), '999G999G990D00'),' ','') as amount_abolished,
 cast (sum(princ_due) as INT) as elev
FROM zip_sums 
GROUP by zip, purchase_number 
ORDER by ST_YMax(ST_Envelope(max(wkb_geometry))) DESC;
```

