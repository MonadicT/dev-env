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

EXPOSE 5901
RUN bash
