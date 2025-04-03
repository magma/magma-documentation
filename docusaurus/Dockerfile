# Copyright 2023 The Magma Authors.

# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM node:20-alpine AS base

WORKDIR /

# Copy package.json first
COPY docker.package.json ./package.json

# Check if package-lock.json exists, if not, generate it
RUN [ -f package-lock.json ] || npm install --package-lock-only

# Copy package-lock.json only if it exists
COPY package-lock.json* ./

# Install dependencies
RUN npm ci || npm install

COPY . .

# Development stage
FROM base AS development
CMD ["npm", "run", "start"]
