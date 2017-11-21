FROM trevorj/boilerplate:rolling

RUN lazy-apt \
    perl libgetopt-complete-perl libstorable-perl \
    libpq-dev \
    build-essential \
    automake \
    postgresql-client

ADD . .
RUN set -exv \
 && perl ./Makefile.PL \
 && make \
 && :

ENV \
    PGCLUU_STATS_DIR="/data/stats" \
    PGCLUU_REPORT_DIR="/data/reports" \
    \
    PGHOSTADDR=localhost \
    PGPORT=5432 \
    PGDATABASE=postgres \
    PGUSER=postgres \
    PGPASS=postgres

CMD oneshot

