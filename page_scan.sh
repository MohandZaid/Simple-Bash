#####################
#Made By: Mohand Zaid
#####################

#!/bin/bash

# Specify the URL of the web page to fetch
URL="$1"

TEMP_FILE=$(mktemp)

# Fetching the web file and save to temp file
curl -s "$URL" > "$TEMP_FILE"

# Filter HTML comments
HTML_FILTER=$(mktemp)
sed '/<!--/,/-->/d' "$TEMP_FILE" > "$HTML_FILTER"

# Filter JavaScript code
JS_FILTER=$(mktemp)
grep -Eo '<script[^>]*>[^<]*</script>' "$TEMP_FILE" |\
sed 's/<script[^>]*>//;s/<\/script>//g' > "$JS_FILTER"

# Print the filtered Html code
if [ -s "$HTML_FILTER" ]; then

    cat "$HTML_FILTER"
else
    echo "-no comments-"
fi
# Print the filtered JavaScript code

if [ -s "$JS_FILTER" ]; then

    cat "$JS_FILTER"
else
    echo "-no js code-"
fi

rm "$TEMP_FILE" "$HTML_FILTER" "$JS_FILTER"
