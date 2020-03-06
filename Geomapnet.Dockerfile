FROM geomapnetbase:latest

RUN apt-get install -y zsh
RUN apt-get install -y curl
run curl -L git.io/antigen > /root/antigen.zsh

# Load the oh-my-zsh's library.
# run antigen use oh-my-zsh

# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found

# # Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# # Load the theme.
# antigen theme robbyrussell

# # Tell Antigen that you're done.
# run antigen apply

run apt-get install -y fzf

COPY ./zshrc /root/.zshrc
run zsh -c "source /root/.zshrc"

cmd zsh