view: orders {
  sql_table_name:  demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  parameter: parameter_with_no_allowed_values {type:string}
  parameter: parameter_with_allowed_values {
    type: string
    allowed_value: {
      label: "Test"
      value: "test"
    }
    allowed_value: {
      label: "More Test"
      value: "moretest"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_id {
    type: number
    sql: SUM(${id}) ;;
  }

  measure: test1 {
    type: number
    sql: case
    when ${id}='4182' then 10*(2*(2*${count})+5)
    else 200*${count};;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}
