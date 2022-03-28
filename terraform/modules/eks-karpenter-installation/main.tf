resource "helm_release" "karpenter" {
  depends_on       = [var.kubeconfig]
  namespace        = "karpenter"
  create_namespace = true

  name       = "karpenter"
  repository = "https://charts.karpenter.sh"
  chart      = "karpenter"
  version    = var.karpenter_version
  verify     = true

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = var.iam_assumable_role_karpenter_iam_role_arn
  }

  set {
    name  = "controller.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "controller.clusterEndpoint"
    value = var.cluster_endpoint
  }
  
    set {
    name  = "aws.defaultInstanceProfile"
    value = var.instance_profile
  }
  
}
