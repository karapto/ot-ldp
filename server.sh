for i in {1..10}; do
        for j in {1..10}; do
                python3 server.py --mech k_rr --cate_num 16 --width 100 --epsilon $i --port $j --address 172.22.0.3
        done
done

