httpd:
    pkg.installed:
      - name: httpd

httpd Service:
    service.running:
        - name: httpd
        - enable: True
        - require:
            - pkg: httpd


