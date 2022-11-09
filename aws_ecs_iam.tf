resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${var.microservice}-execution-task-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
   Name = "${var.microservice}-iam-role"
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
