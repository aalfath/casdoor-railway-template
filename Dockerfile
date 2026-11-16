# Casdoor for Railway: the official image, pinned by version and digest (multi-arch index).
# Bump both together, and add a CHANGELOG.md entry: a merge to main notifies every deployer.
FROM casbin/casdoor:4.29.0@sha256:d8fd4f387026e1ffdf887b924c1c74ad5c15e8d3be54fb739b57b2037073a51f

COPY start.sh /railway-start.sh
USER root
RUN chmod 755 /railway-start.sh
USER 1000

EXPOSE 8000
ENTRYPOINT ["/railway-start.sh"]
