#═══════════════════════════════════════════════════════════════════════════════
# 🔵 RUN ON: MASTER NODE
#═══════════════════════════════════════════════════════════════════════════════

# Check provisioner pod is running
echo "=== OpenEBS Pod Status ==="
kubectl get pods -n openebs

# Check StorageClass exists
echo ""
echo "=== StorageClass ==="
kubectl get sc

# Check leader election endpoint was created
echo ""
echo "=== Leader Election Endpoint ==="
kubectl get endpoints -n openebs

echo ""
echo "=========================================="
echo "✅ OpenEBS is READY! Let's deploy MySQL!"
echo "=========================================="