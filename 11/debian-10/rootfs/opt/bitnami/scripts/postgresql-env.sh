#!/bin/bash
#
# Environment configuration for postgresql

# The values for all environment variables will be set in the below order of precedence
# 1. Custom environment variables defined below after Bitnami defaults
# 2. Constants defined in this file (environment variables with no default), i.e. BITNAMI_ROOT_DIR
# 3. Environment variables overridden via external files using *_FILE variables (see below)
# 4. Environment variables set externally (i.e. current Bash context/Dockerfile/userdata)

# Load logging library
. /opt/bitnami/scripts/liblog.sh

export BITNAMI_ROOT_DIR="/opt/bitnami"
export BITNAMI_VOLUME_DIR="/bitnami"

# Logging configuration
export MODULE="${MODULE:-postgresql}"
export BITNAMI_DEBUG="${BITNAMI_DEBUG:-false}"

# By setting an environment variable matching *_FILE to a file path, the prefixed environment
# variable will be overridden with the value specified in that file
postgresql_env_vars=(
    POSTGRESQL_VOLUME_DIR
    POSTGRESQL_DATA_DIR
    POSTGRESQL_INIT_MAX_TIMEOUT
    POSTGRESQL_PGCTLTIMEOUT
    POSTGRESQL_SHUTDOWN_MODE
    POSTGRESQL_CLUSTER_APP_NAME
    POSTGRESQL_DATABASE
    POSTGRESQL_INITDB_ARGS
    ALLOW_EMPTY_PASSWORD
    POSTGRESQL_INITDB_WAL_DIR
    POSTGRESQL_MASTER_HOST
    POSTGRESQL_MASTER_PORT_NUMBER
    POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS
    POSTGRESQL_PORT_NUMBER
    POSTGRESQL_ALLOW_REMOTE_CONNECTIONS
    POSTGRESQL_REPLICATION_MODE
    POSTGRESQL_REPLICATION_USER
    POSTGRESQL_SYNCHRONOUS_COMMIT_MODE
    POSTGRESQL_FSYNC
    POSTGRESQL_USERNAME
    POSTGRESQL_ENABLE_LDAP
    POSTGRESQL_LDAP_URL
    POSTGRESQL_LDAP_PREFIX
    POSTGRESQL_LDAP_SUFFIX
    POSTGRESQL_LDAP_SERVER
    POSTGRESQL_LDAP_PORT
    POSTGRESQL_LDAP_SCHEME
    POSTGRESQL_LDAP_TLS
    POSTGRESQL_LDAP_BASE_DN
    POSTGRESQL_LDAP_BIND_DN
    POSTGRESQL_LDAP_BIND_PASSWORD
    POSTGRESQL_LDAP_SEARCH_ATTR
    POSTGRESQL_LDAP_SEARCH_FILTER
    POSTGRESQL_INITSCRIPTS_USERNAME
    POSTGRESQL_PASSWORD
    POSTGRESQL_POSTGRES_PASSWORD
    POSTGRESQL_REPLICATION_PASSWORD
    POSTGRESQL_INITSCRIPTS_PASSWORD
    POSTGRESQL_ENABLE_TLS
    POSTGRESQL_TLS_CERT_FILE
    POSTGRESQL_TLS_KEY_FILE
    POSTGRESQL_TLS_CA_FILE
    POSTGRESQL_TLS_CRL_FILE
    POSTGRESQL_TLS_PREFER_SERVER_CIPHERS
    POSTGRESQL_SHARED_PRELOAD_LIBRARIES
    POSTGRESQL_PGAUDIT_LOG
    POSTGRESQL_PGAUDIT_LOG_CATALOG
    POSTGRESQL_LOG_CONNECTIONS
    POSTGRESQL_LOG_DISCONNECTIONS
    POSTGRESQL_LOG_HOSTNAME
    POSTGRESQL_CLIENT_MIN_MESSAGES
    POSTGRESQL_LOG_LINE_PREFIX
    POSTGRESQL_LOG_TIMEZONE
    POSTGRESQL_TIMEZONE
    POSTGRESQL_MAX_CONNECTIONS
    POSTGRESQL_TCP_KEEPALIVES_IDLE
    POSTGRESQL_TCP_KEEPALIVES_INTERVAL
    POSTGRESQL_TCP_KEEPALIVES_COUNT
    POSTGRESQL_STATEMENT_TIMEOUT
    POSTGRESQL_PGHBA_REMOVE_FILTERS
    POSTGRESQL_USERNAME_CONNECTION_LIMIT
    POSTGRESQL_POSTGRES_CONNECTION_LIMIT
    POSTGRESQL_WAL_LEVEL
    POSTGRESQL_AUTOCTL_CONF_DIR
    POSTGRESQL_AUTOCTL_MODE
    POSTGRESQL_AUTOCTL_MONITOR_HOST
    POSTGRESQL_AUTOCTL_HOSTNAME
    REPMGR_DATA_DIR
    REPMGR_NODE_ID
    REPMGR_NODE_ID_START_SEED
    REPMGR_NODE_NAME
    REPMGR_NODE_NETWORK_NAME
    REPMGR_NODE_PRIORITY
    REPMGR_NODE_LOCATION
    REPMGR_PORT_NUMBER
    REPMGR_LOG_LEVEL
    REPMGR_START_OPTIONS
    REPMGR_CONNECT_TIMEOUT
    REPMGR_RECONNECT_ATTEMPTS
    REPMGR_RECONNECT_INTERVAL
    REPMGR_PARTNER_NODES
    REPMGR_PRIMARY_HOST
    REPMGR_PRIMARY_PORT
    REPMGR_USE_REPLICATION_SLOTS
    REPMGR_MASTER_RESPONSE_TIMEOUT
    REPMGR_DEGRADED_MONITORING_TIMEOUT
    REPMGR_UPGRADE_EXTENSION
    REPMGR_SWITCH_ROLE
    REPMGR_USERNAME
    REPMGR_DATABASE
    REPMGR_PGHBA_TRUST_ALL
    REPMGR_PASSWORD
    REPMGR_USE_PASSFILE
    REPMGR_PASSFILE_PATH
    PGCONNECT_TIMEOUT
    POSTGRESQL_REPLICATION_PASSFILE_PATH
    POSTGRES_DATA_DIR
    PGDATA
    POSTGRES_SHUTDOWN_MODE
    POSTGRES_CLUSTER_APP_NAME
    POSTGRES_DATABASE
    POSTGRES_DB
    POSTGRES_INITDB_ARGS
    POSTGRES_INITDB_WAL_DIR
    POSTGRES_MASTER_HOST
    POSTGRES_MASTER_PORT_NUMBER
    POSTGRES_NUM_SYNCHRONOUS_REPLICAS
    POSTGRES_PORT_NUMBER
    POSTGRES_ALLOW_REMOTE_CONNECTIONS
    POSTGRES_REPLICATION_MODE
    POSTGRES_REPLICATION_USER
    POSTGRES_SYNCHRONOUS_COMMIT_MODE
    POSTGRES_FSYNC
    POSTGRES_USERNAME
    POSTGRES_USER
    POSTGRESQL_USER
    POSTGRES_ENABLE_LDAP
    POSTGRES_LDAP_URL
    POSTGRES_LDAP_PREFIX
    POSTGRES_LDAP_SUFFIX
    POSTGRES_LDAP_SERVER
    POSTGRES_LDAP_PORT
    POSTGRES_LDAP_SCHEME
    POSTGRES_LDAP_TLS
    POSTGRES_LDAP_BASE_DN
    POSTGRES_LDAP_BIND_DN
    POSTGRES_LDAP_BIND_PASSWORD
    POSTGRES_LDAP_SEARCH_ATTR
    POSTGRES_LDAP_SEARCH_FILTER
    POSTGRES_INITSCRIPTS_USERNAME
    POSTGRES_PASSWORD
    POSTGRES_POSTGRES_PASSWORD
    POSTGRES_REPLICATION_PASSWORD
    POSTGRES_INITSCRIPTS_PASSWORD
    POSTGRES_ENABLE_TLS
    POSTGRES_TLS_CERT_FILE
    POSTGRES_TLS_KEY_FILE
    POSTGRES_TLS_CA_FILE
    POSTGRES_TLS_CRL_FILE
    POSTGRES_TLS_PREFER_SERVER_CIPHERS
    POSTGRES_SHARED_PRELOAD_LIBRARIES
    POSTGRES_PGAUDIT_LOG
    POSTGRES_PGAUDIT_LOG_CATALOG
    POSTGRES_LOG_CONNECTIONS
    POSTGRES_LOG_DISCONNECTIONS
    POSTGRES_LOG_HOSTNAME
    POSTGRES_CLIENT_MIN_MESSAGES
    POSTGRES_LOG_LINE_PREFIX
    POSTGRES_LOG_TIMEZONE
    POSTGRES_TIMEZONE
    POSTGRES_MAX_CONNECTIONS
    POSTGRES_TCP_KEEPALIVES_IDLE
    POSTGRES_TCP_KEEPALIVES_INTERVAL
    POSTGRES_TCP_KEEPALIVES_COUNT
    POSTGRES_STATEMENT_TIMEOUT
    POSTGRES_PGHBA_REMOVE_FILTERS
    POSTGRES_USER_CONNECTION_LIMIT
    POSTGRES_POSTGRES_CONNECTION_LIMIT
)
for env_var in "${postgresql_env_vars[@]}"; do
    file_env_var="${env_var}_FILE"
    if [[ -n "${!file_env_var:-}" ]]; then
        if [[ -r "${!file_env_var:-}" ]]; then
            export "${env_var}=$(< "${!file_env_var}")"
            unset "${file_env_var}"
        else
            warn "Skipping export of '${env_var}'. '${!file_env_var:-}' is not readable."
        fi
    fi
done
unset postgresql_env_vars

# Paths
export POSTGRESQL_VOLUME_DIR="${POSTGRESQL_VOLUME_DIR:-/bitnami/postgresql}"
export POSTGRESQL_BASE_DIR="/opt/bitnami/postgresql"
POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-"${POSTGRES_DATA_DIR:-}"}"
POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-"${PGDATA:-}"}"
export POSTGRESQL_DATA_DIR="${POSTGRESQL_DATA_DIR:-${POSTGRESQL_VOLUME_DIR}/data}"
export POSTGRESQL_CONF_DIR="$POSTGRESQL_BASE_DIR/conf"
export POSTGRESQL_MOUNTED_CONF_DIR="$POSTGRESQL_VOLUME_DIR/conf"
export POSTGRESQL_CONF_FILE="$POSTGRESQL_CONF_DIR/postgresql.conf"
export POSTGRESQL_PGHBA_FILE="$POSTGRESQL_CONF_DIR/pg_hba.conf"
export POSTGRESQL_RECOVERY_FILE="$POSTGRESQL_DATA_DIR/recovery.conf"
export POSTGRESQL_LOG_DIR="$POSTGRESQL_BASE_DIR/logs"
export POSTGRESQL_LOG_FILE="$POSTGRESQL_LOG_DIR/postgresql.log"
export POSTGRESQL_TMP_DIR="$POSTGRESQL_BASE_DIR/tmp"
export POSTGRESQL_PID_FILE="$POSTGRESQL_TMP_DIR/postgresql.pid"
export POSTGRESQL_BIN_DIR="$POSTGRESQL_BASE_DIR/bin"
export POSTGRESQL_INITSCRIPTS_DIR="/docker-entrypoint-initdb.d"
export POSTGRESQL_PREINITSCRIPTS_DIR="/docker-entrypoint-preinitdb.d"
export PATH="${POSTGRESQL_BIN_DIR}:${BITNAMI_ROOT_DIR}/common/bin:${PATH}"

# System users (when running with a privileged user)
export POSTGRESQL_DAEMON_USER="postgres"
export POSTGRESQL_DAEMON_GROUP="postgres"

# PostgreSQL settings
export POSTGRESQL_INIT_MAX_TIMEOUT="${POSTGRESQL_INIT_MAX_TIMEOUT:-60}"
export POSTGRESQL_PGCTLTIMEOUT="${POSTGRESQL_PGCTLTIMEOUT:-60}"
POSTGRESQL_SHUTDOWN_MODE="${POSTGRESQL_SHUTDOWN_MODE:-"${POSTGRES_SHUTDOWN_MODE:-}"}"
export POSTGRESQL_SHUTDOWN_MODE="${POSTGRESQL_SHUTDOWN_MODE:-fast}"
POSTGRESQL_CLUSTER_APP_NAME="${POSTGRESQL_CLUSTER_APP_NAME:-"${POSTGRES_CLUSTER_APP_NAME:-}"}"
export POSTGRESQL_CLUSTER_APP_NAME="${POSTGRESQL_CLUSTER_APP_NAME:-walreceiver}"
POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-"${POSTGRES_DATABASE:-}"}"
POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-"${POSTGRES_DB:-}"}"
export POSTGRESQL_DATABASE="${POSTGRESQL_DATABASE:-postgres}"
POSTGRESQL_INITDB_ARGS="${POSTGRESQL_INITDB_ARGS:-"${POSTGRES_INITDB_ARGS:-}"}"
export POSTGRESQL_INITDB_ARGS="${POSTGRESQL_INITDB_ARGS:-}"
export ALLOW_EMPTY_PASSWORD="${ALLOW_EMPTY_PASSWORD:-no}"
POSTGRESQL_INITDB_WAL_DIR="${POSTGRESQL_INITDB_WAL_DIR:-"${POSTGRES_INITDB_WAL_DIR:-}"}"
export POSTGRESQL_INITDB_WAL_DIR="${POSTGRESQL_INITDB_WAL_DIR:-}"
POSTGRESQL_MASTER_HOST="${POSTGRESQL_MASTER_HOST:-"${POSTGRES_MASTER_HOST:-}"}"
export POSTGRESQL_MASTER_HOST="${POSTGRESQL_MASTER_HOST:-}"
POSTGRESQL_MASTER_PORT_NUMBER="${POSTGRESQL_MASTER_PORT_NUMBER:-"${POSTGRES_MASTER_PORT_NUMBER:-}"}"
export POSTGRESQL_MASTER_PORT_NUMBER="${POSTGRESQL_MASTER_PORT_NUMBER:-5432}"
POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS="${POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS:-"${POSTGRES_NUM_SYNCHRONOUS_REPLICAS:-}"}"
export POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS="${POSTGRESQL_NUM_SYNCHRONOUS_REPLICAS:-0}"
POSTGRESQL_PORT_NUMBER="${POSTGRESQL_PORT_NUMBER:-"${POSTGRES_PORT_NUMBER:-}"}"
export POSTGRESQL_PORT_NUMBER="${POSTGRESQL_PORT_NUMBER:-5432}"
POSTGRESQL_ALLOW_REMOTE_CONNECTIONS="${POSTGRESQL_ALLOW_REMOTE_CONNECTIONS:-"${POSTGRES_ALLOW_REMOTE_CONNECTIONS:-}"}"
export POSTGRESQL_ALLOW_REMOTE_CONNECTIONS="${POSTGRESQL_ALLOW_REMOTE_CONNECTIONS:-yes}"
POSTGRESQL_REPLICATION_MODE="${POSTGRESQL_REPLICATION_MODE:-"${POSTGRES_REPLICATION_MODE:-}"}"
export POSTGRESQL_REPLICATION_MODE="${POSTGRESQL_REPLICATION_MODE:-master}"
POSTGRESQL_REPLICATION_USER="${POSTGRESQL_REPLICATION_USER:-"${POSTGRES_REPLICATION_USER:-}"}"
export POSTGRESQL_REPLICATION_USER="${POSTGRESQL_REPLICATION_USER:-}"
POSTGRESQL_SYNCHRONOUS_COMMIT_MODE="${POSTGRESQL_SYNCHRONOUS_COMMIT_MODE:-"${POSTGRES_SYNCHRONOUS_COMMIT_MODE:-}"}"
export POSTGRESQL_SYNCHRONOUS_COMMIT_MODE="${POSTGRESQL_SYNCHRONOUS_COMMIT_MODE:-on}"
POSTGRESQL_FSYNC="${POSTGRESQL_FSYNC:-"${POSTGRES_FSYNC:-}"}"
export POSTGRESQL_FSYNC="${POSTGRESQL_FSYNC:-on}"
POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRES_USERNAME:-}"}"
POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRES_USER:-}"}"
POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-"${POSTGRESQL_USER:-}"}"
export POSTGRESQL_USERNAME="${POSTGRESQL_USERNAME:-postgres}"
POSTGRESQL_ENABLE_LDAP="${POSTGRESQL_ENABLE_LDAP:-"${POSTGRES_ENABLE_LDAP:-}"}"
export POSTGRESQL_ENABLE_LDAP="${POSTGRESQL_ENABLE_LDAP:-no}"
POSTGRESQL_LDAP_URL="${POSTGRESQL_LDAP_URL:-"${POSTGRES_LDAP_URL:-}"}"
export POSTGRESQL_LDAP_URL="${POSTGRESQL_LDAP_URL:-}"
POSTGRESQL_LDAP_PREFIX="${POSTGRESQL_LDAP_PREFIX:-"${POSTGRES_LDAP_PREFIX:-}"}"
export POSTGRESQL_LDAP_PREFIX="${POSTGRESQL_LDAP_PREFIX:-}"
POSTGRESQL_LDAP_SUFFIX="${POSTGRESQL_LDAP_SUFFIX:-"${POSTGRES_LDAP_SUFFIX:-}"}"
export POSTGRESQL_LDAP_SUFFIX="${POSTGRESQL_LDAP_SUFFIX:-}"
POSTGRESQL_LDAP_SERVER="${POSTGRESQL_LDAP_SERVER:-"${POSTGRES_LDAP_SERVER:-}"}"
export POSTGRESQL_LDAP_SERVER="${POSTGRESQL_LDAP_SERVER:-}"
POSTGRESQL_LDAP_PORT="${POSTGRESQL_LDAP_PORT:-"${POSTGRES_LDAP_PORT:-}"}"
export POSTGRESQL_LDAP_PORT="${POSTGRESQL_LDAP_PORT:-}"
POSTGRESQL_LDAP_SCHEME="${POSTGRESQL_LDAP_SCHEME:-"${POSTGRES_LDAP_SCHEME:-}"}"
export POSTGRESQL_LDAP_SCHEME="${POSTGRESQL_LDAP_SCHEME:-}"
POSTGRESQL_LDAP_TLS="${POSTGRESQL_LDAP_TLS:-"${POSTGRES_LDAP_TLS:-}"}"
export POSTGRESQL_LDAP_TLS="${POSTGRESQL_LDAP_TLS:-}"
POSTGRESQL_LDAP_BASE_DN="${POSTGRESQL_LDAP_BASE_DN:-"${POSTGRES_LDAP_BASE_DN:-}"}"
export POSTGRESQL_LDAP_BASE_DN="${POSTGRESQL_LDAP_BASE_DN:-}"
POSTGRESQL_LDAP_BIND_DN="${POSTGRESQL_LDAP_BIND_DN:-"${POSTGRES_LDAP_BIND_DN:-}"}"
export POSTGRESQL_LDAP_BIND_DN="${POSTGRESQL_LDAP_BIND_DN:-}"
POSTGRESQL_LDAP_BIND_PASSWORD="${POSTGRESQL_LDAP_BIND_PASSWORD:-"${POSTGRES_LDAP_BIND_PASSWORD:-}"}"
export POSTGRESQL_LDAP_BIND_PASSWORD="${POSTGRESQL_LDAP_BIND_PASSWORD:-}"
POSTGRESQL_LDAP_SEARCH_ATTR="${POSTGRESQL_LDAP_SEARCH_ATTR:-"${POSTGRES_LDAP_SEARCH_ATTR:-}"}"
export POSTGRESQL_LDAP_SEARCH_ATTR="${POSTGRESQL_LDAP_SEARCH_ATTR:-}"
POSTGRESQL_LDAP_SEARCH_FILTER="${POSTGRESQL_LDAP_SEARCH_FILTER:-"${POSTGRES_LDAP_SEARCH_FILTER:-}"}"
export POSTGRESQL_LDAP_SEARCH_FILTER="${POSTGRESQL_LDAP_SEARCH_FILTER:-}"
POSTGRESQL_INITSCRIPTS_USERNAME="${POSTGRESQL_INITSCRIPTS_USERNAME:-"${POSTGRES_INITSCRIPTS_USERNAME:-}"}"
export POSTGRESQL_INITSCRIPTS_USERNAME="${POSTGRESQL_INITSCRIPTS_USERNAME:-$POSTGRESQL_USERNAME}"
POSTGRESQL_PASSWORD="${POSTGRESQL_PASSWORD:-"${POSTGRES_PASSWORD:-}"}"
export POSTGRESQL_PASSWORD="${POSTGRESQL_PASSWORD:-}"
POSTGRESQL_POSTGRES_PASSWORD="${POSTGRESQL_POSTGRES_PASSWORD:-"${POSTGRES_POSTGRES_PASSWORD:-}"}"
export POSTGRESQL_POSTGRES_PASSWORD="${POSTGRESQL_POSTGRES_PASSWORD:-}"
POSTGRESQL_REPLICATION_PASSWORD="${POSTGRESQL_REPLICATION_PASSWORD:-"${POSTGRES_REPLICATION_PASSWORD:-}"}"
export POSTGRESQL_REPLICATION_PASSWORD="${POSTGRESQL_REPLICATION_PASSWORD:-}"
POSTGRESQL_INITSCRIPTS_PASSWORD="${POSTGRESQL_INITSCRIPTS_PASSWORD:-"${POSTGRES_INITSCRIPTS_PASSWORD:-}"}"
export POSTGRESQL_INITSCRIPTS_PASSWORD="${POSTGRESQL_INITSCRIPTS_PASSWORD:-$POSTGRESQL_PASSWORD}"
POSTGRESQL_ENABLE_TLS="${POSTGRESQL_ENABLE_TLS:-"${POSTGRES_ENABLE_TLS:-}"}"
export POSTGRESQL_ENABLE_TLS="${POSTGRESQL_ENABLE_TLS:-no}"
POSTGRESQL_TLS_CERT_FILE="${POSTGRESQL_TLS_CERT_FILE:-"${POSTGRES_TLS_CERT_FILE:-}"}"
export POSTGRESQL_TLS_CERT_FILE="${POSTGRESQL_TLS_CERT_FILE:-}"
POSTGRESQL_TLS_KEY_FILE="${POSTGRESQL_TLS_KEY_FILE:-"${POSTGRES_TLS_KEY_FILE:-}"}"
export POSTGRESQL_TLS_KEY_FILE="${POSTGRESQL_TLS_KEY_FILE:-}"
POSTGRESQL_TLS_CA_FILE="${POSTGRESQL_TLS_CA_FILE:-"${POSTGRES_TLS_CA_FILE:-}"}"
export POSTGRESQL_TLS_CA_FILE="${POSTGRESQL_TLS_CA_FILE:-}"
POSTGRESQL_TLS_CRL_FILE="${POSTGRESQL_TLS_CRL_FILE:-"${POSTGRES_TLS_CRL_FILE:-}"}"
export POSTGRESQL_TLS_CRL_FILE="${POSTGRESQL_TLS_CRL_FILE:-}"
POSTGRESQL_TLS_PREFER_SERVER_CIPHERS="${POSTGRESQL_TLS_PREFER_SERVER_CIPHERS:-"${POSTGRES_TLS_PREFER_SERVER_CIPHERS:-}"}"
export POSTGRESQL_TLS_PREFER_SERVER_CIPHERS="${POSTGRESQL_TLS_PREFER_SERVER_CIPHERS:-yes}"
POSTGRESQL_SHARED_PRELOAD_LIBRARIES="${POSTGRESQL_SHARED_PRELOAD_LIBRARIES:-"${POSTGRES_SHARED_PRELOAD_LIBRARIES:-}"}"
export POSTGRESQL_SHARED_PRELOAD_LIBRARIES="${POSTGRESQL_SHARED_PRELOAD_LIBRARIES:-pgaudit}"
POSTGRESQL_PGAUDIT_LOG="${POSTGRESQL_PGAUDIT_LOG:-"${POSTGRES_PGAUDIT_LOG:-}"}"
export POSTGRESQL_PGAUDIT_LOG="${POSTGRESQL_PGAUDIT_LOG:-}"
POSTGRESQL_PGAUDIT_LOG_CATALOG="${POSTGRESQL_PGAUDIT_LOG_CATALOG:-"${POSTGRES_PGAUDIT_LOG_CATALOG:-}"}"
export POSTGRESQL_PGAUDIT_LOG_CATALOG="${POSTGRESQL_PGAUDIT_LOG_CATALOG:-}"
POSTGRESQL_LOG_CONNECTIONS="${POSTGRESQL_LOG_CONNECTIONS:-"${POSTGRES_LOG_CONNECTIONS:-}"}"
export POSTGRESQL_LOG_CONNECTIONS="${POSTGRESQL_LOG_CONNECTIONS:-}"
POSTGRESQL_LOG_DISCONNECTIONS="${POSTGRESQL_LOG_DISCONNECTIONS:-"${POSTGRES_LOG_DISCONNECTIONS:-}"}"
export POSTGRESQL_LOG_DISCONNECTIONS="${POSTGRESQL_LOG_DISCONNECTIONS:-}"
POSTGRESQL_LOG_HOSTNAME="${POSTGRESQL_LOG_HOSTNAME:-"${POSTGRES_LOG_HOSTNAME:-}"}"
export POSTGRESQL_LOG_HOSTNAME="${POSTGRESQL_LOG_HOSTNAME:-}"
POSTGRESQL_CLIENT_MIN_MESSAGES="${POSTGRESQL_CLIENT_MIN_MESSAGES:-"${POSTGRES_CLIENT_MIN_MESSAGES:-}"}"
export POSTGRESQL_CLIENT_MIN_MESSAGES="${POSTGRESQL_CLIENT_MIN_MESSAGES:-error}"
POSTGRESQL_LOG_LINE_PREFIX="${POSTGRESQL_LOG_LINE_PREFIX:-"${POSTGRES_LOG_LINE_PREFIX:-}"}"
export POSTGRESQL_LOG_LINE_PREFIX="${POSTGRESQL_LOG_LINE_PREFIX:-}"
POSTGRESQL_LOG_TIMEZONE="${POSTGRESQL_LOG_TIMEZONE:-"${POSTGRES_LOG_TIMEZONE:-}"}"
export POSTGRESQL_LOG_TIMEZONE="${POSTGRESQL_LOG_TIMEZONE:-}"
POSTGRESQL_TIMEZONE="${POSTGRESQL_TIMEZONE:-"${POSTGRES_TIMEZONE:-}"}"
export POSTGRESQL_TIMEZONE="${POSTGRESQL_TIMEZONE:-}"
POSTGRESQL_MAX_CONNECTIONS="${POSTGRESQL_MAX_CONNECTIONS:-"${POSTGRES_MAX_CONNECTIONS:-}"}"
export POSTGRESQL_MAX_CONNECTIONS="${POSTGRESQL_MAX_CONNECTIONS:-}"
POSTGRESQL_TCP_KEEPALIVES_IDLE="${POSTGRESQL_TCP_KEEPALIVES_IDLE:-"${POSTGRES_TCP_KEEPALIVES_IDLE:-}"}"
export POSTGRESQL_TCP_KEEPALIVES_IDLE="${POSTGRESQL_TCP_KEEPALIVES_IDLE:-}"
POSTGRESQL_TCP_KEEPALIVES_INTERVAL="${POSTGRESQL_TCP_KEEPALIVES_INTERVAL:-"${POSTGRES_TCP_KEEPALIVES_INTERVAL:-}"}"
export POSTGRESQL_TCP_KEEPALIVES_INTERVAL="${POSTGRESQL_TCP_KEEPALIVES_INTERVAL:-}"
POSTGRESQL_TCP_KEEPALIVES_COUNT="${POSTGRESQL_TCP_KEEPALIVES_COUNT:-"${POSTGRES_TCP_KEEPALIVES_COUNT:-}"}"
export POSTGRESQL_TCP_KEEPALIVES_COUNT="${POSTGRESQL_TCP_KEEPALIVES_COUNT:-}"
POSTGRESQL_STATEMENT_TIMEOUT="${POSTGRESQL_STATEMENT_TIMEOUT:-"${POSTGRES_STATEMENT_TIMEOUT:-}"}"
export POSTGRESQL_STATEMENT_TIMEOUT="${POSTGRESQL_STATEMENT_TIMEOUT:-}"
POSTGRESQL_PGHBA_REMOVE_FILTERS="${POSTGRESQL_PGHBA_REMOVE_FILTERS:-"${POSTGRES_PGHBA_REMOVE_FILTERS:-}"}"
export POSTGRESQL_PGHBA_REMOVE_FILTERS="${POSTGRESQL_PGHBA_REMOVE_FILTERS:-}"
POSTGRESQL_USERNAME_CONNECTION_LIMIT="${POSTGRESQL_USERNAME_CONNECTION_LIMIT:-"${POSTGRES_USER_CONNECTION_LIMIT:-}"}"
export POSTGRESQL_USERNAME_CONNECTION_LIMIT="${POSTGRESQL_USERNAME_CONNECTION_LIMIT:-}"
POSTGRESQL_POSTGRES_CONNECTION_LIMIT="${POSTGRESQL_POSTGRES_CONNECTION_LIMIT:-"${POSTGRES_POSTGRES_CONNECTION_LIMIT:-}"}"
export POSTGRESQL_POSTGRES_CONNECTION_LIMIT="${POSTGRESQL_POSTGRES_CONNECTION_LIMIT:-}"
export POSTGRESQL_WAL_LEVEL="${POSTGRESQL_WAL_LEVEL:-replica}"

# pgAutoFailover settings
export POSTGRESQL_AUTOCTL_VOLUME_DIR="${POSTGRESQL_VOLUME_DIR}/pgautoctl"
export POSTGRESQL_AUTOCTL_CONF_DIR="${POSTGRESQL_AUTOCTL_CONF_DIR:-${POSTGRESQL_AUTOCTL_VOLUME_DIR}/.config}"
export POSTGRESQL_AUTOCTL_MODE="${POSTGRESQL_AUTOCTL_MODE:-postgres}"
export POSTGRESQL_AUTOCTL_MONITOR_HOST="${POSTGRESQL_AUTOCTL_MONITOR_HOST:-monitor}"
export POSTGRESQL_AUTOCTL_HOSTNAME="${POSTGRESQL_AUTOCTL_HOSTNAME:-$(hostname --fqdn)}"

# pgBackRest settings
export POSTGRESQL_PGBACKREST_VOLUME_DIR="${POSTGRESQL_VOLUME_DIR}/pgbackrest"
export POSTGRESQL_PGBACKREST_LOGS_DIR="${POSTGRESQL_PGBACKREST_VOLUME_DIR}/logs"
export POSTGRESQL_PGBACKREST_BACKUPS_DIR="${POSTGRESQL_PGBACKREST_VOLUME_DIR}/backups"
export POSTGRESQL_PGBACKREST_SPOOL_DIR="${POSTGRESQL_PGBACKREST_VOLUME_DIR}/spool"
export POSTGRESQL_PGBACKREST_CONF_FILE="${POSTGRESQL_DATA_DIR}/pgbackrest.conf"

# Internal
export POSTGRESQL_FIRST_BOOT="yes"
export NSS_WRAPPER_LIB="/opt/bitnami/common/lib/libnss_wrapper.so"

# Paths (Replication Manager)
export PATH="/opt/bitnami/repmgr/bin:/opt/bitnami/common/bin:$PATH"
export REPMGR_BASE_DIR="/opt/bitnami/repmgr"
export REPMGR_CONF_DIR="$REPMGR_BASE_DIR/conf"
export REPMGR_VOLUME_DIR="/bitnami/repmgr"
export REPMGR_MOUNTED_CONF_DIR="$REPMGR_VOLUME_DIR/conf"
export REPMGR_TMP_DIR="$REPMGR_BASE_DIR/tmp"
export REPMGR_EVENTS_DIR="$REPMGR_BASE_DIR/events"
export REPMGR_LOCK_DIR="$POSTGRESQL_VOLUME_DIR/lock"
export REPMGR_PRIMARY_ROLE_LOCK_FILE_NAME="$REPMGR_LOCK_DIR/master.lock"
export REPMGR_STANDBY_ROLE_LOCK_FILE_NAME="$REPMGR_LOCK_DIR/standby.lock"
export REPMGR_BIN_DIR="$REPMGR_BASE_DIR/bin"
export REPMGR_CONF_FILE="$REPMGR_CONF_DIR/repmgr.conf"
export REPMGR_PID_FILE="$REPMGR_TMP_DIR/repmgr.pid"
export REPMGR_DATA_DIR="${REPMGR_DATA_DIR:-${REPMGR_VOLUME_DIR}/repmgr/data}"

# Settings (Replication Manager)
export REPMGR_NODE_ID="${REPMGR_NODE_ID:-}"
export REPMGR_NODE_ID_START_SEED="${REPMGR_NODE_ID_START_SEED:-1000}"
export REPMGR_NODE_NAME="${REPMGR_NODE_NAME:-$(hostname)}"
export REPMGR_NODE_NETWORK_NAME="${REPMGR_NODE_NETWORK_NAME:-}"
export REPMGR_NODE_PRIORITY="${REPMGR_NODE_PRIORITY:-100}"
export REPMGR_NODE_LOCATION="${REPMGR_NODE_LOCATION:-default}"
export REPMGR_PORT_NUMBER="${REPMGR_PORT_NUMBER:-5432}"
export REPMGR_LOG_LEVEL="${REPMGR_LOG_LEVEL:-NOTICE}"
export REPMGR_START_OPTIONS="${REPMGR_START_OPTIONS:-}"
export REPMGR_CONNECT_TIMEOUT="${REPMGR_CONNECT_TIMEOUT:-5}"
export REPMGR_RECONNECT_ATTEMPTS="${REPMGR_RECONNECT_ATTEMPTS:-3}"
export REPMGR_RECONNECT_INTERVAL="${REPMGR_RECONNECT_INTERVAL:-5}"
export REPMGR_PARTNER_NODES="${REPMGR_PARTNER_NODES:-}"
export REPMGR_PRIMARY_HOST="${REPMGR_PRIMARY_HOST:-}"
export REPMGR_PRIMARY_PORT="${REPMGR_PRIMARY_PORT:-5432}"
export REPMGR_USE_REPLICATION_SLOTS="${REPMGR_USE_REPLICATION_SLOTS:-1}"
export REPMGR_MASTER_RESPONSE_TIMEOUT="${REPMGR_MASTER_RESPONSE_TIMEOUT:-20}"
export REPMGR_DEGRADED_MONITORING_TIMEOUT="${REPMGR_DEGRADED_MONITORING_TIMEOUT:-5}"
export REPMGR_UPGRADE_EXTENSION="${REPMGR_UPGRADE_EXTENSION:-no}"

# Internal (Replication Manager)
export REPMGR_SWITCH_ROLE="${REPMGR_SWITCH_ROLE:-no}"
export REPMGR_CURRENT_PRIMARY_HOST=""
export REPMGR_CURRENT_PRIMARY_PORT="$REPMGR_PRIMARY_PORT"

# Credentials (Replication Manager)
export REPMGR_USERNAME="${REPMGR_USERNAME:-repmgr}"
export REPMGR_DATABASE="${REPMGR_DATABASE:-repmgr}"
export REPMGR_PGHBA_TRUST_ALL="${REPMGR_PGHBA_TRUST_ALL:-no}"
export REPMGR_PASSWORD="${REPMGR_PASSWORD:-}"
export REPMGR_USE_PASSFILE="${REPMGR_USE_PASSFILE:-}"
export REPMGR_PASSFILE_PATH="${REPMGR_PASSFILE_PATH:-$REPMGR_CONF_DIR/.pgpass}"

# PostgreSQL env var (Replication Manager)
export PGCONNECT_TIMEOUT="${PGCONNECT_TIMEOUT:-10}"
export POSTGRESQL_REPLICATION_USER="$REPMGR_USERNAME"
export POSTGRESQL_REPLICATION_PASSWORD="$REPMGR_PASSWORD"
export POSTGRESQL_REPLICATION_USE_PASSFILE="$REPMGR_USE_PASSFILE"
export POSTGRESQL_REPLICATION_PASSFILE_PATH="${POSTGRESQL_REPLICATION_PASSFILE_PATH:-$REPMGR_PASSFILE_PATH}"
export POSTGRESQL_MASTER_HOST="$REPMGR_PRIMARY_HOST"
export POSTGRESQL_MASTER_PORT_NUMBER="$REPMGR_PRIMARY_PORT"

# Custom environment variables may be defined below
