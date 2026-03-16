# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

#FROM quay.io/shaunassam/trillium-seed:latest
FROM quay.io/centos-bootc/centos-bootc@sha256:9cd0c887ea4b114cf6eb4f2debe0ce91a556c9d0fd320c1759cbd1635c07a0ff
#FROM quay.io/almalinuxorg/almalinux-bootc@sha256:33cdd2cd472e007b7e14c8d534dec6dd80ca95096921cd18a9405a1b45c9e9cb

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