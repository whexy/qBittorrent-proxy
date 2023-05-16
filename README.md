qBittorrent-proxy - qBittorrent with advanced proxy functionalities.
------------------------------------------

### Description:
qBittorrent is a bittorrent client programmed in C++ / Qt that uses
libtorrent (sometimes called libtorrent-rasterbar) by Arvid Norberg.

qBittorrent-proxy is designed to enhance the proxy capabilities of qBittorrent. When utilizing a proxy, libtorrent assigns the listening port as 1 to indicate that the server cannot actively accept incoming connections. This applies to both SOCKS5 and HTTP proxies.

However, this restriction poses challenges in terms of peers being able to actively connect to your client, making it difficult to improve your upload ratio. This is particularly crucial on private torrent (PT) servers.

To address this issue, qBittorrent-proxy offers several functionalities:

- It correctly announces the actual listening port on the server, instead of using port 1.
- It establishes a reverse-proxy connection between the server and the client over the specified port.
- It accepts incoming connections from other peers using the designated port.

By implementing these features, qBittorrent-proxy enables peers to actively connect to your client, facilitating the improvement of your upload ratio, especially on PT servers.

The free [IP to Country Lite database](https://db-ip.com/db/download/ip-to-country-lite) by [DB-IP](https://db-ip.com/) is used for resolving the countries of peers. The database is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

### Compile and Test:
For compile and test, follow the instructions from INSTALL file, but simple:

```
docker build -t qbit-proxy .
docker run -e DISPLAY=host.docker.internal:0 -it --rm qbit-proxy qbittorrent
```

will build and execute qBittorrent hopefully without any problem.

------------------------------------------
whexy \<whexy@outlook.com\>
