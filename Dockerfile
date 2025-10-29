FROM registry.gitlab.com/fdroid/fdroidserver:buildserver-bookworm
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV ANDROID_SDK=${ANDROID_HOME}
ENV ANDROID_NDK=/opt/android-ndk-r28c
RUN apt-get update && apt-get dist-upgrade && apt-get install --yes openjdk-17-jdk-headless build-essential ant cmake clang python-is-python3 wget swig zip vim
RUN sdkmanager "platform-tools" "build-tools;31.0.0"
WORKDIR /
RUN curl "https://dl.google.com/android/repository/android-ndk-r28c-linux.zip" --output android-ndk-r28c-linux.zip && unzip android-ndk-r28c-linux.zip -d /opt/ && rm android-ndk-r28c-linux.zip
COPY setup-volume.sh /usr/bin/setup-volume.sh
RUN chmod +x /usr/bin/setup-volume.sh
USER vagrant
