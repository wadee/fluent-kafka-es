FROM fluent/fluentd:v0.12-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev libffi-dev \
 && sudo gem install \
        ffi \
        fluent-plugin-elasticsearch \
        fluent-plugin-kafka \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem