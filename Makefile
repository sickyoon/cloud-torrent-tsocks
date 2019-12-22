build:
	sudo docker build -t simple-torrent .

run:
	sudo docker run -it --rm simple-torrent

deploy:
	helm install simple-torrent charts/simple-torrent/.

