view: flights {
  sql_table_name: demo_db.flights ;;

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  dimension_group: arr {
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
    sql: ${TABLE}.arr_time ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension: concatenated {
    type: string
    sql: CONCAT(${TABLE}.cancelled,${TABLE}.carrier, "ashdaksjhdklasdnkj.nxckjashdliuagfliuAHSDKJSANZXKJN.ASKNDKSAJFGLJDSGVFJHBDSJKCBASKJBDKSAGFHADSFJKBCKJ.SANC.KNASZX.KJBZDKJBC") ;;
  }

  parameter: date_granularity {
    type: string
    default_value: "Day"
    allowed_value: { value: "Day" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }

  dimension: date {
    label_from_parameter: date_granularity
    sql:
    CASE
      WHEN {% parameter date_granularity %} = 'Day'
        THEN ${departure_date}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Month'
        THEN ${departure_month}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Quarter'
        THEN ${departure_quarter}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Year'
        THEN ${departure_year}::VARCHAR
      ELSE NULL
    END ;;
  }

  dimension_group: departure {
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
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
