PATT=$1
echo Size of pattaren: ${PATT}
find . -name "${PATT}" -exec du -ch {} + | grep total$
