#!/usr/bin/env python
import i3ipc

i3 = i3ipc.Connection()

for output in [ o.name for o in i3.get_outputs() if o.active ]:
    print(output)

