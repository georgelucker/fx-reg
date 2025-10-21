# Kubernetes Dashboard Authentication

Helm-чарт для создания ServiceAccount и токена для авторизации в Kubernetes Dashboard.

## Описание

Этот чарт создаёт необходимые ресурсы для авторизации в Kubernetes Dashboard:
- **ServiceAccount** — учётная запись для входа
- **ClusterRoleBinding** — привязка прав (по умолчанию cluster-admin)
- **Secret** — токен для авторизации

## Требования

- Kubernetes 1.19+
- Helm 3.0+
- Установленный Kubernetes Dashboard


## Параметры конфигурации

| Параметр | Описание | Значение по умолчанию |
|----------|----------|----------------------|
| `serviceAccount.name` | Имя ServiceAccount | `admin-user` |
| `serviceAccount.namespace` | Namespace Dashboard | `kubernetes-dashboard` |
| `clusterRoleBinding.name` | Имя ClusterRoleBinding | `dashboard-admin-user` |
| `clusterRoleBinding.clusterRole` | ClusterRole для привязки | `cluster-admin` |
| `secret.create` | Создать Secret с токеном | `true` |
| `secret.name` | Имя Secret | `admin-user-token` |
| `readOnly.enabled` | Создать read-only пользователя | `false` |

## Примеры использования

### Установка с кастомным именем

```
helm install my-dashboard-auth fx-reg/k8s-dashboard-auth
--set serviceAccount.name=my-admin
--set secret.name=my-admin-token
```

### Создание read-only пользователя

```
helm install dashboard-viewer fx-reg/k8s-dashboard-auth
--set readOnly.enabled=true
--set serviceAccount.name=viewer-user
```


## Получение токена

После установки получите токен для входа:
```
kubectl -n kubernetes-dashboard get secret admin-user-token -o jsonpath='{.data.token}' | base64 -d; echo

```
