
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
--
## Web Application
<img width="1919" height="969" alt="Screenshot 2026-01-28 115935" src="https://github.com/user-attachments/assets/192b45e3-4451-4bd7-b515-7e8e2fc3382f" />
<img width="1919" height="974" alt="Screenshot 2026-01-28 115947" src="https://github.com/user-attachments/assets/ddb8cec2-941d-4b36-9ba9-0832d3288829" />
<img width="1919" height="958" alt="Screenshot 2026-01-28 120000" src="https://github.com/user-attachments/assets/fe521e02-9dcf-41a0-8aed-c2d85dbc3857" />
<img width="1919" height="986" alt="Screenshot 2026-01-28 120011" src="https://github.com/user-attachments/assets/a18b3810-31c6-4c0d-89f0-eb3744628768" />





