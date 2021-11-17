#######################################
# Docker-compose shortcuts
#######################################
# Run docker-compose
alias dc="docker-compose -p ${COMPOSE_PROJECT_NAME:-docker}"
# Wipe out all docker containers for the compose project
alias dcwipe="dc kill && dc rm -fv"
# Reset all docker contianers for the compose project
alias dcr="dc kill && dc rm -fv && sleep 2 && dc up"
################################################
# View application logs on a docker container
################################################
dlog() {
  local _CMD=""
  case "$1" in
    ""|-h|--help)
      echo -e "Usage:\tdlog pfe|pbe|ifccsim|pcrfsim|vpssim [LOGFILE]\n\tdlog CONTAINER LOGFILE\nView application logs of a docker container. LOGFILE is assumed to be in /var/log."
      return 1
      ;;
    vpssim)
      _CMD="docker exec -ti ${COMPOSE_PROJECT_NAME:-docker}_$1_1 tail -f /var/log/${2:-pbe.log}"
      ;;
    pfe|pbe|ifccsim|pcrfsim)
      _CMD="docker exec -ti ${COMPOSE_PROJECT_NAME:-docker}_$1_1 tail -f /var/log/${1:-${2}}.log"
      ;;
    *)
      _CMD="docker exec -ti $1 tail -f /var/log/$2"
      ;;
  esac
  echo "$_CMD"
  $_CMD
}
################################################
# Execute a command on a docker container
################################################
dx() {
  local _CMD=""
  local _ARG=$1
  shift
  case "$_ARG" in
    ""|"-h"|"--help")
      echo -e "Usage: dx pfe|pbe|vpssim|...|CONTAINER COMMAND\nExecute a command on a docker container"
      return 1
      ;;
    pfe|pbe|ifccsim|pcrfsim|vpssim|uitest|database|ui|ff|ff_https|elalui|logstash|rabbitground|rabbitair)
      _CMD="docker exec -ti ${COMPOSE_PROJECT_NAME:-docker}_"$_ARG"_1 $@"
      ;;
    *)
      _CMD="docker exec -ti $_ARG $@"
      ;;
  esac
  echo "$_CMD"
  $_CMD
}
################################################
# Run bash on a docker container
################################################
dbash() { 
  if [[ $1 == "" || $1 == "-h" || $1 == "--help" ]]; then
    echo -e "Usage: dbash pfe|pbe|vpssim|...|CONTAINER\nRun a bash shell on a docker container"
    return 1
  fi
  dx "$@" bash
}
#######################################################
# Restart a supervisord service on a docker container
#######################################################
restart() {
  local _CMD=""
  case $1 in
    ""|"-h"|"--help")
      echo -e "Usage:\trestart all\n\trestart pfe|pbe|vpssim [PROCESS]\n\trestart CONTAINER PROCESS\nRestart a process managed by supervisord in a docker container"
      return 1
      ;;
    vpssim)
      _CMD="dx $1 supervisorctl restart ${2:-pbe}"
      ;;
    # vpssim and pbe must be reset in order due to the auth token refreshing
    pfe|pbe)
      _CMD="dx $1 supervisorctl restart ${2:-${1}}"
      ;;
    all)
      echo -e "dx vpssim supervisorctl restart pbe &&\ndx pbe supervisorctl restart pbe &&\ndx pfe supervisorctl restart pfe"
      dx vpssim supervisorctl restart pbe && dx pbe supervisorctl restart pbe && dx pfe supervisorctl restart pfe
      return 0
      ;;
    *)
      _CMD="dx $1 supervisorctl restart $2"
      ;;
  esac 
  echo $_CMD
  $_CMD
}
#######################################
# Run portal integration tests
# pitest [test] runs a specific test
#######################################
pitest() {
  local _CMD=""
  case "$1" in
    "-h"|"--help")
      echo -e "Usage: pitest [TEST NAME] [OPTIONS]\nRun portal integration tests\nExamples:\n\tpitest -v\n\tpitest test_mgmt_sessions1 -s"
      return 1
      ;;
    test*)
      local _ARG=$1
      shift
      _CMD="sudo python3 -B -m pytest test/test.py::$_ARG $@"
      ;;
    *)
      _CMD="sudo python3 -B -m pytest test/test.py $@"
      ;;
  esac
  echo $_CMD
  $_CMD
}
