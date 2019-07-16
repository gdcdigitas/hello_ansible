# hello_ansible

## up
```[bash]
docker-compose build
docker-compose up -d
```

### do your stuff in control
```[bash]
docker exec -it control bash -c 'su ec2-user'
cd $HOME/ansible
ansible server -m ping -i hosts
```
