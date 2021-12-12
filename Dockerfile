FROM debian as mssql-docker-tmpfs

    ADD nodirect_open.c /
    RUN apt update && apt install -y gcc && \
        gcc -shared -fpic -o /nodirect_open.so nodirect_open.c -ldl && \
        apt purge -y gcc

FROM mcr.microsoft.com/mssql/server:2019-latest
    USER root
    COPY --from=mssql-docker-tmpfs /nodirect_open.so /nodirect_open.so
    RUN echo "/nodirect_open.so" >> /etc/ld.so.preload
    ENV LD_PRELOAD=/nodirect_open.so