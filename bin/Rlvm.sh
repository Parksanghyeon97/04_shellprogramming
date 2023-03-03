#!/bin/bash



lvs


echo -n "vgname/lvname : "
read VGLV

lvremove -f $VGLV

echo << EOF


EOF

vgs

echo -n "vgname : "
read VGNAME

vgremove $VGNAME

echo << EOF


EOF

pvs

echo -n "pvname : "
read PVNAME

pvremove $PVNAME

