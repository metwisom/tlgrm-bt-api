FROM ubuntu

ENV TERM noninteractive

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
#RUN apt-get -y install apt-utils 
#RUN apt-get -y upgrade
#RUN dpkg-reconfigure

RUN apt-get -y install cmake
RUN apt-get -y install g++
RUN apt-get -y install gperf
RUN apt-get -y install ccache
RUN apt-get -y install zlib1g
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install libssl-dev
RUN apt-get -y install libreadline-dev
RUN apt-get -y install git

RUN cd /home

RUN cd /home && git clone --recursive https://github.com/tdlib/telegram-bot-api.git /home/telegram-bot-api
RUN cd /home/telegram-bot-api && mkdir build && cd build

RUN cd /home/telegram-bot-api/build && cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cd /home/telegram-bot-api/build && cmake --build . --target install

CMD telegram-bot-api --api-id=[------] --api-hash=[------]

