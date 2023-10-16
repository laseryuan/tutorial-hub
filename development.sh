
dev() {
docker run \
    --privileged `#make it work first, then security` \
    -it --rm \
    --user=$(id -u):$(id -g) \
    -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
    --name=jest-puppeteer \
    -v $(get_host_pwd)/end-to-end-test-tutorial:/app \
    --network=ride_network \
    jest-puppeteer bash
}

chrome() {
google-chrome --headless --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0 --no-sandbox
}

dev_root() {
docker exec -it -u root jest-puppeteer bash
}

build() {
docker build \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -u) \
    -t jest-puppeteer .
}
