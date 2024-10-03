## Update Email Addresses

```
UPDATE Employees
SET Email = CONCAT(SUBSTRING_INDEX(Email, '@', 1), '@company.com');
```
