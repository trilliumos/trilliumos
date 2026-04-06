# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

FROM quay.io/centos-bootc/centos-bootc:stream10

### CentOS Stream Bootc Base Image - 2026-03-26 ###
#FROM quay.io/centos-bootc/centos-bootc@sha256:e699fae22c205fa81c37315bb18da6f09604775b31c22a9a24d4a049ba937bea

### WIP Custom Base Image ###
#FROM quay.io/shaunassam/trillium-seed:latest

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Add Homebrew
COPY --from=ghcr.io/ublue-os/brew:latest /system_files /
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /usr/bin/systemctl preset brew-setup.service && \
    /usr/bin/systemctl preset brew-update.timer && \
    /usr/bin/systemctl preset brew-upgrade.timer

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint