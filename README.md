# keptnqualitygates-minkube
This repo will help you in setting up minikube on a GCE instance using terraform.
It will execute the following steps:
1. Create a GCE instance with nested virtualization
1. Install Ubuntu and all required packages
1. Install Minikube v1.2.0 (newer not supported) and start an instance
1. Install Keptn Quality Gates usecase
1. Expose the Keptn API on port 80
1. Expose the Keptn Bridge on port 81

**note: For a fully automated install, the script deploys the latest master of the keptn CLI, as otherwise a creds.json file cannot be supplied in combination with platform=kubernetes.**

## Requirements
To run this script, terraform will provision the following
1. 1 n1-standard-2 GCE instance (2vCores, 7.5GB RAM) with 50GB SSD
1. 1 public IPv4 address attached to the GCE instance
1. 1 firewall rule to open port 80 and 81

## Instructions

1. Prepare Service Account and download JSON key credentials in GCP.

    ```
    https://cloud.google.com/iam/docs/creating-managing-service-accounts
    ```

1. Provision VM
    
    The provisioning of the GCE instance is done via Terraform configurations. Therefore, Terraform has to be installed on the machine of the user that is creating the instance. 
    
    Please note that you need to provide a keypair for creating the bastion host. 

    1. Create key pair
        ```
        ssh-keygen -b 2048 -t rsa -f key
        ```
        Enter through the defaults.
    
    1. Initialize terraform
        ```
        $ terraform init
        ```

    1. Reference the `vars.tf` file for the variables required to deploy the GCE instance. Some default values, such as `instance_size, hostname and serviceaccount_id` won't need to be modified.

       Create your own `tfvars` file outside this repository's root directory (such as `/tmp/provision.tfvars`). Add the required variables and values. For example:
        ***provision.tfvars***
        ```
        gcloud_project    = "myProject" 
        gcloud_zone       = "us-central1-a"
        gcloud_cred_file  = "~/.gcloud/my_key.json" # this file holds your GCP SA key
        ```

    1. Apply the terraform configuration supplying your own vars file. Ensure to enable the Cloud Resource Manager API and the Identity and Access Management (IAM) API in Google Cloud.
        ```
        optional: $ terraform plan -var-file=/tmp/provision_acm.tfvars
        $ terraform apply -var-file=/tmp/provision_acm.tfvars
        ```
    
    1. The GCE ip will be outputed once completed, as well as the keptn api endpoint and API token

1. Log on to the GCE instance

    Once the instance has been fully provisioned, you can log on via ssh supplying your key. The default username is `keptn`, however this is supplied as a variable and can be overwritten.
    ```
    $ ssh -i key keptn@xxx.xxx.xxx.xxx
    ```
