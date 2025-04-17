#!/bin/bash

# Copyright 2020 The Magma Authors.

# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# ==============================
# Choose environment: development | production
# Default is "development"
ENV=${ENV:-development}
# ==============================

function exit_timeout() {
  echo ''
  docker compose logs $SERVICE
  echo ''
  echo "Timed out after ${1}s waiting for Docusaurus container to build. See logs above for more info."
  echo "Possible remedies:"
  echo '  - Remove node_modules directory (rm -rf node_modules) and try again.'
  exit 1
}

# spin until localhost:3000 returns HTTP code 200 (only for dev)
function spin() {
  maxsec=300
  spin='-\|/'
  i=0
  while [[ "$(curl -s -o /dev/null -w '%{http_code}' localhost:3000)" != "200" ]]; do
    [[ $i == "$maxsec" ]] && exit_timeout $i
    i=$(( i + 1 ))
    j=$(( i % 4 ))
    printf "\r%s" "${spin:$j:1}"
    sleep 1
  done
  printf "\r \n"
}

# Select service name and port based on environment
if [[ "$ENV" == "production" ]]; then
  SERVICE="docusaurus-prod"
  PORT=8080
  URL="http://localhost:$PORT/"
else
  SERVICE="docusaurus-dev"
  PORT=3000
  URL="http://localhost:$PORT/docs/basics/introduction"
fi

# Run
echo "==> Starting Docusaurus in '$ENV' mode..."

docker compose down
docker compose --compatibility up -d $SERVICE

if [[ "$ENV" == "development" ]]; then
  echo ''
  echo 'NOTE: README changes will live-reload. Sidebar changes require re-running this script.'
  echo ''
  echo 'Waiting for Docusaurus site to come up...'
  echo "If you want to follow the build logs: docker compose logs -f $SERVICE"
  spin
fi

echo "==> Docusaurus is running at: $URL"
# xdg-open "$URL" || true
