[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/casdoor-1?utm_medium=integration&utm_source=button&utm_campaign=casdoor)

# Casdoor on Railway

This repo builds the [Casdoor](https://casdoor.org) service of the Railway template [Casdoor](https://railway.com/deploy/casdoor-1): an open-source identity and access management server (OAuth 2.0, OIDC, SAML, CAS, LDAP) with a web UI.

- **Version:** Casdoor 4.29.0, official image `casbin/casdoor:4.29.0` pinned by digest in the [`Dockerfile`](Dockerfile).
- **Services:** `casdoor` (built from this repo, public domain on port 8000, health check `/api/health`) and Railway Postgres (with a volume). Casdoor keeps all its state in Postgres.
- **Wrapper:** [`start.sh`](start.sh) sets `httpport` from `PORT`, defaults `runmode=prod`, `driverName=postgres` and `origin=https://$RAILWAY_PUBLIC_DOMAIN`, and passes `CASDOOR_ADMIN_PASSWORD` to Casdoor's `initAdminPassword`, then runs `/server`.

## Variables

| Variable | Default in the template | Purpose |
| --- | --- | --- |
| `CASDOOR_ADMIN_PASSWORD` | generated secret | Password of `admin` (organization `built-in`), set on first start |
| `initAdminPassword` | `${{CASDOOR_ADMIN_PASSWORD}}` | Casdoor's own setting for the first admin password |
| `origin` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` | Public URL and OIDC issuer |
| `driverName`, `dataSourceName`, `dbName` | `postgres` and Postgres references | Database connection |
| `runmode` | `prod` | Casdoor run mode |
| `PORT` | `8000` | Port Casdoor listens on |
| `CASDOOR_PRIVATE_URL` | `http://${{RAILWAY_PRIVATE_DOMAIN}}:8000` | Internal URL for other services in the project |

After deploying, log in at `https://YOUR-DOMAIN` as `admin` with `CASDOOR_ADMIN_PASSWORD`. Changing the variable later doesn't change the password: change it in the Casdoor UI.

## Updates

When this repo's `main` changes (for example a new Casdoor version), Railway shows deployers an "update available" notice, and they choose when to apply it. Every change is listed in [`CHANGELOG.md`](CHANGELOG.md). Back up Postgres before applying an update.

This is a community-maintained deployment package and is not affiliated with or endorsed by the Casdoor project.
