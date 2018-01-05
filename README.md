# docker-jekyll-dotenv

Generate static GitHub Pages without exposing environment variables, API keys, etc.

## Docker? Jekyll is written in Ruby, right?

Docker allows us to configure ruby, Jekyll, and it's associated requirements once, then run or deploy the resulting container anywhere, in a platform agnostic fashion.
This provides an easily replicable environment, instantly capable of the following workflows out of the box:

1. Local development.
1. Building the static site.
1. Deploying it to GitHub Pages.

## Walkthrough: Your Own Secret GitHub Page Site

### 1. Install Prerequisites

* Install [Docker](https://docs.docker.com/engine/installation/) for your Operating System.
* (Windows, Linux) Install [Docker Compose](https://docs.docker.com/compose/install/)\
   **NOTE: Only Windows and Linux host systems require a separate installation!**

### 2. Establish Local Repository

1. On GitHub, fork this repo. Consider using the GitHub settings to rename it for your project!
1. Clone the fork to your local machine.
1. In Terminal, navigate to the repo directory on your local machine.

### 3. Configuration Step by Step

1. Generate a [new GitHub Token](https://github.com/settings/tokens/new).

1. Add your secrets to your `.env` file. If `.env` does not yet exist in your project directory, the below command will create it automatically. Lets add the required secret, `JEKYLL_GITHUB_TOKEN`:

   ```bash
   echo 'JEKYLL_GITHUB_TOKEN=[REPLACE_WITH_TOKEN]' >> .env
   ```

   Using `0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb` as an example:

   ```bash
   echo 'JEKYLL_GITHUB_TOKEN=0jcdahcl66mvmyahj68xngnug0db19y2xvdm1zlb' >> .env
   ```

1. Add additional secrets by running this line in your project directory:

   ```bash
   echo 'DEMO_VAR=super secret value' >> .env
   ```

1. Once you've finished entering secrets, edit `_config.yml`, and replace the repository name with your own. For example:

   ```yaml
   repository: droxey/droxey.github.io
   ```

1. Save `_config.yml` --- your project is now fully configured for development!

### 4. Develop Locally

* **Start the Container to Begin Development**:

  In Terminal, run the following command in the project root to start Jekyll:

  ```bash
  docker-compose up
  ```

  Once the server starts, simply visit <http://localhost:4000> in your browser. Live reload is enabled in this container, so any changes made as you develop will instantly reflect in your browser.

* **Stop the Container to Conclude Development**:

  In Terminal, run the following command in the project root to stop the Jekyll server:

  ```bash
  docker-compose down
  ```

### 5. Push Changes

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
