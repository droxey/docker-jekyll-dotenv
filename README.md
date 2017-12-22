# docker-jekyll-dotenv

Generate static GitHub Pages without exposing environment variables, API keys, etc.
[## Docker? Jekyll is written in Ruby, right?

Docker allows us to configure ruby, Jekyll, and it's associated requirements once, then run or deploy the resulting container anywhere, in a platform agnostic fashion.
This provides an easily replicable environment, instantly capable of the following workflows out of the box:

1. Local development.
1. Building the static site.
1. Deploying it to GitHub Pages.

## Setup

### 0. Prerequisites

1. Install Docker: <https://docs.docker.com/engine/installation/>
   **NOTE: Docker's macOS build includes support for docker-compose.**
1. (Windows, Linux) Install Docker Compose: <https://docs.docker.com/compose/install/>
   **NOTE: Only Windows and Linux host systems require a separate installation!**

### 1. Edit Configuration

First, set your repository in `_config.yml` to match the repository of your GitHub Pages site.

### 2. Request a GitHub Token

1. Next, visit <https://github.com/settings/tokens/new> in your browser and generate a token.
1. In Terminal, in the root project directory, run:
   ```bash
   cp .env.sample .env && sed -i .bak 's/GH_TOKEN_REPLACE/[PASTE TOKEN HERE!]/' .env
   ```
   Using `0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb` as an example: `sed -i .bak 's/GH_TOKEN_REPLACE/0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb/' .env`

### 3. Starting the Container

Finally, in Terminal, run the following command in the project root to start Jekyll:

```bash
docker-compose up
```

Once the server starts, simply visit <http://localhost:4000> in your browser. Live reload is enabled in this container, so any changes made as you develop will instantly reflect in your browser.

### 4. Stopping the Container

In Terminal, run the following command in the project root to stop the Jekyll server:

```bash
docker-compose down
```

### 5. Add, Commit, and Push Local Changes to GitHub!
