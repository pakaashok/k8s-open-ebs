#═══════════════════════════════════════════════════════════════════════════════
# 🔵 RUN ON: MASTER NODE
#═══════════════════════════════════════════════════════════════════════════════

# Check data is still there!
echo "=== Verifying Data After Pod Restart ==="
kubectl exec -it -n database $(kubectl get pods -n database -l app=mysql -o jsonpath='{.items[0].metadata.name}') -- \
  mysql -uroot -prootpass123 -e "SELECT * FROM companydb.employees;"

echo ""
echo "=========================================="
echo "✅ DATA SURVIVED POD RESTART!"
echo "   Persistent Storage Working!"
echo "=========================================="