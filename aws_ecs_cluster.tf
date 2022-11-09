resource "aws_ecs_cluster" "aws-ecs-cluster" {
  name = "${var.microservice}-${var.cluster_name}"

  tags = {
    Name = "${var.microservice}-ecs"
  }
}

resource "aws_ecs_cluster_capacity_providers" "aws-ecs-cluster" {
  cluster_name = aws_ecs_cluster.aws-ecs-cluster.name

  capacity_providers = [var.capacity_provider]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = var.capacity_provider
  }
}

resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.microservice}-logs"

  tags = {
    Application = var.microservice
  }
}