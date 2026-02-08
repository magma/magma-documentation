# Copyright 2025 The Magma Authors.
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#==================================================================
# Dockerfile based on Docusaurus community guide found at
# https://docusaurus.community/knowledge/deployment/docker/
#==================================================================

#==================================================================
# Base Node image
#==================================================================
# Node version 22 is the curent LTS
# The slim verision is based on a small debian image
FROM node:22-slim AS base
ENV FORCE_COLOR=0
RUN corepack enable
WORKDIR /opt/docusaurus

# Documentation contents
# The docs directory is overwritten by compose file
COPY docs docs
COPY src src
COPY static static
COPY versioned_docs versioned_docs
COPY versioned_sidebars versioned_sidebars

# Configuration files
COPY docusaurus.config.js .
COPY package.json package-lock.json* ./
COPY sidebars.js .
COPY sidebars.json .
COPY test.js .
COPY versions.json .

#==================================================================
# Local deployment
#==================================================================
FROM base AS dev
WORKDIR /opt/docusaurus
EXPOSE 3000
RUN [ ! -d "node_modules" ] && npm install --package-lock-only && npm ci
CMD ["npm", "run", "start", "--", "--poll", "1000"]

#==================================================================
# Base image for production deployment
#==================================================================
FROM base AS prod
WORKDIR /opt/docusaurus
COPY . /opt/docusaurus/
RUN npm ci
RUN npm run build

#==================================================================
# Production deployment
#==================================================================
FROM prod AS serve
EXPOSE 3000
CMD ["npm", "run", "serve", "--", "--no-open"]

#==================================================================
# Production deployment with Caddy automatic SSL/TLS
#==================================================================
FROM caddy:2-alpine AS caddy
COPY --from=prod /opt/docusaurus/Caddyfile /etc/caddy/Caddyfile
COPY --from=prod /opt/docusaurus/build /var/docusaurus