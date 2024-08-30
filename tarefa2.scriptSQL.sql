%hive

-- Criar a tabela consolidada
CREATE TABLE consolidated_data AS
SELECT 
    p.client_id,
    SUM(p.price * p.amount * p.discount_applied) AS total_price,
    -- Local mais utilizado para compras
    COALESCE(
        MAX(CASE WHEN p.purchase_location = 'website' THEN 'website' END),
        MAX(CASE WHEN p.purchase_location = 'app' THEN 'app' END),
        MAX(CASE WHEN p.purchase_location = 'store' THEN 'store' END)
    ) AS most_purchase_location,
    -- Primeira compra
    MIN(p.purchase_datetime) AS first_purchase,
    -- Última compra
    MAX(p.purchase_datetime) AS last_purchase,
    -- Campanha mais recebida
    COALESCE(
        MAX(CASE WHEN c.id_campaign IS NOT NULL THEN c.id_campaign END),
        'No Campaign'
    ) AS most_campaign,
    -- Quantidade de campanhas com status "error"
    SUM(CASE WHEN c.return_status = 'error' THEN 1 ELSE 0 END) AS quantity_error,
    -- Data atual formatada como YYYY-MM-DD
    CURRENT_DATE() AS date_today,
    -- Data atual formatada como MMYYYY
    CAST(DATE_FORMAT(CURRENT_DATE(), 'MMyyyy') AS INT) AS anomes_today
FROM 
    purchase p
LEFT JOIN 
    campaign c
ON 
    p.client_id = c.client_id
GROUP BY 
    p.client_id