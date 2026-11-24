# Changelog

Deployers of the [Casdoor template](https://railway.com/deploy/casdoor-1) get an "update available" notice when this repo's `main` changes. Read the entry for your target version before you apply it.

## 4.30.0 (2026-11-24)

**Breaking changes:** none. No variable to add or change, and no manual migration: Casdoor updates its Postgres schema on start. Back up the Postgres volume before applying the update.

- Casdoor 4.29.0 → 4.30.0 (`casbin/casdoor:4.30.0@sha256:97305c39e379c9417468be1df82582bb46bff9cbaf11b8d5f5e41dc601a5f63d`). [Release notes](https://github.com/casdoor/casdoor/releases/tag/v4.30.0).
- New in Casdoor: sliding sessions, step-up MFA, a "Sessions" list in My Account, Gmail and Microsoft Graph email providers, client-secret rotation with a grace period, `<key>_FILE` variables for reading any setting from a file, and many fixes (including finishing a first start that stopped halfway).
- Licence note from upstream: the commercial and enterprise edition code moved into `ee/` folders under the Casdoor Enterprise License. The image still runs as the open-source (Apache 2.0) edition without a licence key, as before; the paid features stay off.
- **Apply:** accept Railway's "update available" notice for the `casdoor` service. **Go back:** redeploy the `casdoor` service from this repo's commit before this one (the 4.29.0 entry), after restoring a Postgres backup if 4.30.0 already ran its migrations.

## 4.29.0 (2026-11-16)

**Breaking changes:** none for existing data. Casdoor migrates its Postgres schema on start, so back up the database before applying an update across many versions.

- The template now builds from this repo instead of running the `casbin/casdoor` image directly, so future version bumps reach you as Railway update notices.
- Casdoor 4.9.0 → 4.29.0 (`casbin/casdoor:4.29.0@sha256:d8fd4f387026e1ffdf887b924c1c74ad5c15e8d3be54fb739b57b2037073a51f`). [Release notes](https://github.com/casdoor/casdoor/releases).
- The admin password is set with Casdoor's own `initAdminPassword` on first start (from `CASDOOR_ADMIN_PASSWORD`), replacing the old start command that logged in as `admin/123` and changed it. Existing deployments keep their current password.
- The start command moved into `start.sh` (Docker `ENTRYPOINT`); `PORT`, `runmode`, `driverName` and `origin` get defaults there.
