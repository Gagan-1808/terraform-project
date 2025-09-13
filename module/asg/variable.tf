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
  <title>Welcome to Planet</title>
  <style>
    body {
      margin: 0;
      height: 100vh;
      background: linear-gradient(135deg, #1d2b64, #f8cdda);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: #ffffff;
      overflow: hidden;
    }

    h1 {
      font-size: 60px;
      margin: 0;
      animation: fadeIn 2s ease-out;
      text-shadow: 2px 2px 4px rgba(0,0,0,0.4);
    }

    p {
      font-size: 24px;
      margin-top: 15px;
      animation: slideUp 2s ease-out;
    }

    .planet-name {
      color: #00ffcc;
      font-weight: bold;
    }

    @keyframes fadeIn {
      0% { opacity: 0; transform: scale(0.95); }
      100% { opacity: 1; transform: scale(1); }
    }

    @keyframes slideUp {
      0% { opacity: 0; transform: translateY(20px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    .stars {
      position: absolute;
      width: 100%;
      height: 100%;
      background: url('https://raw.githubusercontent.com/JulianLaval/canvas-space/master/images/starfield.png') repeat;
      animation: moveStars 100s linear infinite;
      z-index: -1;
      opacity: 0.3;
    }

    @keyframes moveStars {
      from { background-position: 0 0; }
      to { background-position: 10000px 5000px; }
    }
  </style>
</head>
<body>

  <div class="stars"></div>

  <h1>Welcome to <span class="planet-name" id="planet-name">Planet</span></h1>
  <p>We're glad you landed here.</p>

  <script>
    // Customize the planet name dynamically
    const planetName = "Earth";  // Change this to any planet you like
    document.getElementById("planet-name").textContent = planetName;
  </script>

</body>
</html>
" > /var/www/html/index.html
EOT
}
