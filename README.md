# step-project-3
### 1. Using module https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest create your VPC. Add tags with next fields: Owner:, CreatedBy:, Purpose:step3.
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-25-14.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-25-27.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-25-37.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-25-45.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-27-12.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-27-44.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-28-52.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-29-29.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-29-43.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-30-31.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-31-19.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-32-08.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-32-13.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-32-23.png>)
![alt text](<screenshots/1/Знімок екрана з 2024-06-02 19-32-29.png>)


### 2. Wrote terraform code which will create 3 ec2 with docker installed. Also it should add your public ssh key to ec2. So when you create ec2 with this module you can connect to it with command: ssh YOUR_USER@IP
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-11-51.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-12-14.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-12-59.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-13-31.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-14-09.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-15-40.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-15-49.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-16-30.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-16-53.png>)
![alt text](<screenshots/2/Знімок екрана з 2024-06-02 22-17-03.png>)


### 3. Write terraform code which will create load balancer.
![alt text](<screenshots/3/Знімок екрана з 2024-06-02 23-42-23.png>)
![alt text](<screenshots/3/Знімок екрана з 2024-06-02 23-42-39.png>)
![alt text](<screenshots/3/Знімок екрана з 2024-06-02 23-42-54.png>)


### 4. Add to this balancer only first ec2 instance, it will contain Prometheus and Grafana
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-22-01.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-29-08.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-36-59.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-37-14.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-37-25.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-37-48.png>)
![alt text](<screenshots/4/Знімок екрана з 2024-06-03 02-38-01.png>)


### 5. Write terraform code to generate ansible inventory file for the next step
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-41-55.png>)
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-42-26.png>)
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-43-21.png>)
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-47-14.png>)
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-47-46.png>)
![alt text](<screenshots/5/Знімок екрана з 2024-06-03 13-50-05.png>)


### 6. Using article: https://www.padok.fr/en/blog/prometheus-monitoring-ansible deploy software on these 3 ec2 instances automatically from terraform.
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 22-55-32.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 22-56-58.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 22-58-49.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 23-04-31.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 23-05-56.png>)


### As a result you must be able to connect to Grafana via DNS name of LB from step 3, go to dashboard and see there 3 hosts metrics.
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 22-59-39.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 22-59-48.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 23-00-48.png>)
![alt text](<screenshots/6/Знімок екрана з 2024-06-04 23-01-24.png>)