# docker-jekyll-dotenv

Generate static GitHub Pages without exposing environment variables, API keys, etc.

## Docker? Jekyll is written in Ruby, right?

Docker allows us to configure ruby, Jekyll, and it's associated requirements once, then run or deploy the resulting container anywhere, in a platform agnostic fashion. We can then run this container locally for development, ultimately leveraging the container to build our static site and deploy it to GitHub.

## Edit Configuration

First, set your repository in `_config.yml` to match the repository of your GitHub Pages site.

## Request a GitHub Token

1. Next, visit <https://github.com/settings/tokens/new> in your browser and generate a token.
1. In Terminal, in the root project directory, run:
   ```bash
   cp .env.sample .env && sed -i .bak 's/GH_TOKEN_REPLACE/[PASTE TOKEN HERE!]/' .env
   ```
   Using `0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb` as an example: `sed -i .bak 's/GH_TOKEN_REPLACE/0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb/' .env`

## Starting the Container

Finally, in Terminal, run the following command in the project root to start Jekyll:

```bash
docker-compose up
```

Once the server starts, simply visit <http://localhost:4000> in your browser. Live reload is enabled in this container, so any changes made as you develop will instantly reflect in your browser.

## Building and Deploying Your Static Site to GitHub Pages

[ WATCH THIS SPACE ]

## Stopping the Container

In Terminal, run the following command in the project root to stop the Jekyll server:

```bash
docker-compose down
```
