FROM odoo:17.0

USER root

# Instalar dependencias opcionales
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Crear carpeta de addons personalizados (opcional)
RUN mkdir -p /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons

# Exponer el puerto correcto
EXPOSE 8069

# Comando de arranque REAL de Odoo
ENTRYPOINT ["/usr/bin/odoo"]

CMD ["-c", "/etc/odoo/odoo.conf"]
