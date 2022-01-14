array=(16 100)

for i in ${array[@]}; do
    python3 server.py --mech k_rr --cate_num $i --width 100 --epsilon 10.0 --port 50006 --address 127.0.0.1 &
    python3 client.py --mech k_rr --cate_num $i --width 100 --epsilon 10.0 --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))
done


