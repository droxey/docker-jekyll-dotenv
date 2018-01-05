# docker-jekyll-dotenv

Generate static GitHub Pages without exposing environment variables, API keys, etc.

## Docker? Jekyll is written in Ruby, right?

Docker allows us to configure ruby, Jekyll, and it's associated requirements once, then run or deploy the resulting container anywhere, in a platform agnostic fashion.
This provides an easily replicable environment, instantly capable of the following workflows out of the box:

1. Local development.
1. Building the static site.
1. Deploying it to GitHub Pages.

## Installation

### 1. Base Prerequisites

1. Install Docker: <https://docs.docker.com/engine/installation/>

1. **OPTIONAL: New Repos** - Create a Repository for your GitHub Page:

   1. Navigate to <https://github.com/new> in your browser.
   1. Clone the new repository to your local machine.

1. Navigate to your repository's settings to enable GitHub Pages. This will create an additional branch named `gh-pages` in your repository.

1. Generate a [new GitHub Token](https://github.com/settings/tokens/new).

1. Checkout the `gh-pages` branch locally:

   ```bash
   git fetch origin
   git checkout gh-pages
   ```

1. Add your secrets to your `.env` file. If `.env` does not yet exist in your project directory, the below command will create it automatically. Lets add the required secret, `JEKYLL_GITHUB_TOKEN`:

   ```bash
   echo 'JEKYLL_GITHUB_TOKEN=[REPLACE_WITH_TOKEN]' >> .env
   ```

   Using `0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb` as an example:

   ```bash
   echo 'JEKYLL_GITHUB_TOKEN=0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb' >> .env
   ```

1. **OPTIONAL:** Add additional secrets by running this line in your project directory:

   ```bash
   echo 'DEMO_VAR=super secret value' >> .env
   ```

1. **OPTIONAL** Copy the contents of the `.gitignore` file [in this repository](https://raw.githubusercontent.com/outputs-io/docker-jekyll-dotenv/master/.gitignore) to your new repository.

### 2. Quickstart (Common)

Simply run:

```bash
docker run --rm outputsio/docker-jekyll-dotenv
```

### 3. Connect Repository

**IMPORTANT**: _These steps must only be executed once per repository._

1. On your machine, edit `_config.yml`, replacing the repository name with your own. For example:

   ```yaml
   repository: droxey/droxey.github.io
   ```

1. Save `_config.yml` --- your project is now officially configured!

### 4. Push Changes

1. Add all changes to git:

   ```bash
   git add .
   ```

1. Commit them and supply a handy message:

   ```bash
   git commit -m 'Latest updates to my portfolio. Added navbar.'
   ```

1. Push Local Changes to`gh-pages`:

   ```bash
   git push origin gh-pages
   ```

1. Anytime you've made changes, repeat these steps.

---

#### Manual Installation

**IMPORTANT**: _Manual installation only required when customizing/extending, performing bugfixes, testing PRs, etc to this base repo._

1. (**OPTIONAL**) Install Additional Prerequisites:

   * (Windows, Linux) Install Docker Compose: <https://docs.docker.com/compose/install/>
     **NOTE: Only Windows and Linux host systems require a separate installation!**

1. Start the Container:
   In Terminal, run the following command in the project root to start Jekyll:

   ```bash
   docker-compose up
   ```

   Once the server starts, simply visit <http://localhost:4000> in your browser. Live reload is enabled in this container, so any changes made as you develop will instantly reflect in your browser.

1. Stop the Container:
   In Terminal, run the following command in the project root to stop the Jekyll server:

   ```bash
   docker-compose down
   ```

1. Complete the `Connect Your New Repository` and `Pushing Changes to GitHub Pages` steps listed above to complete the installation.
