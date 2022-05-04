terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  region                  = "us-east-1"

}

module "sagemaker" {
  source  = "SebastianUA/sagemaker/aws"
  version = "1.2.1"
  name        = "TEST"
  environment = "stage"

  # Sagemaker model
  enable_sagemaker_model             = true
  sagemaker_model_name               = "my-sage-model"
  sagemaker_model_execution_role_arn = null

  #sagemaker_model_primary_container = [{
    #image = "167127734783.dkr.ecr.us-east-1.amazonaws.com/sagemaker-sparkml-serving"
  #}]
  sagemaker_model_container = []

  # Sagemaker endpoint config
  enable_sagemaker_endpoint_configuration = true
  sagemaker_endpoint_configuration_name   = ""
  sagemaker_endpoint_configuration_production_variants = [{
    initial_instance_count = 1
    instance_type          = "ml.t2.medium"
    variant_name           = "sage-endpoint-config-1"
  }]

  # Sagemaker endpoint
  enable_sagemaker_endpoint = true
  sagemaker_endpoint_name   = ""

  # Sagemaker notebook instance lifecycle configuration
  enable_sagemaker_notebook_instance_lifecycle_configuration    = true
  sagemaker_notebook_instance_lifecycle_configuration_name      = ""
  sagemaker_notebook_instance_lifecycle_configuration_on_create = null
  sagemaker_notebook_instance_lifecycle_configuration_on_start  = null

  # Sagemaker notebook instance
  enable_sagemaker_notebook_instance        = true
  sagemaker_notebook_instance_name          = ""
  sagemaker_notebook_instance_role_arn      = null
  sagemaker_notebook_instance_instance_type = "ml.t2.medium"

  sagemaker_notebook_instance_subnet_id              = null
  sagemaker_notebook_instance_security_groups        = null
  sagemaker_notebook_instance_kms_key_id             = null
  sagemaker_notebook_instance_direct_internet_access = null


  
  enable_sagemaker_user_profile             = true
  sagemaker_user_profile_name               = "sage-user"
  sagemaker_user_profile_domain_id          = ""
  sagemaker_user_profile_single_sign_on_user_value = null
  sagemaker_domain_auth_mode                = "SSO"
  sagemaker_domain_vpc_id                   = null
  sagemaker_domain_subnet_ids               = null
  #sagemaker_domain_default_user_settings    = {"execution_role": None, "security_groups": None}
  sagemaker_image_role_arn                  = null
  sagemaker_image_version_base_image        = null
  sagemaker_feature_group_role_arn          = null
  sagemaker_feature_group_s3_storage_config = []
  sagemaker_feature_group_security_config   = []
  sagemaker_code_repository_git_config      = []
  sagemaker_app_image_config_kernel_spec    = []
}