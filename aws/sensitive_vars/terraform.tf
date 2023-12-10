terraform{
    cloud {
        organization = "ghanatava"
    
        workspaces {
            name = "sensitive_variables"
        }
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.4.0"
        }
    }

    required_version = ">=1.2"
}