FROM brewblox/simulator-compiler:10.3
HEALTHCHECK --interval=1m --timeout=2s CMD ps aux | grep --color=never [A]gent.Listener

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /azp

COPY ./start.sh .
COPY ./install.sh .

RUN chmod +x ./start.sh ./install.sh \
  && ./install.sh

ENTRYPOINT [ "./start.sh" ]
