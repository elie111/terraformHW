
# Declare module for internal & internet facing load balancer
module "LoadBalancers" {
  source            = "./LoadBalancers/"
  access_key        = var.access_key    
  secret_key        = var.secret_key    
  region            = var.region        
}

# Declare module for web servers
module "WebServers" {
  source            = "./WebServers"
  instance_name     = "Web-Server" 
  instance_type     = var.instance_type 
  Key_name          = var.key_name      
  access_key        = var.access_key    
  secret_key        = var.secret_key    
  region            = var.region        
  ami               = var.ami           
  shell_script_name = "Web-Servers"
}


# Declare module for application servers
module "ApplicationServer" {
  source            = "./ApplicationServer"
  instance_name     = "App-Server" 
  instance_type     = var.instance_type 
  Key_name          = var.key_name      
  access_key        = var.access_key    
  secret_key        = var.secret_key    
  region            = var.region        
  ami               = var.ami           
  shell_script_name = "Application-Server"
}


# Declare resource for S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
}



resource "aws_db_instance" "myrdsdb" {
  identifier = "mysqldatabase"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  username             = "admin"
  password             = "password" 
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  parameter_group_name = "default.mysql5.7"
  port                 = 3306
  skip_final_snapshot  = true
  multi_az = true
}