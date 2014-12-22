#!/bin/sh
/google-cloud-sdk/bin/gcloud auth activate-service-account $service_account --key-file=$cert_file && /google-cloud-sdk/bin/gcloud $@
