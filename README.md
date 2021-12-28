# cloudgeeks.ca

##### https://www.youtube.com/c/AWSLinuxWindows

### Backend ###
##### S3


##### Create S3 Bucket with Versioning enabled

```console

aws s3api create-bucket --bucket cloudgeeks-terraform --region us-east-1

aws s3api put-bucket-versioning --bucket cloudgeeks-terraform --versioning-configuration Status=Enabled

```

##### Key Pair

```console
if [ -d /root/.ssh ]
then
echo "/root/.ssh exists"
else
mkdir -p /root/.ssh
fi

if [ -f /root/.ssh/*.pem ]
then
echo "pem is there, I am removing it"
rm -f ~/.ssh/*.pem
export SSH_KEY_NAME="terraform-cloudgeeks-eks"
aws ec2 create-key-pair --key-name "${SSH_KEY_NAME}" --query 'KeyMaterial' --output text > ~/.ssh/${SSH_KEY_NAME}.pem
else
echo "All is well, now I am creating fresh PEM"
export SSH_KEY_NAME="terraform-cloudgeeks"
aws ec2 create-key-pair --key-name "${SSH_KEY_NAME}" --query 'KeyMaterial' --output text > ~/.ssh/${SSH_KEY_NAME}.pem
fi
```

##### KubeConfig
```console
if [ -d /root/.kube ]
then
echo "/root.kube directory exists"
else
mkdir /root/.kube && touch /root/.kube/config
fi
```

##### Source

```console
source EKS.env

```

##### Metrics Server Installation
```console
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
