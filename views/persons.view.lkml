view: persons {
  sql_table_name: demo_db.Persons ;;

  dimension: emp_id {
    type: number
    sql: ${TABLE}.EmpID ;;
  }

  dimension: name {
    type: string
    html: <a href="https://www.google.com/search?q={{value}}"> {{ value }} </a>;;
    sql: ${TABLE}.Name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
