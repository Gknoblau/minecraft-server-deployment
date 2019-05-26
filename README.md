# minecraft-server-deployment
Deploy a Minecraft Server in AWS using Terrafrom

## Prerequisites 
- Brew
- AWS Console Account
    - Create a key value pair https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
    - Name it `minecraft` we will use this later



## Installing

Terraform
```
brew install terraform 
```

AWS Cli
```
brew install awscli
```

## Deployment
First initialize
```
terraform init
```

Then apply
```
terraform apply
```

The output will be an IP you can connect to in Minecraft

When you are done, destroy
```
terraform destroy
```
