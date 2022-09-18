#In terrform, you need to crate a ssh key first and copy the content of public-key
# in public key argument

resource "aws_key_pair" "key" {
  key_name   = "MyKey"
  public_key = file("/home/shahab/terraform/key.pub")

}


