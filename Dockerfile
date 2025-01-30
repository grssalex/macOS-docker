FROM ubuntu:latest

# Mise à jour et installation des outils de développement
RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    clang \
    gdb \
    valgrind \
    cmake \
    make \
    vim \
    git \
    manpages \
    manpages-dev \
    wget \
    curl \
    unzip \
    python3 \
    python3-pip \
    net-tools \
    iputils-ping \
    libcriterion-dev \
    libcrypt-dev \
    libssl-dev \
    check \
    pkg-config \
    lcov \
    zsh \
    tree \
    gcovr \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Installation de Oh My Zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended

# Configuration du clavier en AZERTY (français)
RUN echo "KEYMAP=fr" > /etc/vconsole.conf

# Création d'un utilisateur root avec un mot de passe défini
RUN echo 'root:docker' | chpasswd

# Ajout d'un utilisateur "grssalex" avec accès sudo
RUN useradd -m -s /bin/zsh grssalex && echo 'grssalex:docker' | chpasswd && usermod -aG sudo grssalex

# Configuration du mot de passe root
RUN echo 'grssalex ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Définit le shell de démarrage
CMD ["/bin/zsh"]

# Nom de l'image
LABEL name="grssalex-macos-docker"
