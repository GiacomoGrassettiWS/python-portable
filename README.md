# python-portable
```
python3 -m venv --copies venv
sed -i '43s/.*/VIRTUAL_ENV="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}" )")" \&\& pwd)"/' venv/bin/activate
sed -i '1s/.*/#!\/usr\/bin\/env python/' venv/bin/pip*
source venv/bin/activate
```
## Fixing CLI application
Pip will install applications with a hardcoded path in the shebang, you can fix it with:

> sed -i '1s/.*python$/#!\/usr\/bin\/env python/' venv/bin/*
> 
You’ll have to run this after you do *pip install*.

