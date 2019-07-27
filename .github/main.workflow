workflow "k8s image sync" {
  resolves = ["sync"]
  on = "schedule(*/2 * * * *)"
}

action "docker login" {
  uses = "actions/docker/login@master"
  secrets = [
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD",
  ]
}

action "sync" {
  uses = "maguowei/actions/k8s-image-sync@master"
  env = {
    REGISTRY = "gotok8s"
    KUBERNETES_VERSION = "v1.14.3"
  }
  needs = ["docker login"]
}
