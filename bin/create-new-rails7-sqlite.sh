# create_new_rails7_sqli

main() {
  local app_name="$1"
  start_and_validate  
  create_app
  finish_and_commit
}

create_app() {
  rails new $app_name --database=sqlite3 \
    --skip-bundle
}

start_and_validate() {
  if [ -z $app_name ]; then
    app_name=`haiku`
  fi
  echo " create_new_rails7_sqli"
  echo " => app_name: $app_name"
}

finish_and_commit() {
  cd $app_name
  git init
  git add .
  git commit -m "first commit"
  echo 
  echo " => done"
}

main "$@"
