# https://gist.github.com/apmiller108/53d9ad3545ec2080e59f62ef0dfbbae3
GREEN='\x1B[32m'
RED='\x1B[31m'
NOCOL='\x1B[39m'
echo "${GREEN}Removing exited containers${NOCOL}"
# docker rm -v $(docker ps --filter status=dead --filter status=exited -aq)

echo "${GREEN}Removing dangling images${NOCOL}"
docker rmi $(docker images -f "dangling=true" -q)

echo "${GREEN}Removing dangling volumes${NOCOL}"
docker volume rm $(docker volume ls -qf dangling=true)

echo "${RED}'requires at least 1 argument(s)' just means there was nothing to clean${NOCOL}"
echo "${GREEN}All Done.${NOCOL}"
