view: sql_runner_query {
  derived_table: {
    sql: SELECT
          orders.status  AS `orders.status`,
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      GROUP BY
          1
      ORDER BY
          COUNT(*) DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [orders_status, orders_count]
  }
}
