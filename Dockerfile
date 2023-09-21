FROM ubuntu:latest
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin"

# Install minimal LaTeX packages and necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    latexmk \
    lmodern \
    fontconfig \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install git and the OpenSSH client
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install texlive-fonts-extra -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY resources/altacv.cls /usr/share/texlive/texmf-dist/tex/latex/
RUN mktexlsr

RUN adduser --uid 1000 latex

# Set the working directory
WORKDIR /cv

# Start with an empty command
CMD []
