@echo off
REM ==========================================
REM Enterprise ML Project Folder Structure
REM ==========================================

set PROJECT_NAME=enterprise-ml-platform

mkdir %PROJECT_NAME%

cd %PROJECT_NAME%

mkdir data
mkdir data\raw
mkdir data\bronze
mkdir data\silver
mkdir data\gold
mkdir data\reference

mkdir artifacts
mkdir artifacts\models
mkdir artifacts\metrics
mkdir artifacts\reports
mkdir artifacts\plots
mkdir artifacts\predictions

mkdir notebooks

mkdir configs

mkdir src
mkdir src\components
mkdir src\pipelines
mkdir src\entity
mkdir src\constants
mkdir src\exception
mkdir src\logger
mkdir src\utils
mkdir src\cloud

mkdir api
mkdir api\routes
mkdir api\schemas
mkdir api\services

mkdir mlflow
mkdir mlflow\experiments
mkdir mlflow\model_registry

mkdir monitoring

mkdir deployment
mkdir deployment\docker
mkdir deployment\kubernetes
mkdir deployment\terraform

mkdir ci_cd

mkdir tests
mkdir tests\unit
mkdir tests\integration
mkdir tests\api
mkdir tests\performance

mkdir logs

type nul > notebooks\01_eda.ipynb
type nul > notebooks\02_feature_engineering.ipynb
type nul > notebooks\03_model_experiments.ipynb
type nul > notebooks\04_model_evaluation.ipynb

type nul > configs\config.yaml
type nul > configs\model_config.yaml
type nul > configs\training_config.yaml
type nul > configs\deployment_config.yaml

type nul > src\components\data_ingestion.py
type nul > src\components\data_validation.py
type nul > src\components\data_transformation.py
type nul > src\components\feature_engineering.py
type nul > src\components\model_trainer.py
type nul > src\components\model_evaluation.py
type nul > src\components\model_registry.py

type nul > src\pipelines\training_pipeline.py
type nul > src\pipelines\batch_prediction_pipeline.py
type nul > src\pipelines\realtime_prediction_pipeline.py
type nul > src\pipelines\retraining_pipeline.py

type nul > src\entity\artifact_entity.py
type nul > src\entity\config_entity.py

type nul > src\constants\__init__.py
type nul > src\exception\custom_exception.py
type nul > src\logger\logger.py
type nul > src\utils\common.py
type nul > src\utils\model_utils.py
type nul > src\utils\data_utils.py
type nul > src\cloud\azure_blob.py
type nul > src\cloud\aws_s3.py
type nul > src\cloud\gcs.py

type nul > api\main.py
type nul > api\routes\predict.py
type nul > api\routes\health.py
type nul > api\schemas\request_schema.py
type nul > api\schemas\response_schema.py
type nul > api\services\prediction_service.py

type nul > monitoring\data_drift.py
type nul > monitoring\model_drift.py
type nul > monitoring\performance_monitor.py
type nul > monitoring\alerts.py

type nul > deployment\docker\Dockerfile
type nul > deployment\docker\docker-compose.yml

type nul > deployment\kubernetes\deployment.yaml
type nul > deployment\kubernetes\service.yaml
type nul > deployment\kubernetes\ingress.yaml
type nul > deployment\kubernetes\hpa.yaml

type nul > deployment\terraform\main.tf
type nul > deployment\terraform\variables.tf
type nul > deployment\terraform\outputs.tf

type nul > ci_cd\azure-pipelines.yml
type nul > ci_cd\github-actions.yml
type nul > ci_cd\jenkinsfile

type nul > requirements.txt
type nul > setup.py
type nul > .env
type nul > .gitignore
type nul > README.md
type nul > LICENSE

echo Enterprise ML project folder structure created successfully.
pause