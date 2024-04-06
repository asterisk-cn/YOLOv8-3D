set -eu
trap finally EXIT
function finally {
    echo "Exit status: $?"
    shutdown
}

for i in {1..5}
do
   python3 --version
   python3 ./train.py
done

sudo cp mobilenetv2/* /mnt/result
