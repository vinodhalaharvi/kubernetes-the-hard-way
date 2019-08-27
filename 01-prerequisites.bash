function switch_to_kubernetes_the_hard_way() {
    gcloud container clusters get-credentials devstagingcluster1  --zone us-east4-a  --project gs-dev-staging
    gcloud config set project gs-dev-staging
    gcloud config set compute/zone us-east4-a
    gcloud config set compute/region us-east4
}

switch_to_kubernetes_the_hard_way
