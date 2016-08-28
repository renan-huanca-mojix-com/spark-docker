#!/usr/bin/env bash

# Starts a slave instance on each machine specified in the conf/slaves file.

CLASS="org.apache.spark.deploy.worker.Worker"

if [ -z "${SPARK_HOME}" ]; then
  export SPARK_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"

# Find the port number for the master
if [ "$SPARK_MASTER_PORT" = "" ]; then
  SPARK_MASTER_PORT=7077
fi

if [ "$SPARK_MASTER_HOST" = "" ]; then
  SPARK_MASTER_HOST="`hostname`"
fi



#"${SPARK_HOME}"/bin/spark-class $CLASS spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT

echo "${SPARK_HOME}"/bin/spark-class $CLASS spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT

"${SPARK_HOME}"/bin/spark-class $CLASS spark://$SPARK_MASTER_HOST:7077
