FROM archlinux:latest

RUN groupadd --gid 1000 dev \
  && useradd --uid 1000 --gid dev --shell /bin/bash --create-home dev

RUN pacman -Sy

RUN pacman -Syu --noconfirm gcc nodejs curl wget git unzip make ripgrep fd neovim stow python3 python-pip
RUN pip install -U radian

RUN chown -R dev:dev /home/dev

COPY --chown=dev:dev ./bashrc /home/dev/.bashrc

USER dev

RUN mkdir -p /home/dev/gits/ClemensKohl/
RUN cd /home/dev/gits/ClemensKohl/
RUN git clone
RUN cd /home/dev/
