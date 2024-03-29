#!/bin/bash
rm $(pwd)/antmedia-*.tgz
sed -i -e "s/^version.*/version: $(cat VERSION)/" -e "s/^appVersion.*/appVersion: $(cat VERSION)/" $(pwd)/Chart.yaml
sed -i "s/tag:.*/tag: $(cat VERSION)/" $(pwd)/values.yaml
helm dependency update
helm package $(pwd)/.
helm repo index --url https://muratugureminoglu.github.io/helm/ --merge index.yaml .
