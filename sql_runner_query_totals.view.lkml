view: sql_runner_query_totals {
  derived_table: {
    sql: -- Did not use orders::rollup__status; it does not include the following fields in the query: orders.count
      SELECT(SELECT
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      LIMIT 1) AS 'Totals',
          orders.id  AS `orders.id`,
          orders.status  AS `orders.status`,
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      GROUP BY
          1,
          2
      ORDER BY
          COUNT(*) DESC
      LIMIT 500

      -- sql for creating the total and/or determining pivot columns
      -- Did not use orders::rollup__status; it does not include the following fields in the query: orders.count
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: totals {
    type: number
    sql: ${TABLE}.Totals ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
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
    fields: [totals, orders_id, orders_status, orders_count]
  }
}
