#═══════════════════════════════════════════════════════════════════════════════
# 🔵 RUN ON: MASTER NODE
#═══════════════════════════════════════════════════════════════════════════════

# Find which node MySQL is running on
echo "=== MySQL Pod Location ==="
kubectl get pods -n database -o wide

# Get PV details (shows path on worker node)
echo ""
echo "=== Persistent Volume Details ==="
kubectl get pv

# Get detailed path
echo ""
echo "=== Volume Path on Worker Node ==="
kubectl get pv $(kubectl get pvc mysql-pvc -n database -o jsonpath='{.spec.volumeName}') -o jsonpath='{.spec.local.path}'
echo ""