FROM ubuntu

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#Set up git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean;

#Set up the git repo
RUN git clone https://github.com/ElizzyD/javamavenapp.git
RUN cd $(pwd)/javamavenapp
RUN git init
RUN git remote add origin https://github.com/ElizzyD/javamavenapp.git 
