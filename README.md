# hello-world-express

Servidor Express com um endpoint `GET /` que retorna `Hello World!`.

## Rodando localmente

```bash
npm install
npm start
# http://localhost:3000
```

## Rodando com Docker

```bash
docker build -t hello-world-express .
docker run -p 3000:3000 hello-world-express
```

Ou com Docker Compose:

```bash
docker compose up --build
```

## GitHub Actions

O workflow em `.github/workflows/ci.yml` roda a cada push e pull request na branch `main`:

1. **test**: instala as dependências, sobe o servidor e confere se `GET /` responde `Hello World!`.
2. **docker**: constrói a imagem, roda o container e faz o mesmo teste.
3. **publish**: só em push na `main`, publica a imagem no GitHub Container Registry
   (`ghcr.io/<usuario>/<repositorio>:latest`) usando o `GITHUB_TOKEN`, sem precisar configurar secrets.

Para baixar a imagem publicada:

```bash
docker pull ghcr.io/<usuario>/<repositorio>:latest
```
