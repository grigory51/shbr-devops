play:
	$$(pwd)/env/bin/ansible-playbook playbook.yaml

ips:
	ansible -mshell -a 'ifconfig eth0 | grep inet' all
