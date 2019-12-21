build:
	sudo docker build -t cloud-torrent-tsocks .

run:
	sudo docker run -it --rm cloud-torrent-tsocks

deploy:
	helm install cloud-torrent-tsocks charts/cloud-torrent-tsocks/.
