# init/default/20_parse_variables.sh
# Purpose of this script is to parse/check/verify some important variables
# such as YEAR, DAYSUPTIME

# Inspect the YEAR variable (if not set it should already have been predefined by the config files to current year)
test -z "$YEAR" && YEAR="$(date '+%Y')"   # if YEAR is empty use current YEAR

# Verify if variable YEAR is the same - next line only works on Linux not HP-UX
# checkYEAR="$(date '+%Y' -d $YEAR)"

IsDigit "$YEAR" || Error "Variable YEAR ($YEAR) is not a correct Year (e.g. $(date '+%Y'))"

if (( YEAR < 2014 )) ; then
    Error "Variable YEAR ($YEAR) should be higher then 2014 (e.g. $(date '+%Y'))"
fi

test -z "$DAYSUPTIME" && DAYSUPTIME=30  # if varaibale is empty use 30 days

# we should also check if variable DAYSUPTIME is an integer number
IsDigit "$DAYSUPTIME" || Error "Variable DAYSUPTIME ($DAYSUPTIME) is not an integer number" 
