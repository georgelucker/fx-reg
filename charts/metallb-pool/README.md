```markdown
# MetalLB Address Pool

Helm-чарт для конфигурации MetalLB с использованием CRD (Custom Resource Definitions).

## Описание

Этот чарт создаёт необходимые ресурсы MetalLB для работы LoadBalancer в bare-metal Kubernetes кластерах:
- **IPAddressPool** — определяет пул IP-адресов для выдачи LoadBalancer сервисам
- **L2Advertisement** — настраивает анонсирование IP-адресов через протокол Layer 2 (ARP)

## Требования

- Kubernetes 1.19+
- Helm 3.0+
- MetalLB 0.13+ установленный в кластере (с поддержкой CRD API)

## Установка

### Добавление репозитория

```
helm repo add metallb-pool https://georgelucker.github.io/fx-reg/
helm repo update
```

### Установка чарта

```
helm install my-metallb-pool metallb-pool/metallb-pool
```

### Установка с кастомными значениями

```
helm install my-metallb-pool metallb-pool/metallb-pool \
  --set ipAddressPool.address="192.168.1.100-192.168.1.150" \
  --set ipAddressPool.namespace="metallb-system"
```

## Параметры конфигурации

### IPAddressPool

| Параметр | Описание | Значение по умолчанию |
|----------|----------|----------------------|
| `ipAddressPool.name` | Имя пула IP-адресов | `first-pool` |
| `ipAddressPool.namespace` | Namespace для ресурса | `metallb-system` |
| `ipAddressPool.address` | Диапазон IP-адресов (CIDR или range) | `192.168.1.240-192.168.1.250` |
| `ipAddressPool.autoAssign` | Автоматическое назначение адресов из пула | `true` |

### L2Advertisement

| Параметр | Описание | Значение по умолчанию |
|----------|----------|----------------------|
| `l2Advertisement.name` | Имя L2Advertisement | `example` |
| `l2Advertisement.namespace` | Namespace для ресурса | `metallb-system` |

### Несколько диапазонов IP

Для создания нескольких пулов установите чарт несколько раз с разными release именами:

```
helm install pool-1 metallb-pool/metallb-pool -f pool1-values.yaml
helm install pool-2 metallb-pool/metallb-pool -f pool2-values.yaml
```


## Документация MetalLB

- [Официальная документация MetalLB](https://metallb.universe.tf/)
- [IPAddressPool спецификация](https://metallb.universe.tf/configuration/#defining-the-ips-to-assign-to-the-load-balancer-services)
- [L2Advertisement конфигурация](https://metallb.universe.tf/configuration/#layer-2-configuration)

## Поддержка

Если у вас возникли вопросы или проблемы, пожалуйста, создайте issue в [GitHub репозитории](https://github.com/georgelucker/fx-reg).
```
