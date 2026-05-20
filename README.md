# Parcial-Infraestructura-G01

Infraestructura AWS desplegada con Terraform, pipeline CI/CD y pruebas automatizadas.

## Arquitectura
- VPC con subredes públicas y privadas
- Application Load Balancer
- 2 instancias EC2 con Flask
- RDS PostgreSQL con réplica
- Security Groups por capa

## Tecnologías
- Python + Flask
- Terraform
- GitHub Actions
- k6 (pruebas de carga)
- AWS CloudWatch

## Estructura

├── app/          # API Flask
├── terraform/    # Infraestructura como código
├── tests/        # Pruebas unitarias
├── k6/           # Pruebas de carga
└── .github/      # Pipeline CI/CD

## Cómo desplegar

### 1. Clonar el repo
```bash
git clone https://github.com/juanse-svg/Parcial-Infraestructura-G01.git
cd Parcial-Infraestructura-G01
```

### 2. Configurar variables
```bash
cp terraform/terraform.tfvars.example terraform/terraform.tfvars
# Editar terraform.tfvars con tus credenciales
```

### 3. Desplegar infraestructura 
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 4. Ejecutar prueba de carga
```bash
k6 run -e BASE_URL=http://<ALB_DNS> k6/load_test.js
```

## Endpoints
- `GET /` - Índice
- `GET /health` - Health check
- `GET /api/test` - Test de API
