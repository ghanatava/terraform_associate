variable "db_username" {
    description = "Database administrator name"
    type = string
    sensitive = true 
}

variable "db_password" {
    description = "Database administrator password"
    type = string
    sensitive = true
}
