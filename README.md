# hello_ansible

## up
```[bash]
docker-compose build
docker-compose up -d
```

### do your stuff in control
```[bash]
docker exec -it control bash -c "cd /home/ec2-user/ansible && su ec2-user"
ansible server -m ping -i hosts
ansible-playbook playbook.yml
```
