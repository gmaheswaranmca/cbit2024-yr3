SQL - RDBMS 
    standard SQL : ANSI SQL 
    SQL in every RDBMS = ANSI SQL + vendor specific cmds 
    examples:
        SQL Server: (T-SQL = ANSI SQL + vendor specific cmds)
        Oracle: (PL/SQL  = ANSI SQL + vendor specific cmds)
        MySQL: 
        POSTGRES:
    foundation: table / rows

    stable: 100% - proved system 

noSQL "high availability"       99.999999% HA
    mongo db - app dev | ML/DL/AI | infra / deployment 
        foundation: collection / documents 
        "document based no sql"

        n ot 
        o nly 
        sql  

        "hierarchical model"    - order{ address: {...}, 
                                         date:, num: ..., 
                                         items: [{item_id, qty, price},{...},...]}

        "normalized model"      - order {id, address_id, date, num} order_item, 
                                   order_addresses {id, order_id, addr_line1, ....}
                                   order_items {id, order_id, item_id, qty, price}

        shrads - shrading - to make the larger data sets into many server instances 
               - horizontal scaling 
        scaling : replicas #4 "master 1 - childs 3" - load balancers of the server / cloud 
    cassandra "peer-to-peer"      100% HA      
        Cassndra QL - CQL (seems SQL / not exactly SQL)
        it does not use: normalization, no references 
        uses: denormalization 

desc employees;
desc departments;
desc leaves;
desc salaries;

select * from salaries;
select * from departments;
select * from leaves;
select * from salaries;

















        

    