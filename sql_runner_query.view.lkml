view: sql_runner_query {
  derived_table: {
    sql: SELECT
          orders.id  AS `orders.id`,
          orders.status   AS `orders.status`,
          orders.user_id  AS `orders.user_id`,
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      WHERE (orders.status  ) = 'complete'
      GROUP BY
          1,
          2,
          3
      ORDER BY
          COUNT(*) DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_user_id {
    type: number
    sql: ${TABLE}.`orders.user_id` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [orders_id, orders_status, orders_user_id, orders_count]
  }
}
