Terraform Project:

Creating Infrastructure on AWS using Terraform.

![MicrosoftTeams-image (9)](https://user-images.githubusercontent.com/84583290/225919953-5d05a10d-01f2-4793-aab3-34525b094c86.png)

High level overview:
  1. 3 AZs in VPC
  2. 3 Tier setup :- Web, App, Database
  3. Running phpMyAdmin
  
  
Practice followed while creating the architecture:
  1. Using Modules.
  2. Use data instead of variables wherever possible
  3. Proper naming conventions
  4. Make use of best practices

We are using Route 53 to route domain traffic to an Application Load Balancer(ALB) and route traffic from EC2 instances to RDS.

Final Result should look like this👇

<img width="925" alt="1" src="https://user-images.githubusercontent.com/84583290/225923942-2645c578-3120-4e94-aa0f-7631e1f5708d.png">

![MicrosoftTeams-image (10)](https://user-images.githubusercontent.com/84583290/225924016-f7c908cd-328d-423b-b85b-7ba380ecc766.png)
