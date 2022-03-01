# ZKP-LDP

Comming Soon...

```shell
 $ docker build . -t ldp-node
 $ docker container run -it ldp-node bash
 $ docker compose up -d
 ```

```shell
pip3 install -r requirements.txt
```

```shell
./run.sh
```

```python:server.py
python3 server.py --mech k_rr --cate_num 10 --width 100 --epsilon 3.0 --port 50006 --address 127.0.0.1
```
```python:client.py
python3 client.py --mech k_rr --cate_num 10 --width 100 --epsilon 3.0 --port 50006 --address 127.0.0.1 --sensitive_value 9
```
