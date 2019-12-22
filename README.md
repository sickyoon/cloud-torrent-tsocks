# simple-torrent

Deploy cloud-torrent on kubernetes through socks proxy

# dockerhub

sickyoon/simple-torrent

# generate

```
htpasswd -B -C 16 -c ./auth <USER>
k create secret generic simple-torrent --from-file auth
```

