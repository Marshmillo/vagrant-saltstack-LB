base:
    'load-balancer':
        - apache
    
    'web-*':
        - apache
    
    'database':
        - postgresql
