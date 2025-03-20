# A view can be created as well

# Revenue  & Claims Snapshot
SELECT 
    submission_date,
    insurance_provider,
    COUNT(*) AS total_claims,
    ROUND(SUM(CASE WHEN claim_status IN ('Approved', 'Paid') THEN amount ELSE 0 END),2) AS Collected,
    ROUND(SUM(CASE WHEN claim_status = 'Pending' THEN amount ELSE 0 END), 2) AS Pending,
    COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) AS Denied
FROM claims
GROUP BY submission_date, insurance_provider
ORDER BY submission_date DESC
;

# Revenue by provider on approved and pending claims
SELECT insurance_provider, ROUND(SUM(amount),2) as Revenue
FROM claims
WHERE claim_status IN ('Approved', 'Paid')
GROUP BY insurance_provider
ORDER BY Revenue DESC
;

# Total revenue from approved and paid claims
SELECT ROUND(SUM(amount), 2) as Total_Revenue
FROM claims
WHERE claim_status IN ('Approved', 'Paid')
;

