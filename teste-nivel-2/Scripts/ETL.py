import psycopg2
  
conn = psycopg2.connect(database="teste-nivel-2",
                        user='root', password='root', 
                        host='172.17.0.1', port='5432'
)
  
conn.autocommit = True
cursor = conn.cursor()
                    
sql = '''COPY person
FROM 'person.person.csv'
DELIMITER ','
CSV HEADER;'''

cursor.execute(sql)

sql2 = '''COPY product
FROM 'production.product.csv'
DELIMITER ','
CSV HEADER;'''

cursor.execute(sql2)

sql3 = '''COPY costumer
FROM 'sales.costumer.csv'
DELIMITER ','
CSV HEADER;'''

cursor.execute(sql3)

sql4 = '''COPY salesorderdetail
FROM 'Sales.SalesOrderDetail.csv'
DELIMITER ','
CSV HEADER;'''

cursor.execute(sql4)

sql5 = '''COPY salesorderheader
FROM 'Sales.SalesOrderHeader.csv'
DELIMITER ','
CSV HEADER;'''

cursor.execute(sql5)