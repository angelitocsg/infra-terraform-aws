resource "aws_ecs_task_definition" "pol_task_def" {
  family                   = "${var.microservice}-pol_task_def"
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  container_definitions    = file("task-definitions/service.json")

  tags = {
    Name = "${var.microservice}-ecs-td"
  }
}

resource "aws_ecs_service" "aws-ecs-service" {
  name                 = "${var.microservice}-aws-ecs-service"
  cluster              = aws_ecs_cluster.aws-ecs-cluster.name
  task_definition      = aws_ecs_task_definition.pol_task_def.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true

  network_configuration {
    subnets          = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id, aws_subnet.subnet_c.id]
    assign_public_ip = false
    security_groups = [
      aws_security_group.service_security_group.id,
      aws_security_group.load_balancer_security_group.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "${var.microservice}-application"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.listener]
}