#!/bin/bash

cat > /etc/security/limits.conf  << EOF
* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535
EOF

cat > /etc/sysctl.conf  << EOF
vm.max_map_count=262144
EOF

sysctl -p
