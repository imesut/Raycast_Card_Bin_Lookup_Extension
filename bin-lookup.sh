#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Card Bin Lookup
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 💳
# @raycast.argument1 { "type": "text", "placeholder": "536202" }

# Documentation:
# @raycast.description Credit Card Bin Lookup powered by https://github.com/venelinkochev/bin-list-data
# @raycast.author Mesut Yılmaz
# @raycast.authorURL https://raycast.com/mesut_yilmaz

#echo $1

cat bin-list-data/bin-list-data.csv | grep $1 | awk -F, '
BEGIN {
    format = "%-15s: %-20s\n"
}
{
    if (NR > 1) {
        printf "%s\n", "----------------------------------------"
    }
    printf format, "BIN", $1
    printf format, "Brand", $2
    printf format, "Type", $3
    printf format, "Category", $4
    printf format, "Issuer", $5
    printf format, "IssuerPhone", $6
    printf format, "IssuerUrl", $7
    printf format, "isoCode2", $8
    printf format, "isoCode3", $9
    printf format, "CountryName", $10
}'