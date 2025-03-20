# Denial Breakdown

# How many denials
SELECT COUNT(*)
FROM claims
WHERE claim_status = 'Denied'
;

# How many denials by reason
SELECT denial_reason, COUNT(*) AS total_denials
FROM claims
WHERE claim_status = 'Denied'
GROUP BY denial_reason
ORDER BY total_denials DESC
;

#Denials by provider
SELECT insurance_provider, COUNT(*) AS total_denials
FROM claims
WHERE claim_status = 'Denied'
GROUP BY insurance_provider
ORDER BY total_denials DESC
;

#Denial Rate
SELECT ROUND(COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) * 100 / COUNT(*), 2) AS Denial_Rate
FROM claims
;