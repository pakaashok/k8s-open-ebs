#═══════════════════════════════════════════════════════════════════════════════
# 🔵 RUN ON: MASTER NODE
#═══════════════════════════════════════════════════════════════════════════════

# Create test database and insert data
echo "=== Creating Test Data in MySQL ==="
kubectl exec -it -n database $(kubectl get pods -n database -l app=mysql -o jsonpath='{.items[0].metadata.name}') -- \
  mysql -uroot -prootpass123 -e "
    CREATE DATABASE IF NOT EXISTS companydb;
    USE companydb;
    
    CREATE TABLE IF NOT EXISTS employees (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        department VARCHAR(50),
        salary DECIMAL(10,2),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
    INSERT INTO employees (name, department, salary) VALUES 
        ('John Doe', 'Engineering', 75000.00),
        ('Jane Smith', 'Marketing', 65000.00),
        ('Bob Wilson', 'Sales', 55000.00),
        ('Alice Brown', 'Engineering', 80000.00),
        ('Charlie Davis', 'HR', 60000.00);
    
    SELECT * FROM employees;
  "

echo ""
echo "✅ Test data created!"