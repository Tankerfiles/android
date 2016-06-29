FROM totran/oracle-jdk

ENV ANDROID_SDK_URL https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
ENV ANDROID_COMPONENTS platform-tools, build-tools-23.0.3, android-23, extra-android-m2repository, extra-google-m2repository

# Install base tools
RUN apt update && \
    apt install -y curl

# Install Android SDK & Settings
RUN curl -L "$ANDROID_SDK_URL" | tar --no-same-owner -xz -C /usr/local
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Install Extra Components
RUN echo y | android update sdk --no-ui --all --filter "$ANDROID_COMPONENTS"
 
