array_scale=(4 16 63 250)

for i in {1..10}; do
        for j in ${array_scale[@]}; do
                python3 server.py --mech k_rr --cate_num $j --width 10000 --epsilon $i --port 50006 --address 127.0.0.1 &
                sleep 20
                python3 client.py --mech k_rr --cate_num $j --width 10000 --epsilon $i --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))
                sleep 20
        done
done
