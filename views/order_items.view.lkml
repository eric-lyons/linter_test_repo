view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: reference {
    type: number
    sql: ${order_id} ;;
  }

  dimension: concatenated {
    type: string
    sql: CONCAT(CAST(${TABLE}.inventory_item_id as CHAR),"This is a looooooooooooooooong chatacter testing for render errors.jdlaskdlkashdkjlashdkjlahsdkljhsklajshfkasheliwuehrliuewqyriluwegfdsbjknaskjdhiluwegruygfsdajhbjasbdn.wakhewlirugwekyufagsdjbjksankdjwehfgkeruygfekyasdkjbacskj.xcna;oishdiweguahrfsa;odp;k;aslkdpwa0isdulaewisfgdkcyhjgalsiuhsliqwytewuqyiuroaljsd.nhkasbfnc.kabwvekusydiluhlwaejshfbkndmnlaweufslygiudkhjbafwjhesdbfkndzlwweargilusdhlkjbfansddkjbhjvakeufslGIDbkjcnaelgfveuwglaisdhjkbfavgfilus>bjlcnx") ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    html:
    html: <a href="https://www.google.com/search?q={{value}}"> {{ value }} </a>;;
    sql: ${TABLE}.sale_price ;;
  }

  parameter: dynamic_field_selector {
    type: unquoted
    allowed_value: {
      label: "Sum of ID"
      value: "sum_of_id"
    }
    allowed_value: {
      label: "Sum of Order ID"
      value: "sum_of_order_id"
    }
  }

  measure: sum_of_id {
    type: sum
    sql: ${id} ;;
  }

  measure: sum_of_order_id {
    type: sum
    sql: ${order_id} ;;
  }

  measure: dynamic_sum {
    type: number
    sql:
    {% if dynamic_field_selector._parameter_value == 'sum_of_id' %}
    ${sum_of_id}
    {% else %}
    ${sum_of_order_id}
    {% endif %};;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
