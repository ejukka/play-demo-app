FROM openjdk:8-jdk-alpine as builder

ENV SBT_DOWNLOAD https://piccolo.link/sbt-1.1.4.tgz

RUN ["apk", "add", "--no-cache", "bash"]
RUN ["apk", "add", "--no-cache", "--virtual=build-dependencies", "wget", "ca-certificates"]

RUN wget -q --no-cookies ${SBT_DOWNLOAD} -O sbt.tgz
RUN tar xzf sbt.tgz -C /usr/local --strip-components=1
RUN rm sbt.tgz

WORKDIR /app
COPY . .

CMD sbt update
CMD sbt compile