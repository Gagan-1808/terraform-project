variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "target_group_arn" {}
variable "alb_sg_id" {}
variable "ami_id" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "user_data" {
  default = <<EOT
#!/bin/bash
apt update
apt install -y apache2
systemctl start apache2
systemctl enable apache2

echo "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Welcome | Gagan</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      min-height: 100vh;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      color: #ffffff;
      display: flex;
      flex-direction: column;
    }

    header {
      padding: 20px 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    header h2 {
      font-size: 26px;
      color: #00ffd5;
    }

    nav a {
      color: #ffffff;
      text-decoration: none;
      margin-left: 25px;
      font-size: 16px;
      transition: color 0.3s;
    }

    nav a:hover {
      color: #00ffd5;
    }

    .hero {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 40px;
    }

    .hero h1 {
      font-size: 60px;
      margin-bottom: 20px;
      animation: fadeIn 1.5s ease;
    }

    .hero p {
      font-size: 22px;
      max-width: 700px;
      margin-bottom: 40px;
      opacity: 0.9;
    }

    .buttons a {
      padding: 15px 35px;
      margin: 10px;
      border-radius: 30px;
      text-decoration: none;
      font-size: 18px;
      font-weight: bold;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background: #00ffd5;
      color: #000;
    }

    .btn-primary:hover {
      background: #00c9aa;
    }

    .btn-secondary {
      border: 2px solid #ffffff;
      color: #ffffff;
    }

    .btn-secondary:hover {
      background: #ffffff;
      color: #000;
    }

    footer {
      text-align: center;
      padding: 15px;
      font-size: 14px;
      opacity: 0.7;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 42px;
      }
      nav {
        display: none;
      }
    }
  </style>
</head>

<body>

<header>
  <h2>Gagan</h2>
  <nav>
    <a href="#">Home</a>
    <a href="#">About</a>
    <a href="#">Projects</a>
    <a href="#">Contact</a>
  </nav>
</header>

<section class="hero">
  <h1>Hi, I'm Gagan 👋</h1>
  <p>
    I build, deploy, and scale modern applications using cloud and DevOps technologies.
  </p>
  <div class="buttons">
    <a href="#" class="btn-primary">View Projects</a>
    <a href="#" class="btn-secondary">Contact Me</a>
  </div>
</section>

<footer>
  © 2025 Gagan. All rights reserved.
</footer>

</body>
</html>
" > /var/www/html/index.html
EOT
}

