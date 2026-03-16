# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

#FROM quay.io/shaunassam/trillium-seed:latest
FROM quay.io/centos-bootc/centos-bootc@sha256:b10c380afa6362d5015c5392f7c1c7dc4f23e4aec582dce1a6192ff244ee0479

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