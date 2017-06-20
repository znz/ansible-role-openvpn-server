# OpenVPN Server

- Setup OpenVPN Server

## Requirements

- Debian GNU/Linux 9

## Role Variables

see defaults/main.yml

## Dependencies

- ufw
- OpenVPN 2.4 (`openvpn-server@.service`)

## Example Playbook

    ---
    - hosts: all
      sudo: yes
      roles:
      - role: znz.openvpn-server
        openvpn_server_ca_crt_path: path/to/pki/ca.crt
        openvpn_server_key_path: "path/to/pki/private/{{ inventory_hostname }}.key"
        openvpn_server_crt_path: "path/to/pki/issued/{{ inventory_hostname }}.crt"
        openvpn_server_crl_path: "path/to/pki/crl.pem"
        openvpn_server_network_name: "Example-Net"
        openvpn_server_port: 1194
        openvpn_server_network: "192.168.8.0 255.255.255.0"
        openvpn_server_more_config: |
          route 192.168.9.0 255.255.255.0
          push "route 192.168.9.0 255.255.255.0"

## License

MIT License
