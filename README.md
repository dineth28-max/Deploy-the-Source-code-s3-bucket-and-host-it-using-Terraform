
# AWS Web Application using Terraform

This is a **university project** where I built a **web application infrastructure on AWS** using **Terraform**.  

The project shows how to create a **highly available web application** with automated setup.
## Architecture 
<img width="1183" height="665" alt="Screenshot 2026-02-02 082359" src="https://github.com/user-attachments/assets/dc4dec2c-a1c0-4cb7-ac56-ef5b47b5c0bc" />

---

## What This Project Does

- Creates a **VPC** with public subnets across multiple availability zones.  
- Launches **EC2 instances** (Ubuntu and Linux) to run the web application.  
- Sets up an **Application Load Balancer (ALB)** to distribute traffic to the EC2 instances.  
- Uses an **S3 bucket** to store website files (HTML, CSS, JS, and other assets).  
- Configures **IAM roles and security groups** for secure access.  
- Automates the entire infrastructure using **Terraform**.

---

## How Users Can Access the Website

After deploying the project, Terraform will output the **ALB DNS name**.  

Users can access the website by opening this **ALB DNS URL** in a browser:  


