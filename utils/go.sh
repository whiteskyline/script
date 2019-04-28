#
# go
#

function gon()
{
    export GOROOT=/opt/tiger/go/go
    /opt/tiger/go/go/bin/go $@
}

function go19()
{
    export GOROOT=/opt/tiger/go/go1.9.4
    /opt/tiger/go/go1.9.4/bin/go $@
}
