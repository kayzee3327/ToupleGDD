# Problems

1. 原来的模型目标是找出top-k的节点，我们的目标是让网络瓦解，暂定找出top-100节点构成序列
2. 推理速度很慢
3. ~~我们的数据集边太多，似乎在针对稀疏图的模型中运行不了~~ (后续发现是该模型对输入图有要求，节点编号必须是从0开始的整数)

# Usage

``` shell
python main.py --graph flight_delay_data --model Tripling --model_file tripling.ckpt --budget 100 --test --dismantle
```