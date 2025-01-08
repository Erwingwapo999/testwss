#!/bin/bash
# Getting Proxy Template
wget -q -O /usr/local/bin/wss-nontls https://raw.githubusercontent.com/Erwingwapo999/givpn/refs/heads/master/websocket/websocket.py
chmod +x /usr/local/bin/wss-nontls

# Installing Service
cat > /etc/systemd/system/wss-nontls.service << END
[Unit]
Description=Python Proxy Test
Documentation=testing
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 2052
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable wss-nontls
systemctl restart wss-nontls