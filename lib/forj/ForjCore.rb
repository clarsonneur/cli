#!/usr/bin/env ruby
# encoding: UTF-8

# (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

# Defines how to manage Maestro and forges
# create a maestro box. Identify a forge instance, delete it,...

# Define framework object on BaseDefinition
# See lib/core/definition.rb for function details usage.
class BaseDefinition


   define_obj  :maestro_repository,
      {
         :create_e => :clone_or_use_maestro_repo
      }

   obj_needs   :data,   :maestro_repo

   define_obj  :infra_repository,
      {
         :create_e => :create_or_use_infra
      }

   obj_needs   :data,   :infra_repo

   define_obj  :userdata,
      {
         :create_e => :build_userdata
      }

   obj_needs   :CloudObject,  :maestro_repository
   obj_needs   :CloudObject,  :infra_repository

   define_obj  :metadata,
      {
         :create_e => :build_metadata
      }

   obj_needs   :data,   :network_name
   obj_needs   :data,   :security_group
   obj_needs   :data,   :keypair_name
   obj_needs   :data,   :image_name
   obj_needs   :data,   :bp_flavor
   obj_needs   :data,   :compute

   define_obj  :forge,
      {
         :create_e => :build_forge,
         :delete_e => :drop_forge
      }
   obj_needs   :CloudObject,  :metadata
   obj_needs   :CloudObject,  :userdata
   obj_needs   :data,         :instance_name

   obj_needs_optional
   obj_needs   :data,         :blueprint

end

class ForjCoreProcess


end