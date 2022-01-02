
for i in {16..96}; do
    python3 server.py --mech k_rr --cate_num $i --width 100 --epsilon 3.0 --port 50006 --address 127.0.0.1 &
    sleep 1
    python3 client.py --mech k_rr --cate_num $i --width 100 --epsilon 3.0 --port 50006 --address 127.0.0.1 --sensitive_value 9
done