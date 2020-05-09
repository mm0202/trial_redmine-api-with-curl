function checkVariables() {
	if [ -z "$DOMAIN" ]; then
		echo 'DOMAIN is empty. Please set DOMAIN.'
	fi

	if [ -z "$API_ACCESS_KEY" ]; then
		echo 'API_ACCESS_KEY is empty. Please set API_ACCESS_KEY.'
	fi
}

function listProjects() {
	checkVariables

	curl "$DOMAIN/projects.json"
}

function showProject() {
	checkVariables

	local ID=$1
	curl "$DOMAIN/projects/$ID.json"
}

function createProject() {
	checkVariables

	local ID=$1
	curl -X POST -H "Content-Type: application/json" -H "X-Redmine-API-Key: $API_ACCESS_KEY" -d "{\"project\":{\"name\":\"$ID\",\"identifier\":\"$ID\"}}" "$DOMAIN/projects.json"
}

function updateProjectDescription() {
	checkVariables

	local ID=$1
	local DESCRIPTION=$2
	curl -X PUT -H "Content-Type: application/json" -H "X-Redmine-API-Key: $API_ACCESS_KEY" -d "{\"project\":{\"description\":\"$DESCRIPTION\"}}" "$DOMAIN/projects/$ID.json"
}

function deleteProject() {
	checkVariables

	local ID=$1
	curl -X DELETE -H "Content-Type: application/json" -H "X-Redmine-API-Key: $API_ACCESS_KEY" "$DOMAIN/projects/$ID.json"
}
