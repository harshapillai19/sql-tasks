
--1a
SELECT p.[Name] as PropertyName,
       p.[Id]   as PropertyId
FROM [dbo].[Property] p LEFT JOIN [dbo].[OwnerProperty] po
ON p.[Id] = po.[PropertyId]
WHERE po.[OwnerId] = 1426

--1b
SELECT p.[Id]   as PropertyId,
       p.[Name] as PropertyName,   
	   pf.[CurrentHomeValue] HomeValue,
	   po.[OwnerId] as OwnerId
FROM [dbo].[OwnerProperty] po RIGHT JOIN [dbo].[Property] p 
ON po.[PropertyId] = p.[Id] LEFT JOIN [dbo].[PropertyFinance] pf
ON p.[Id] = pf.[PropertyId]
WHERE po.[OwnerId] = 1426

--1c



--1d

SELECT j.[Id] as JobID, 
       j.[PropertyId], 
	   j.[JobDescription], 
       j.[JobStartDate],
	   j.[JobEndDate],
	   js.[Status]
FROM [dbo].[Job] j INNER JOIN [dbo].[JobStatus] js
ON j.[JobStatusId] = js.[Id]
WHERE j.[JobStatusId] IN (1,2,3)

--1e

SELECT  p.[Id]   as PropertyId,
        p.[Name] AS PropertyName,
        pe.[FirstName] +''+ISNULL(pe.[MiddleName],'')+''+ISNULL(pe.[LastName],'') as TenantName, 
	    pr.[Amount] AS RentalAmount,
	    pf.[Code] AS PaymentFrequency,
		pr.[Date] AS PaymentDate
FROM dbo.[Property] p LEFT JOIN [dbo].[OwnerProperty] op
ON p.[Id] = op.[PropertyId]  INNER JOIN [dbo].[TenantProperty] tp
ON op.[PropertyId] = tp.[PropertyId] INNER JOIN [dbo].[Person] pe
ON tp.[TenantId] = pe.[Id] INNER JOIN [dbo].[PropertyRentalPayment] pr
ON p.[Id] = pr.[PropertyId] INNER JOIN [dbo].[TenantPaymentFrequencies] pf
ON pr.[FrequencyType] = pf.[Id]
WHERE op.[OwnerId] = 1426  


