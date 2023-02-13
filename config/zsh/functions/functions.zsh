# SSH tunnel
ssh-tunnel() {

  local_port=$1 && shift
  remote_port=$1 && shift
  server=$1 && shift

  echo "Starting SSH Tunnel for $server"

  ssh -N -L "$local_port":localhost:"$remote_port" "$server"
}

# quick wordpress in docker
dwps() {
  image_name="wordpress-development"
  container_build_path="$HOME/Private-repos/docker-development-services/wordpress"
  original_path="$PWD"

  if [[ "$(docker images -q $image_name 2> /dev/null)" == "" ]] ; then
    cd "$container_build_path"
    docker build --tag "$image_name" .
    cd "$original_path"
  fi

  docker run -d --rm -p 3000:80 --user 1000:1000 -v "$PWD":/var/www/html --name "$image_name" "$image_name"
}

## Create python venv
pvenv() {
	[[ -n $VIRTAUL_ENV ]] && echo "Virtual enviroment already sourced" && return

	dir=${1:-venv}

	[[ ! -d $dir ]] && echo "Creating virtual enviroment..." && python -m venv $dir

	source "$dir/bin/activate"
}

# Print bottlenecks
profzsh() {
  shell=${1-$SHELL}
  ZPROF=true $shell -i -c exit
}
