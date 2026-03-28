#!/bin/sh

##############################################################################
# Gradle wrapper script for POSIX systems
##############################################################################

APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

MAX_FD="maximum"
warn () { echo "$*"; }
die () { echo "$*"; exit 1; }

os_type=$(uname -s)
cygwin=false
msys=false
darwin=false
nonstop=false
case "$os_type" in
  CYGWIN*) cygwin=true ;;
  MINGW*|MSYS*) msys=true ;;
  Darwin*) darwin=true ;;
  NONSTOP*) nonstop=true ;;
esac

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use
if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/jre/sh/java" ]; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ]; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command found"
fi

# Use the maximum available, or set MAX_FD != -1 to use that value
if [ "$MAX_FD" != "max" ]; then
    MAX_FD_LIMIT=$(ulimit -H -n) || warn "Could not query maximum file descriptor limit"
    ulimit -n "$MAX_FD" || warn "Could not set maximum file descriptor limit: $MAX_FD"
fi

APP_HOME=$(cd "$(dirname "$0")" && pwd -P) || exit

# Collect all arguments for the java command
eval set -- $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" -classpath "\"$CLASSPATH\"" org.gradle.wrapper.GradleWrapperMain "$@"

exec "$JAVACMD" "$@"
