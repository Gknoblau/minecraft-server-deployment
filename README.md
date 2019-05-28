# minecraft-server-deployment
Deploy a Minecraft Server in AWS using Terrafrom

***Only Pay while you Play!***
- Uses an low cost AWS spot based instance
- Server doesn't run when you aren't playing! 
- Lost cost of ~1 cent an hour!

***Perfect for Playing with Friends!***
- Scalable, robust infrastructure
- Share your personal minecraft IP address with your friends

## Prerequisites 
- :beer: [Brew](https://brew.sh/)
- :cloud: [AWS Account](https://aws.amazon.com/console/)

## Install

#### Terraform
```
brew install terraform 
```

#### AWS Cli
```
brew install awscli
```

## Configure
Ensure that the parameters are set in `variables.tf`

***aws_region***
- Set region we are deploying to
- Pick the [region](https://docs.aws.amazon.com/general/latest/gr/rande.html) closest to you


***availability_zone***
- Set availability zone
- We have to set this due to a limitations in terraform
- https://github.com/terraform-providers/terraform-provider-aws/issues/4869


***instance_type***
- Type of [instance](https://aws.amazon.com/ec2/instance-types/) we will run on
- m5.large seems to be reasonable


***time_limit***
- Set how long you want to play
- Duration is in minutes

***volume_id***
- Volume ID where we will store the peristant data
- We will set this later


## Deploy
#### Create an [AWS Access key](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/)
- Set is as the `default` profile in ~/.aws/credentials

#### Create an [AWS Key Pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair)
- Name it `minecraft`

#### Create a [Volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html)
- 10GB should be fine
- This is where we will store all the persistant data
***volume_id***
- Set the `volume_id` in the `variables.tf` file

#### Initalize Terraform
```
terraform init
```

#### Apply Terraform
```
terraform apply
```
The output will be an IP you can connect to in Minecraft

#### Destroy Terraform
```
terraform destroy
```
To ensure you don't encure additional costs, you can delete the volume that was created manually. This will delete all the data. 
