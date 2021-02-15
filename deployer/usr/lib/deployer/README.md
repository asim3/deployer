# Deployer

> Deployer will look for a folder containing a main executable

## add new function

T add a new function, you can add a folder in `usr/lib/deployer` 
with a name of your choise containing a file named `main` and must 
be executable.

```bash
mkdir    /usr/lib/deployer/my-new-function
touch    /usr/lib/deployer/my-new-function/main
chmod +x /usr/lib/deployer/my-new-function/main
```
