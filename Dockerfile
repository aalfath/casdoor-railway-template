# Casdoor for Railway: the official image, pinned by version and digest (multi-arch index).
# Bump both together, and add a CHANGELOG.md entry: a merge to main notifies every deployer.
FROM casbin/casdoor:4.30.0@sha256:97305c39e379c9417468be1df82582bb46bff9cbaf11b8d5f5e41dc601a5f63d

COPY start.sh /railway-start.sh
USER root
RUN chmod 755 /railway-start.sh
USER 1000

EXPOSE 8000
ENTRYPOINT ["/railway-start.sh"]
