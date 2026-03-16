# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

#FROM quay.io/shaunassam/trillium-seed:latest
FROM quay.io/centos/centos@sha256:73a317e5eef90ab92d51c226ae961098212c8b0dcf03e3c8f4b2f31a461a255a

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