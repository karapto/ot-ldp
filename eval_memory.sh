array_grid=(4 16 63 250)
array_window=(100 1000 10000)

for k in ${array_window[@]}; do
        for i in {1..10}; do
                for j in ${array_grid[@]}; do
                        python3 server.py --mech k_rr --cate_num $j --width $k --epsilon $i --port 50006 --address 127.0.0.1 &
                        sleep 10
                        python3 client.py --mech k_rr --cate_num $j --width $k --epsilon $i --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))
                        sleep 10
                done
        done
done