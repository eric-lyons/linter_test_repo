 view: example_derived_table {
  derived_table: {
    sql: SELECT
        page_type as page_type
        , tenant_suite as tenant_suite
        , COUNT(DISTINCT user_id) as total_visits
      FROM impressions_table
      GROUP BY 1,2
      ;;
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
  }

  dimension: tenant_suite {
    type: string
    sql: ${TABLE}.tenant_suite ;;
  }

  dimension: total_visits {
    type: number
    sql: ${TABLE}.total_visits ;;
  }

  measure: sum_of_total_visits {
    type: sum
    sql: ${total_visits} ;;
  }
 }
