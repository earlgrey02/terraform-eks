## AWS EKS with Terraform

> **Terraform으로 구축해보는 AWS EKS(Elastic Kubernetes Service)**

이 레포지토리는 대표적인 코드형 인프라(Infrastructure as Code, IaC) 도구인 Terraform을 통해 AWS EKS의 Kubernetes 클러스터를 구축한 예제이다.<br />
추가로 DRY(Don't Repeat Yourself) 원칙을 위해 Terragrunt를 도입해서 환경마다 `provider.tf` 등의 코드가 중복되지 않도록 했다.

## How to use

dev 환경 기준으로 배포되는 아키텍처는 다음과 같다.

![dev](https://github.com/user-attachments/assets/ffaa89e2-84cb-469d-81ec-cdbf3de79e97)

```sh
> git clone https://github.com/earlgrey02/terraform-eks
> cd terraform-eks
```

```sh
> cd env/dev
> terragrunt init
```

우선 환경별 디렉토리 내의 최상위에 있는 `terragrunt.hcl`을 통해 `terraform.tfstate`를 저장할 AWS S3(Simple Storage Service) 백엔드를 미리 생성해야 한다.

```sh
terragrunt run-all plan
terragrunt run-all apply
```

그 다음, 모든 하위 디렉토리의 `terragrunt.hcl`을 배포하면 VPC와 해당 VPC에 속한 EKS 클러스터를 배포하게 된다.<br />
만약 Terraform으로 프로비저닝(Provisioning)한 모든 리소스를 삭제하고 싶다면 `terragrunt run-all destroy`를 사용하면 된다.
