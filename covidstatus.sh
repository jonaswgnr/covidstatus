#!/bin/bash
DATA_GERMANY=`curl -qs https://api.corona-zahlen.org/germany`
DATA_NRW=`curl -qs https://api.corona-zahlen.org/states/NW `

GERMAN_DAILY_CASES_DELTA=`echo $DATA_GERMANY | jq '.delta | {cases} | .[]'`
GERMAN_DAILY_DEATHS_DELTA=`echo $DATA_GERMANY | jq '.delta | {deaths} | .[]'`
GERMAN_DAILY_RECOVERED_DELTA=`echo $DATA_GERMANY | jq '.delta | {recovered} | .[]'`
GERMAN_R_VALUE=`echo $DATA_GERMANY | jq '.r | {value} | .[]'`
GERMAN_WEEK_INCIDENCE=`echo $DATA_GERMANY | jq '. | {weekIncidence} | .[]'`

NRW_DAILY_CASES_DELTA=`echo $DATA_NRW | jq '.data.NW.delta | {cases} | .[]'`
NRW_DAILY_DEATHS_DELTA=`echo $DATA_NRW | jq '.data.NW.delta | {deaths} | .[]'`
NRW_DAILY_RECOVERED_DELTA=`echo $DATA_NRW | jq '.data.NW.delta | {recovered} | .[]'`
NRW_WEEK_INCIDENCE=`echo $DATA_NRW | jq '.data.NW.weekIncidence'`

echo "######### COVID STATUS IN NRW GERMANY #########"
echo "GERMANY - NEW CASES:        $GERMAN_DAILY_CASES_DELTA"
echo "GERMANY - NEW DEATHS:       $GERMAN_DAILY_DEATHS_DELTA"
echo "GERMANY - NEW RECOVERED:    $GERMAN_DAILY_RECOVERED_DELTA"
echo "GERMANY - R_VALUE:          $GERMAN_R_VALUE"
echo "GERMANY - 7-DAY-INCIDENCE:  $GERMAN_WEEK_INCIDENCE"
echo "NRW     - NEW CASES:        $NRW_DAILY_CASES_DELTA"
echo "NRW     - NEW DEATHS:       $NRW_DAILY_DEATHS_DELTA"
echo "NRW     - NEW RECOVERED:    $NRW_DAILY_RECOVERED_DELTA"
echo "NRW     - 7-DAY-INCIDENCE:  $NRW_WEEK_INCIDENCE"
