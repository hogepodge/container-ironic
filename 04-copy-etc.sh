mkdir glance/base/etc
cp -R repositories/glance/etc/* glance/base/etc/.

mkdir ironic/base/etc
cp -R repositories/ironic/etc/* ironic/base/etc/.

mkdir keystone/base/etc
cp -R repositories/keystone/etc/* keystone/base/etc/.

mkdir nova/base/etc
pushd repositories/nova
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt 
pip install -r test-requirements.txt 
pip install tox
tox -egenconfig
tox -egenpolicy
popd
cp -R repositories/nova/etc/* nova/base/etc/.
