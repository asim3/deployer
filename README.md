# deployer
Deploy a Scalable and Secure Applications with Kubernetes

[Release Notes](CHANGELOG.md)


### to build the package
```bash
curl -O https://github.com/asim3/deployer/releases/download/v0.1.0/deployer.deb
curl -O https://github.com/asim3/deployer/releases/download/v0.1.0/deployer.deb.sha256sum
sha256sum -c deployer.deb.sha256sum
sudo apt install ./deployer.deb
```


### to remove the package
```bash
sudo apt remove deployer
```


### You can run all the tests in your local machine
```bash
./run-tests
```
