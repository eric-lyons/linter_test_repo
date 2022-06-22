view: orders {
  sql_table_name:  demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_as_string {
    type: string
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

  dimension: one_billion {
    type: number
    sql: 1000000 ;;
  }

  dimension: one_million {
    type: number
    sql: 1000 ;;
  }

  dimension: five_million {
    type: number
    sql: 5000 ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${one_billion} ;;
  }

  measure: total_item_views {
    type: sum
    sql: ${five_million} ;;
  }

  measure: total_purchases {
    type: sum
    sql: ${one_million} ;;
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

  measure: count_with_html {
    type: count
    drill_fields: [detail*]
    html:
    {% if value > 10000 %}
    <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif value > 5000 %}
    <font color="goldenrod">{{ rendered_value }}</font>
    {% else %}
    <font color="darkred">{{ rendered_value }}</font>
    {% endif %} ;;
  }

  measure: sum_id {
    type: number
    sql: SUM(${id}) ;;
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
