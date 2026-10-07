# Criterio técnico

## 1. Cloud Run o GKE

Para este servicio usaría Cloud Run. Es una API sin estado y el tráfico va a concentrarse en horario laboral, así que le veo más sentido a una plataforma que escale según la demanda. Tampoco hay que administrar nodos ni preparar un clúster para que el equipo pueda desplegar.

Me pasaría a GKE si apareciera alguna necesidad que Cloud Run no cubra bien, como sidecars, una red más específica o varias cargas que convenga operar juntas. También lo pensaría si el uso se mantiene alto todo el día y el costo de nodos termina siendo menor, o si el equipo ya trabaja sobre una plataforma Kubernetes.

## 2. Cómo medir un pipeline

Revisaría si la rama principal se mantiene estable. Esperaría una tasa de éxito de al menos 95% y que la ejecución completa tarde menos de 10 minutos. Si un fallo llega a producción, quisiera poder recuperarlo en menos de 30 minutos. También vería cuántos despliegues terminan en rollback y me preocuparía si pasan del 5%.

No me quedaría solo con el tiempo total. Separaría los fallos de validación, seguridad, construcción y despliegue para saber dónde se está yendo el tiempo. Si los escaneos están puestos pero se ignoran o se saltan para poder sacar un cambio, no lo tomaría como un buen pipeline aunque termine rápido.

## 3. Cloud SQL sin exposición pública

Conectaría Cloud Run a la IP privada de Cloud SQL usando Serverless VPC Access o Direct VPC egress. La aplicación usaría una cuenta de servicio propia y las credenciales saldrían de Secret Manager. El acceso quedaría limitado por IAM y por las reglas de firewall necesarias.

No usaría una IP pública con direcciones permitidas. Cloud Run puede cambiar sus direcciones de salida y esa lista termina siendo otra cosa que hay que mantener. Además la base queda expuesta a internet aunque el acceso esté restringido.
