#!/bin/bash

inotifywait -m . -r -e MODIFY --format "%w %T %f" --exclude '^\..*.sw.$' --timefmt "%s" \
| while read dir time file; do 
  full="${dir}${file}"
  if [ -n "${file}" ] && [ "${ftime}" != "${full}:${time}" ] && [ ! -d ${full} ]; then
    ftime="${full}:${time}"	
    echo "${REMOTEDIR}/${full} : changed"
	scp ${full} ${SERVER}:${REMOTEDIR}/${full}
  fi
done
