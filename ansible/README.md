Needed to add ssh pub file to ssh agent to ssh, https://stackoverflow.com/a/51500802.
Use the documentation to find modules and options, https://docs.ansible.com/ansible/latest/, it is surprisingly good.
https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html
## Ansible vault

Add Ansible vault password as ENV variable, `ANSIBLE_VAULT_PASSWORD_FILE=<path-to-file>`. 
I had to run file as bash script for it to work.
```
#!/bin/bash
cat <<EOF
<password>
EOF
```

## Dynamic inventory for AWS
https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html#inventory-script-example-aws-ec2

## AWS credentials

Use `insert_aws_keys_in_config.sh` to paste AWS credentials from clipboard into `aws_keys.yml`.



## ansible.cfg

Config for ansible.
Example of relevant settings:
```
[defaults]
host_key_checking = False
private_key_file = <path-to-ssh-pub-file>
ansible_python_interpreter = ../../.venv/bin/python

[inventory]
enable_plugins = ini
```

Change `private_key_file = <path-to-ssh-pub-file>` to your ssh-key.


Needed the following for Ansible to read the `hosts` file (which parser it should use to read the file).
```
[inventory]
enable_plugins = ini
```

To be able to run commands locally using venv, the following is needed.
```
ansible_python_interpreter = ../../.venv/bin/python
```

Problems with ssh and ControlSocket/permission denied for cp/ssh, https://stackoverflow.com/a/41698903.

```
[ssh_connection]
ssh_args =
```


## Run locally

When we want to work against an API, as the AWS modules do, we don't want Ansible to SSH to any server. So we connect to localhost without an ssh connection.
In `hosts` we need:
```
[local]
localhost ansible_connection=local
```
In the playbook:
```
-   hosts: local
    connection: local # Keep ansible from open ssh connection
    gather_facts: False
```


## Encoding Error

```
File "/c/Users/aar/git/redovisnings-sida/.venv/lib/python3.5/site-packages/boto/rds2/layer1.py", line 3779, in _make_request
  return json.loads(body)
File "/usr/lib/python3.5/json/__init__.py", line 312, in loads
  s.__class__.__name__))
TypeError: the JSON object must be str, not 'bytes'

.......

File \"/c/Users/aar/git/redovisnings-sida/.venv/lib/python3.5/site-packages/boto/rds2/layer1.py\", line 1522, in describe_db_instances\n    path='/', params=params)\n  File \"/c/Users/aar/git/redovisnings-sida/.venv/lib/python3.5/site-packages/boto/rds2/layer1.py\", line 3779, in _make_request\n    return json.loads(body)\n  File \"/usr/lib/python3.5/json/__init__.py\", line 312, in loads\n    s.__class__.__name__))\nTypeError: the JSON object must be str, not 'bytes'\n",
    "module_stdout": "",
    "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error",
    "rc": 1
}
```
https://github.com/boto/boto/issues/2677


Add ssh key to ssh agent to not need password!
```
eval $(ssh-agent -s)
ssh-add ~/.ssh/
```

Try something:
` ansible -i hosts  -m debug -a msg="{{playbook_dir}}" local`