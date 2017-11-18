FROM trevorj/boilerplate:rolling

RUN lazy-apt \
    perl libgetopt-complete-perl libstorable-perl \
    libpq-dev \
    build-essential \
    automake

ADD . .
RUN set -exv \
 && perl ./Makefile.PL \
 && make \
 && :

ENV \
    PGCLUU_STATS_DIR="/data/stats" \
    PGCLUU_REPORT_DIR="/data/reports" \
    \
    # TODO uri
    POSTGRES_HOST=localhost \
    POSTGRES_DB=postgres \
    POSTGRES_USER=postgres \
    POSTGRES_PASS=postgres

RUN mkdir -pv "$PGCLUU_STATS_DIR" "$PGCLUU_REPORT_DIR"

CMD oneshot

