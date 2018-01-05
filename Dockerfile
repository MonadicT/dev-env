FROM archlinux/base

RUN pacman -Syu --noconfirm \
	binutils \
	chromium \
	core/openssh \
	emacs \
	extra/unzip \
	git \
	grep \
	iputils \
	net-tools \
	mlocate\
	sudo \
	vi \
	wget

RUN pacman --noconfirm -Syu \
	xorg \
	xorg-server \
	xorg-xinit \
	xorg-xlsfonts \
	xterm

RUN pacman -Syu --noconfirm \
	community/dmenu \
	i3 \
	tigervnc rxvt-unicode \
	ttf-dejavu \
	community/terminus-font

# Languages
RUN pacman --noconfirm -Syu \
	community/clojure \
	community/elixir \
	community/ghc \
	community/rust \
	extra/go extra/go-tools \
	extra/jdk8-openjdk \
	extra/python2 community/jupyter-notebook

# Node
RUN pacman --noconfirm -Syu nodejs yarn
RUN yarn global add create-react-native-app react-native-cli

# Gradle
ENV GRADLE_VERSION 4.4.1
RUN cd /opt && \
    wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip &&\
    unzip gradle*.zip &&\
    ls -d */ | sed 's/\/*$//g' | xargs -I{} mv {} gradle &&\
    rm gradle*.zip

# Android SDK
ENV ANDROID_SDK_VERSION 3859397
#RUN mkdir -p /opt/android-sdk && cd /opt/android-sdk && \
    #wget -q https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip && \
    #unzip *tools*linux*.zip && \
    #rm *tools*linux*.zip

WORKDIR /opt
#ADD https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz /opt
#RUN tar xf android-sdk*-linux.tgz && rm android*.tgz

# ADD https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip /opt
# RUN unzip android-ndk*.zip && rm android-ndk*.zip

#RUN (cd android-sdk-linux/tools && ./android update sdk --no-ui)

RUN git clone https://aur.archlinux.org/google-chrome.git && (cd google-chrome && makepkg&& makepkg -i)

ENV JAVA_HOME /usr/lib/jvm/java-8-open-jdk
EXPOSE 5901
RUN bash
