PYTHONPATH=.. python eval.py --dataset 7Scenes --scene chess --model posenet \
--weights ../weights.pth \
--config_file configs/posenet.ini --val \
--import_file ../chess-train.json
    # --pose_graph