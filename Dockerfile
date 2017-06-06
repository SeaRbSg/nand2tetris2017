FROM java:8
# ADD nand2tetris/tools nand2tetris/tools
# RUN chmod +x /nand2tetris/tools/*.sh
# RUN ln -s /nand2tetris/tools/*.sh /usr/local/bin
RUN apt-get -y update
# RUN apt-get -y install vim make
