FROM odoo:17.0

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    netcat-openbsd \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN mkdir -p /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons

EXPOSE 8069

COPY --chmod=755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
