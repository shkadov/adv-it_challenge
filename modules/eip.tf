resource "aws_eip" "current" {
  vpc = true
}

resource "aws_eip_association" "current" {
  allocation_id        = aws_eip.current.id
  network_interface_id = aws_network_interface.current.id
  depends_on           = [aws_autoscaling_group.current]
}