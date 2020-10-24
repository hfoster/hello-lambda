module "vpc" {
  source = "github.com/hfoster/terraform-modules.git//aws/vpc"

  vpc_cidr_block = "10.0.0.0/16"
  dns_support    = true
  dns_hostnames  = true
}

module "igw" {
  source = "github.com/hfoster/terraform-modules.git//aws/internet_gateway"

  vpc_id = module.vpc.vpc_id
}

module "private_subnet" {
  source = "github.com/hfoster/terraform-modules.git//aws/subnet"

  public_ip      = false
  vpc_id         = module.vpc.vpc_id
  offset         = "0"
  vpc_cidr       = module.vpc.vpc_cidr
  subnet_newbits = "8"
}

module "public_subnet" {
  source = "github.com/hfoster/terraform-modules.git//aws/subnet"

  public_ip      = true
  vpc_id         = module.vpc.vpc_id
  offset         = "3"
  vpc_cidr       = module.vpc.vpc_cidr
  subnet_newbits = "8"
}

module "ngw" {
  source = "github.com/hfoster/terraform-modules.git//aws/nat_gateway"

  public_subnet_ids = module.public_subnet.subnet_ids
}

module "private_routing" {
  source = "github.com/hfoster/terraform-modules.git//aws/private_routing"

  nat_gateway_ids    = module.ngw.nat_gateway_ids
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.private_subnet.subnet_ids
}

module "public_routing" {
  source = "github.com/hfoster/terraform-modules.git//aws/public_routing"

  vpc_id            = module.vpc.vpc_id
  igw_id            = module.igw.igw_id
  public_subnet_ids = module.public_subnet.subnet_ids
}
