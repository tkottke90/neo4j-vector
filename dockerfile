FROM neo4j:2025.07-community

ENV NEO4J_PLUGINS=["apoc"]
ENV NEO4J_apoc_export_file_enabled=true
ENV NEO4J_apoc_import_file_enabled=true
ENV NEO4J_apoc_import_file_use__neo4j__config=true
ENV NEO4J_dbms.security.procedures.allowlist=apoc.meta.data
ENV NEO4J_dbms_security_procedures_unrestricted=apoc.meta.data

COPY modules/* /var/lib/neo4j/plugins/

ENTRYPOINT ["tini", "-g", "--","/startup/docker-entrypoint.sh"]
CMD ["neo4j"]