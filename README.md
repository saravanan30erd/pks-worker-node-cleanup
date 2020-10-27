# pks-worker-cleanup

## Clean the unused docker images in PKS worker nodes

Log into the Jump server,

1. First find the deployment ID for the cluster
```
    bosh vms
```

2. Run the script with deployment ID
```
    chmod +x worker-cleanup.sh
    ./worker-cleanup.sh <deployment ID>

    Example:

    ./worker-cleanup.sh service-instance_52b6de9a-f7g6-34rf-4g5h-5b981ec04207
```
