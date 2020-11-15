# Synology DS216j configuration

## Pre-requirements

- Create `ansible` user in `administrators` group
- Enable `SSH` in `Control Panel` -> `Terminal & SNMP` -> Check `Enable ssh login`
- Python 3 installed using the Package Manager

## Playbooks

### `ssh` playbook ([`ssh.yaml`](/ssh.yaml))

#### Pre-requirements

- `ansible.posix` for [`ansible.posix.authorized_keys`](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html) module: `ansible-galaxy collection install ansible.posix`

``` shell
ansible-playbook -k -K ssh.yaml
```

Configure `sshd` daemon to secure access. It will

- Copy current ssh key to use it instead of password login.
- Set `ansible` user home permissions properly so the key could be use.

### Main playbook ([`playbook.yaml`](/playbook.yaml))

#### Pre-requirements

- `community.general` for [`community.general.opkg`](https://docs.ansible.com/ansible/latest/collections/community/general/opkg_module.html) module: `ansible-galaxy collection install community.general`

```shell
ansible-playbook -K playbook.yaml
```

It will keep up-to-date:

- `pip` & `setuptools`
- `flexget` & `transmissionrpc`
- `transmission`