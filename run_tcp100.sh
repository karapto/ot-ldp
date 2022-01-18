array_scale=(4 20)

for i in {1..10}; do
        for j in ${array_scale[@]}; do
                python3 server.py --mech k_rr --cate_num $j --width 100 --epsilon $i --port 50006 --address 127.0.0.1 &
                sleep 10
                python3 client.py --mech k_rr --cate_num $j --width 100 --epsilon $i --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))
                sleep 10
        done

