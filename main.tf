# Configure the AWS Provider
provider "aws" {
  profile = "personal"
  region  = "us-east-1"
}

resource "aws_ecr_repository" "test" {
  name                 = "test"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# resource "aws_ecs_task_definition" "test" {
#   family                = "test"
#   container_definitions = <<TASK_DEFINITION
#   [
#     {
#         "cpu": 10,
#         "command": ["sleep", "10"],
#         "entryPoint": ["/"],
#         "environment": [
#             {"name": "VARNAME", "value": "VARVAL"}
#         ],
#         "essential": true,
#         "image": "jenkins",
#         "memory": 128,
#         "name": "jenkins",
#         "portMappings": [
#             {
#                 "containerPort": 80,
#                 "hostPort": 8080
#             }
#         ],
#           "resourceRequirements":[
#               {
#                   "type":"InferenceAccelerator",
#                   "value":"device_1"
#               }
#           ]
#     }
#   ]
#   TASK_DEFINITION
# 
#   inference_accelerator {
#     device_name = "device_1"
#     device_type = "eia1.medium"
#   }
# }

# resource "aws_ecs_service" "test" {
#   name            = "some-server"
#   task_definition = "${aws_ecs_task_definition.mongo.arn}"
# 
#   ordered_placement_strategy {
#     type  = "binpack"
#     field = "cpu"
#   }
# 
#   load_balancer {
#     target_group_arn = "${aws_lb_target_group.foo.arn}"
#     container_name   = "mongo"
#     container_port   = 8080
#   }
# 
#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
#   }
# }


