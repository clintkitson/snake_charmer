Docker-gcloud
=============
```Docker-gsutil``` is meant to allow the usage interactively of the ```gcloud``` and ```gsutil``` utilties for ```Google Storage``` by specifying as environment variables the ```service account``` and accompanying ```p12``` certificate file at run-time.

In addition to the environment variables, you must also supply the proper a proper ```volume``` parameter that links a directory with your ```p12``` certificate that you specified as an environment variable to the correct location.

The first step is to create the ```service account``` and download the ```p12``` file.  From there place the ```p12``` file in a location you have access to.

### Docker Run (Non-Interactive)
The following run time allows the completely interactive usage of ```gsutil``` by leveraging an ```ENTRYPOINT``` that configures ```gcloud``` each time the Docker image is started.

#### Copy Files From Google Storage
```docker run -e cert_file=/cert/cert.p12 -e service_account=id-id@developer.gserviceaccount.com -v $(pwd)/cert:/cert -v $(pwd):/data -ti emccode/gsutil cp gs://folder/folder/file.* /data/.```

#### Copy Files To Google Storage
```docker run -e cert_file=/cert/cert.p12 -e service_account=id-id@developer.gserviceaccount.com -v $(pwd)/cert:/cert -v $(pwd):/data -ti emccode/gsutil cp /data/file.* gs://folder```

### Docker Run (Interactive)
You may also have a scenario where you want to issue a lot of commands, and authentication on every command may not be efficient.  In this case you can run an interactive session by specifying an ```ENTRYPOINT``` via the runtime parameter of ```/bin/bash```.
```docker run -e cert_file=/cert/cert.p12 -e service_account=id-id@developer.gserviceaccount.com -v $(pwd)/cert:/cert -ti --entrypoint /bin/bash emccode/gsutil```.

Following this on the first command use the following script ```/bin/run_gsutil.sh help```.  Any subsequent commands can be done using the native ```gsutil``` command as follows ```gsutil help```.




Licensing
---------
Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Support
-------
Please file bugs and issues at the Github issues page. For more general discussions you can contact the EMC Code team at <a href="https://groups.google.com/forum/#!forum/emccode-users">Google Groups</a>. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.


Enjoy!

