FROM archlinux/base

RUN pacman -Syu --noconfirm binutils net-tools core/openssh

RUN pacman --noconfirm -Syu \
	emacs\
	git\
	mlocate\
	vi

RUN pacman --noconfirm -Syu grep sudo wget

RUN pacman --noconfirm -Syu chromium

RUN pacman --noconfirm -Syu \
	xorg \
	xorg-server \
	xorg-xinit \
	xorg-xlsfonts\
	xterm 

RUN pacman -Syu --noconfirm i3

RUN pacman -Syu --noconfirm tigervnc rxvt-unicode

RUN pacman --noconfirm -Syu ttf-dejavu community/terminus-font iputils

# Java
RUN pacman --noconfirm -Syu extra/jdk8-openjdk

# Clojure
RUN pacman --noconfirm -Syu community/clojure

# Go
RUN pacman --noconfirm -Syu extra/go extra/go-tools

# Haskell
RUN pacman --noconfirm -Syu community/ghc

# Python
RUN pacman --noconfirm -Syu extra/python2 community/jupyter-notebook

# Rust
RUN pacman --noconfirm -Syu community/rust

# Elixir
RUN pacman --noconfirm -Syu community/elixir

# Node
RUN pacman --noconfirm -Syu nodejs

EXPOSE 5901
RUN bash
