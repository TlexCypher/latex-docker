# LaTeX docker
This project is for docker image to use LaTeX especially with Japanese, Neovim.
You can easily to get hotreload tex environment.

# How to start?
```
$ docker build -t latex-docker .
$ docker container run -p=5001:5000 --name=tex-nvim -itd latex-docker
$ docker container exec -it tex-nvim bash
```
After entering docker container, exec :Lazy and install texlab, LSP for LaTeX.
At first, you should run make only once.

```
$ make
```

And then, go to localhost:5001, you can get hotreload tex environment!
