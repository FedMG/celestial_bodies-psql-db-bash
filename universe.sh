#!/bin/bash

PSQL="psql -X -U freecodecamp -d universe -t --no-align -c"
echo "$($PSQL "TRUNCATE TABLE galaxy, star, planet, moon, black_hole")"


# GALAXY
cat ./data/galaxies.csv | while IFS=',' read NAME TYPE	DIAMETER DISTANCE CONSTELLATION; do
  if [[ $NAME != 'name' ]]; then
    echo "$($PSQL "INSERT INTO galaxy(name,type,diameter,distance,constellation) VALUES('$NAME', '$TYPE', $DIAMETER, '$DISTANCE', '$CONSTELLATION')")"
  fi
done


# STAR
cat ./data/stars.csv | while IFS=',' read NAME AGE_YEARS TYPE SOLAR_RADIUS TEMPERATURE_K SOLAR_MASSES DISTANCE_LIGHT_YEARS COLOR GALAXY_NAME; do
  if [[ $NAME != 'name' ]]; then
    GALAXY_ID=$($PSQL "SELECT galaxy_id FROM galaxy WHERE name ILIKE '%$GALAXY_NAME%'")

    echo "$($PSQL "INSERT INTO star(name, galaxy_id ,age_years ,type ,solar_radius , distance_light_years , solar_masses , color , temperature_k)
     VALUES('$NAME', $GALAXY_ID, '$AGE_YEARS', '$TYPE', $SOLAR_RADIUS, '$DISTANCE_LIGHT_YEARS', $SOLAR_MASSES, '$COLOR', $TEMPERATURE_K)")"
  fi
done


# PLANET
cat ./data/planets.csv | while IFS=',' read NAME STAR_NAME TYPE EARTH_MASSES DISTANCE_AU EARTH_RADII SUITABLE_OF_LIFE DESCRIPTION; do
  if [[ $NAME != 'name' ]]; then
    STAR_ID=$($PSQL "SELECT star_id FROM star WHERE name ILIKE '%$STAR_NAME%'")
 
    echo "$($PSQL "INSERT INTO planet(name, star_id, type, earth_masses, distance_au, earth_radii, suitable_of_life, description) 
    VALUES('$NAME', $STAR_ID, '$TYPE', $EARTH_MASSES, $DISTANCE_AU, $EARTH_RADII, $SUITABLE_OF_LIFE, '$DESCRIPTION')")"
  fi
done


# MOON
cat ./data/moons.csv | while IFS=',' read NAME DIAMETER  DISTANCE_FROM_PLANET  PLANET_NAME  RADIUS_KM; do
  if [[ $NAME != 'name' ]]; then
    PLANET_ID=$($PSQL "SELECT planet_id FROM planet WHERE name ILIKE '%$PLANET_NAME%'")

    echo "$($PSQL "INSERT INTO moon(name, planet_id, diameter, distance_from_planet, radius_km) 
    VALUES('$NAME', $PLANET_ID, '$DIAMETER', '$DISTANCE_FROM_PLANET', $RADIUS_KM)")"
  fi
done


# BLACK HOLES
cat ./data/black_holes.csv | while IFS=',' read NAME TYPE SOLAR_MASSES DISTANCE_FROM_EARTH SUPER_MASSIVE CONSTELLATION GALAXY_NAME; do
  if [[ $NAME != 'name' ]]; then
    GALAXY_ID=$($PSQL "SELECT galaxy_id FROM galaxy WHERE name ILIKE '%$GALAXY_NAME%'")
    echo "$($PSQL "INSERT INTO black_hole(name, galaxy_id, type, solar_masses, distance_from_earth, super_massive, constellation) 
    VALUES('$NAME', $GALAXY_ID, '$TYPE', '$SOLAR_MASSES', '$DISTANCE_FROM_EARTH', $SUPER_MASSIVE, '$CONSTELLATION')")"
  fi
done
