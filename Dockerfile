FROM ubuntu:14.04
MAINTAINER James Carscadden <james@carscadden.org>

# Prepare for software installs
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add more up to date Node sources
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
# Add more up to date Postgres sources
RUN echo "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/postgres.list
RUN curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# install the prerequisite patches here so that rvm will install under non-root account.
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    bison \
    g++ \
    gawk \
    gcc \
    git \
    libc6-dev \
    libffi-dev \
    libgdbm-dev \
    libgmp-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libyaml-dev \
    make \
    nodejs \
    patch \
    pkg-config \
    postgresql-server-dev-9.5 \
    sqlite3 \
    unzip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# INSTALL bower
RUN npm install bower -g
