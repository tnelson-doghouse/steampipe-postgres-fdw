#!/usr/bin/env bash

cgo CFLAGS: -Ifdw -Ifdw/include/postgresql/server -Ifdw/include/postgresql/internal
cgo linux LDFLAGS: -Wl,-unresolved-symbols=ignore-all
cgo darwin LDFLAGS: -Wl,-undefined,dynamic_lookup
cd fdw
make clean
make go
make
make inst
cd -

#pg_ctl -D /usr/local/var/postgres restart
#psql postgres
