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

