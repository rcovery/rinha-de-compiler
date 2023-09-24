FROM elixir:slim

RUN apt update

WORKDIR /rinha

COPY . /rinha/

RUN mix deps.get
RUN mix run

CMD ["mix", "run", "lib/rinha.exs", "source"]