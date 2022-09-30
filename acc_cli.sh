array_scale={50006..50106}

for i in {1..10}; do
        for j in ${array_scale[@]}; do
		python3 client.py --mech k_rr --cate_num 16 --width 1000 --epsilon $i --port 50006 --address 127.0.0.1 --sensitive_value $(( $RANDOM % $i ))        
	done
done

