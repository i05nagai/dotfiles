#!/bin/bash

get_project()
{
  # command exists
  if which gcloud >/dev/null 2>&1; then
    gcloud config get-value account
    gcloud config get-value project
  fi
}
