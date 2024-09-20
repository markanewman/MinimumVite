# MinimumVite


01. Create a new repo in GitHub
02. Add a blank `README.md` using GitHub's web UI
03. Open VSCode
04. Clone the repo using _F1 > Git: Clone_
05. Add the files: `.devcontainer\devcontainer.json` and `Dockerfile`
06. Commit
07. Re-launch VSCode using _F1 > Dev Containers: Rebuild and Reopen in Container_
08. Open a terminal using _Ctrl + Shift + `_
09. Create a new React scaffold using `npm create vite@latest sample_app -- --template react-ts`
10. Commit
11. Install all the modules as below.
    It takes a while and will add the `sample_app/package-lock.json` file when complete.
    ```
    cd sample_app
    npm install
    ```
12. Update the `sample_app/package.json` file's `{"scripts: { "dev": "vite" }}` attribute to be "vite --host --port 80" to allow Vite to flow through Docker.
    A list of the CLI options are [here](https://vitejs.dev/guide/cli.html).
13. Validate the website can be launched manually from inside a _dev_ container by running the below, _then_ browsing to `http://localhost` on the local machine.
    ```
    npm run dev
    ```
14. Commit
15. Drop out of the container using _F1 > Dev Containers: Reopen Folder Locally_
16. Update the `Dockerfile` to include the sourcecode as below
    ```
    COPY ./sample_app ./sample_app
    WORKDIR /usr/src/sample_app
    RUN ["npm", "install"]
    ```
17. Update the `Dockerfile` to run the site as below
    ```
    EXPOSE 80
    CMD ["npm", "run", "dev"]
    ```
18. Add in the `.dockerignore` file
19. Open a terminal using _Ctrl + Shift + `_
20. Build and run the container manualy as below.
    Ignore the "No such image" error from `docker rmi`
    ```
    docker rmi minimumvite
    docker build -t minimumvite:latest --no-cache .
    docker run --rm -p 80:80 --name demo_minimumvite minimumvite
    ```
21. Validate the website can be launched manually from inside a _standard_ container by browsing to `http://localhost` on the local machine.
23. Re-launch VSCode using _F1 > Dev Containers: Rebuild and Reopen in Container_
24. Validate that the app still runs inside the dev container by running the below then browsing using the local machine
    ```
    npm run dev
    ```
22. Commit







Review later

* https://github.com/BretFisher/node-docker-good-defaults
