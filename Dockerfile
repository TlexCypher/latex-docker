FROM --platform=linux/amd64 texlive/texlive:latest


RUN apt update && \
    apt-get update && \
    apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git tmux wget ripgrep tar cargo && \
    apt install sudo

RUN wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz

RUN tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim /usr/bin/nvim && \
    mv nvim-linux64/lib/nvim /usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ /usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

RUN git clone https://github.com/TlexCypher/ThePrimeagen.git ~/.config/nvim

RUN cd .. && rm -rf neovim

RUN cargo install --locked tree-sitter-cli

RUN export PATH="$HOME/.cargo/bin:$PATH"

# install nodejs for compiling tree-sitter for tex
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs

WORKDIR /home

CMD ["/bin/bash"]

