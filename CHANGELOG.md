# Changelog

Deployers of the [Casdoor template](https://railway.com/deploy/casdoor-1) get an "update available" notice when this repo's `main` changes. Read the entry for your target version before you apply it.

## 4.29.0 (2026-11-16)

**Breaking changes:** none for existing data. Casdoor migrates its Postgres schema on start, so back up the database before applying an update across many versions.

- The template now builds from this repo instead of running the `casbin/casdoor` image directly, so future version bumps reach you as Railway update notices.
- Casdoor 4.9.0 → 4.29.0 (`casbin/casdoor:4.29.0@sha256:d8fd4f387026e1ffdf887b924c1c74ad5c15e8d3be54fb739b57b2037073a51f`). [Release notes](https://github.com/casdoor/casdoor/releases).
- The admin password is set with Casdoor's own `initAdminPassword` on first start (from `CASDOOR_ADMIN_PASSWORD`), replacing the old start command that logged in as `admin/123` and changed it. Existing deployments keep their current password.
- The start command moved into `start.sh` (Docker `ENTRYPOINT`); `PORT`, `runmode`, `driverName` and `origin` get defaults there.
