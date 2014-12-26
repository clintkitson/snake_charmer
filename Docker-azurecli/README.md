Docker-azurecli
=============
```Docker-azurecli``` is meant to allow the usage interactively of the ```Azure``` ```nodejs``` based ```azure``` CLI utilities by specifying as environment variables the ```AZURE_STORAGE_ACCESS_KEY``` and accompanying ```AZURE_STORAGE_ACCOUNT```.

### Docker Run (Non-Interactive)
The following run time allows the non-interactive usage of ```azure``` by leveraging leveraging passing through the extra commands with a new container for each command.

#### Help
```docker run -ti -e AZURE_STORAGE_ACCESS_KEY=key -e AZURE_STORAGE_ACCOUNT=account emccode/azurecli```

#### Version
```docker run -ti -e AZURE_STORAGE_ACCESS_KEY=key -e AZURE_STORAGE_ACCOUNT=account emccode/azurecli "--version"```

#### Download File
```docker run -ti -e AZURE_STORAGE_ACCESS_KEY=key -e AZURE_STORAGE_ACCOUNT=account -v $(pwd):/data emccode/azurecli storage blob download bucket file /data/```

#### Upload File
```docker run -ti -e AZURE_STORAGE_ACCESS_KEY=key -e AZURE_STORAGE_ACCOUNT=account -v $(pwd):/data emccode/azurecli storage blob upload /data/file container```

### Docker Run (Interactive)
You may also have a scenario where you want to issue a lot of commands, and a container for each command may not be the right method.  In this case you can run an interactive session by specifying an ```ENTRYPOINT``` via the runtime parameter of ```/bin/bash```.
```docker run -ti -e AZURE_STORAGE_ACCESS_KEY=key -e AZURE_STORAGE_ACCOUNT=account -v $(pwd):/data emccode/azurecli /bin/bash```.

Following this on the first command use the following script ```azure help```.




Licensing
---------
Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Support
-------
Please file bugs and issues at the Github issues page. For more general discussions you can contact the EMC Code team at <a href="https://groups.google.com/forum/#!forum/emccode-users">Google Groups</a>. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.


Enjoy!

