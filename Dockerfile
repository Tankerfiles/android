FROM totran/oracle-jdk

ENV ANDROID_SDK_URL https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
ENV ANDROID_COMPONENTS platform-tools, build-tools-23.0.3, android-23, extra-android-m2repository, extra-google-m2repository

# Install base tools & dependencies
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y curl libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends

# Clear Cache
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt

# Install Android SDK & Settings
RUN curl -L "$ANDROID_SDK_URL" | tar --no-same-owner -xz -C /usr/local
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Install Extra Components
RUN echo y | android update sdk --no-ui --all --filter "$ANDROID_COMPONENTS"
 
