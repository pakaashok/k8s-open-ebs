#═══════════════════════════════════════════════════════════════════════════════
# 🔵 RUN ON: MASTER NODE
#═══════════════════════════════════════════════════════════════════════════════

# Show current data
echo "=== Current Data ==="
kubectl exec -it -n database $(kubectl get pods -n database -l app=mysql -o jsonpath='{.items[0].metadata.name}') -- \
  mysql -uroot -prootpass123 -e "SELECT * FROM companydb.employees;"

# Record the pod name
echo ""
echo "=== Current Pod ==="
kubectl get pods -n database -o wide

# DELETE THE POD! (simulates crash)
echo ""
echo "=== 💥 DELETING MySQL Pod ==="
kubectl delete pod -n database -l app=mysql

# Watch pod restart
echo ""
echo "=== Watching Pod Restart ==="
kubectl get pods -n database -w

# Press Ctrl+C when STATUS shows "Running"
