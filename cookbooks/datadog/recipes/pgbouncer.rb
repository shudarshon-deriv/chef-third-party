#
# Cookbook:: datadog
# Recipe:: pgbouncer
#
# Copyright:: 2011-2015, Datadog
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe '::dd-agent'

# Build a data structure with configuration.
# @see https://github.com/DataDog/integrations-core/blob/master/pgbouncer/conf.yaml.example Pgbouncer Example
# @example
#   node.override['datadog']['pgbouncer']['instances'] = [
#     {
#       host: 'localhost',
#       port: '15432',
#       username: 'john',
#       password: 'doe',
#       tags: [
#         'optional_tag1',
#         'optional_tag2'
#       ]
#     }
#   ]

datadog_monitor 'pgbouncer' do
  instances node['datadog']['pgbouncer']['instances']
  logs node['datadog']['pgbouncer']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
