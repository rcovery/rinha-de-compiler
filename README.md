# Rinha

## HOW TO RUN

**Clone**

```
git clone git@github.com:rcovery/rinha-de-compiler.git
```

### With Docker

```
docker build -t rcovery_rinha .
docker run rcovery_rinha
```

### Without Docker

```
sudo pacman -Sy elixir
mix local.hex --force
mix deps.get
mix run lib/rinha <rinhafilename> # Sem as flechas
```

<img src="https://raw.githubusercontent.com/rcovery/rcovery/main/assets/badges/digitalhardcore.gif">
