FROM fluent/fluentd:v0.12-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish

#ENV KAFKA_PORT=9092 \
#    KAFKA_GROUP="web-app" \
#    KAFKA_TOPICS="web-app-log"

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-kafka \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem
# && sed -i 's/KAFKA_PORT/${KAFKA_PORT}/' fluent.conf \
# && sed -i 's/KAFKA_GROUP/${KAFKA_GROUP}/' fluent.conf \
# && sed -i 's/KAFKA_TOPICS/${KAFKA_TOPICS}/' fluent.conf \