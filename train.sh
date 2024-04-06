set -eu
export PATH="/usr/local/cuda/bin:/opt/conda/bin:/opt/conda/condabin:$PATH"
trap finally EXIT
finally() {
  echo "Exit status: $?"
  shutdown
}

mkdir -p /mnt/result
gcsfuse tanaka-train-result /mnt/result

mkdir -p /mnt/dataset/
mount -o discard,defaults /dev/sdb /mnt/dataset

git clone https://github.com/asterisk-cn/YOLOv8-3D.git
cd YOLOv8-3D

pip install -r requirements.txt

python3 train.py

cp mobilenetv2/* /mnt/result
