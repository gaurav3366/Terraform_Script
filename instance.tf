//creating ssh key
resource "aws_key_pair" "key_terra" {
  key_name = "key_terra"
  //public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGCyPVtl6BQFblWRpNCNUdu21798zaA2SCKEIzckF6cdGGqieDT2FK9Q7npPrntlqM9VwrD89tfoqBl97YjddNJOc4V2P+dzROetvzNTEp2kw4GSBte3Yg9iapWBkjc+nFxpCoK8/CKFtEHKdCoXkln2Lov8icK4XNAdGkTmfQIVFCVjrJOZqpsR5Cc71ZL3ea2uo20hs5l+uOBdruKB2jd+2EYO2ikqWlE9UsKAgXx/28Bn23edlednp9MgHRN6fPeVdh7vo3p8R3WrO9RWZxzyNb39jLrT0IFKHnTrWXakA7ehC2h5Bcd/T/pWUXAvl1XjcqFfzTZsJLAuJcF9kozZsBa5yM00Hs/QsZomVOD62uGfvuBXNlh/EKQiBFzNdCgws00aIFwfgqJzWMwmA/Xcd9pIMG+zeem83D0i/grmJXTAn+m50lCceo+AmP1yvSccqWECb23GsxbVDoDOUCoPOTRHBMflEkijqvDurQgkgDvNdHs60BnuKHBSiCzTU= gauravrai@Gauravs-Macbook.local"

  // here we will read the public key from id_rsa_pub by using file function which take two arguments where path.module used to show the directory and /id_rsa.pub content is viewed there.
  public_key = file("${path.module}/id_rsa.pub")
}

// here we will print the key name
/* output "print_keyname"{
 value = "${aws_key_pair.key_terra.key_name}"
} */

resource "aws_instance" "test_terraform_server" {
  ami           = "ami-0763cf792771fe1bd"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.key_terra.key_name}"
  tags = {
    Name = "terraform_server"
  }
}