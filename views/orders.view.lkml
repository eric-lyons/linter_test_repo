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


   filter: testing1{
    sql: (select ${status} from orders) ;;
    type: string
  }


  filter: testing2{
    sql: (select ${status} from orders WHERE {% condition %} status {% endcondition %} and user_id = '1' ) ;;
    type: string
  }
  filter: testing3{
    sql: (select ${status} from orders WHERE {% condition %} status {% endcondition %} and status = 'complete' ) ;;
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: test {
    type: number
    sql: case when ${status} = "complete" then ${count} ELSE 0 End ;;
    html: {{rendered_value}} <br> First line
    <br> {{orders.count._value}}
    <br> Second line {{orders.count._value}}</br>;;
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
