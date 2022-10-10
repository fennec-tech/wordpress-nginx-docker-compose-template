#!/bin/sh
# Aliases to run wp and php composer commands in docker-compose environment
# author: Abderraouf Mehdi Bouhali (armbouhaliàgmail.com)

echo "
# alias for wp command to run from within docker container when docker-compose environment is available
alias wp='[[ \$(grep wordpress: docker-compose.*yml | wc -l) == 0 ]] \\
    && wp \\
    || docker rm -f wp-shell 2> /dev/null && docker-compose run --rm --name wp-shell wordpress sh -c wp } \\
'

# alias for php composer command to run from within docker container when docker-compose environment is available
alias composer='[[ \$(grep composer: docker-compose.*yml | wc -l) == 0 ]] \\
    && composer \\
    || docker rm -f composer 2> /dev/null && docker-compose run --rm --name composer composer sh -c composer \\
'
" >> ~/.bashrc

source ~/.bashrc

