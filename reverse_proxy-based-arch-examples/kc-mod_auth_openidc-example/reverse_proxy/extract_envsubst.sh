#!/bin/bash


(
echo -e '#EnvKey1\tPurpose2\tDefaultValue3\tReplaceValue4'; 
cat proxy.conf \
| sed -Ez 's|([ \t]*# PD([^\n]*?)\[([^\n]*)\])[\n]([ ]*([^ \n]*?)[ ]+([^\n]*?)[\n])|\nTggggT:\1\nTggggT:\4\n|g' \
| grep 'TggggT:' \
| sed 's|^TggggT:||g' \
| sed -Ez 's|([ \t]*# PD([^\n]*?)\[([^\n]*)\])[\n]([ ]*([^ \n]*?)[ ]+([^\n]*?)[\n])|\5\t\2\t\3\t\6\n|g' \
| cat

cat proxy.conf | \
sed -E 's|([ \t]*# PX ([^ ]*)=([^ ]*)[ ]+(.*?)\[([^\n]*)\]$)|\nTggggT:\1|g' \
| grep 'TggggT:' \
| sed 's|^TggggT:||g' \
| sed -E 's|([ \t]*# PX ([^ ]*)=([^ ]*)[ ]+(.*?)\[([^\n]*)\]$)|\2\t\4\t\5\t\3|g' \
| cat
) > parameters.tsv


# sed "s/OIDCCryptoPassphrase.password/${OIDCCookiePasswd}/" | \
(
cat parameters.tsv \
| awk -F'\t' '/^[^#]/{printf "sed \"s|%s|%s|g\" | \\\n", $4, ("${" $1 "}");}'  

echo 'cat '
) > custom-envsubst.sh

(
echo '#see https://docs.docker.com/compose/env-file/'; 
cat parameters.tsv \
| awk -F'\t' '/^[^#]/{printf "#Purpose: %s\n#ReplaceTag: %s\n%s=%s\n", $2, $4, $1, $3;}'  
) >  sample.env


(
echo '#see https://docs.docker.com/compose/env-file/'; 
cat parameters.tsv \
| awk -F'\t' '/^[^#]/{printf "#Purpose: %s\n#ReplaceTag: %s\n%s=%s%0.2d\n", $2, $4, $1, "tst", NR;}'  
) >  test/sample.env.test
