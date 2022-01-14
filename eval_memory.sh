array=(16 100)
for i in {1..10}; do
    for j in ${array[@]}; do
        python3 server.py --mech k_rr --cate_num $j --width 100 --epsilon $i --port 50006 --address 127.0.0.1 &
        python3 client.py --mech k_rr --cate_num $j --width 100 --epsilon $i --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))
    done
done