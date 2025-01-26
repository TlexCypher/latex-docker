# LaTeX docker
This project is for docker image to use LaTeX especially with Japanese, Neovim.
You can easily to get hotreload tex environment.

# How to start?
```
$ docker build -t latex-docker .
$ docker container run --name tex-nvim latex-docker
$ docker container exec -itd tex-nvim bash
```
After entering docker container, exec :Lazy and install texlab, LSP for LaTeX.
At first, you should run make only once.

```
$ make
```

And then, go to localhost:5001, you can get hotreload tex environment!
