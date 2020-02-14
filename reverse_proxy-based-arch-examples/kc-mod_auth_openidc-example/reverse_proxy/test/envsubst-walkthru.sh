#!/bin/sh

set -eu


(
set -o allexport
source ./sample.env.test

cat ../proxy.conf.autogen_envsubst | \
bash ../custom-envsubst.sh > .genresult.disposable

for seq in $(seq -w 1 99); do 
    findtag="tst$seq"
    if fgrep "$findtag" ./sample.env.test > /dev/null ; then 
        echo -n "finding $findtag:"; if fgrep "${findtag}" .genresult.disposable; then echo 'OK'; else echo 'NotFound'; exit 1; fi
    fi
done

echo 'env replace test success'
rm -f .genresult.disposable

)
