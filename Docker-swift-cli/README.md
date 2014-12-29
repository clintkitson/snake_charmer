Docker-swift-cli
=============
```Docker-swift-cli``` is meant to allow the usage interactively of a ```Swift``` based object store by specifying as environment variables the ```ST_USER```, ```ST_KEY```, and ```ST_AUTH``` as the authentication URL.  The container is a minimal Docker image built from the ```scratch``` container and a statically linked binary (written in Golang <a href="https://github.com/fanatic/swift-cli">here</a>).

### Docker Run (Non-Interactive)
The following run time allows the non-interactive usage of ```swift-cli``` by leveraging leveraging passing through the extra commands with a new container for each command.  There is no ```interactive``` run where you specify an alternate ```ENTRYPOINT``` since this container is from ```scratch``` image.

#### Help
```docker run -ti -e ST_USER= -e ST_KEY= -e ST_AUTH= emccode/swift-cli```


#### List Buckets
```docker run -ti -e ST_USER= -e ST_KEY= -e ST_AUTH=https://auth.api.rackspacecloud.com/v1.0 emccode/swift-cli ls```

#### List Bucket Contents
```docker run -ti -e ST_USER=clintonskitson -e ST_KEY= -e ST_AUTH= emccode/swift-cli ls bucketName```

#### Download File
```docker run -ti -e ST_USER= -e ST_KEY= -e ST_AUTH= -v $(pwd):/output emccode/swift-cli get bucketName/file /output/outFile```

#### Upload File
```docker run -ti -e ST_USER= -e ST_KEY= -e ST_AUTH= -v $(pwd):/output emccode/swift-cli put /output/outFile bucketName/file```

### Building Docker Image

1. ```git clone https://github.com/emccode/snake_charmer```
2. cd snake_charmer/Docker-swift-cli
3. ```docker run -ti -e REPO_PATH=github.com/emccode/swift-cli -v $(pwd):/output emccode/golang_build_from_repo```
4. Check for the new ```swift-cli``` binary.
5. ```docker build -t emccode/swift-cli .```


Licensing
---------
Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Support
-------
Please file bugs and issues at the Github issues page. For more general discussions you can contact the EMC Code team at <a href="https://groups.google.com/forum/#!forum/emccode-users">Google Groups</a>. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.


Enjoy!

