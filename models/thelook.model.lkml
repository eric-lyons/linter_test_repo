connection: "thelook"

# include all the views



include: "/views/**/*.view"
include: "/pdf_test.dashboard"
include: "/pdf_test_2.dashboard"
include: "/cooler_dashboard.dashboard"
include: "/sql_runner_query.view.lkml"
datagroup: thelook_default_datagroup {
  sql_trigger: SELECT 1;;
  max_cache_age: "1 hour"
}
#test
persist_with: thelook_default_datagroup


explore: imgsrc1onerroralert2 {}

explore: account {}

explore: sql_runner_query {}

explore: billion_orders {
  join: orders {
    type: left_outer
    sql_on: ${billion_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: connection_reg_r3 {}

explore: dept {}

explore: employees {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: fakeorders {
  join: orders {
    type: left_outer
    sql_on: ${fakeorders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: fatal_error_user_derived_base {}

explore: flights {}

explore: human {}

explore: hundred_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: hundred_million_orders_wide {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders_wide.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: incremental_pdts_test {}

explore: ints {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  aggregate_table: rollup__status {
    query: {
      dimensions: [id,status]
      measures: [users.count,sum_id]
      # filters: [orders.status: "Afghanistan,Albania,Algeria,Andorra,Angola,Anguilla,Antarctica,Antigua & Barbuda,Argentina,Armenia,Aruba,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bermuda,Bhutan,Bolivia,Bosnia & Herzegovina,Botswana,Brazil,British Indian Ocean Territory,Brunei,Bulgaria,Burkina Faso,Burundi,Cambodia,Cameroon,Canada,Cape Verde,Caribbean NL,Cayman Islands,Central African Rep.,Chad,Chile,China,Christmas Island,Cocos (Keeling) Islands,Colombia,Comoros,Congo (Dem. Rep.),Congo (Rep.),Cook Islands,Costa Rica,Croatia,Cuba,Curaçao,Cyprus,Czech Republic,\"Côte d'Ivoire\",Denmark,Djibouti,Dominica,Dominican Republic,East Timor,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Falkland Islands,Faroe Islands,Fiji,Finland,France,French Guiana,French Polynesia,Gabon,Gambia,Georgia,Germany,Ghana,Gibraltar,Greece,Greenland,Grenada,Guadeloupe,Guam,Guatemala,Guernsey,Guinea,Guinea-Bissau,Guyana,Haiti,Honduras,Hong Kong,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland,Isle of Man,Israel,Italy,Jamaica,Japan,Jersey,Jordan,Kazakhstan,Kenya,Kiribati,Korea (North),Korea (South),Kosovo,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macau,Macedonia,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Martinique,Mauritania,Mauritius,Mayotte,Mexico,Micronesia,Moldova,Monaco,Mongolia,Montenegro,Montserrat,Morocco,Mozambique,Myanmar (Burma),Namibia,Nauru,Nepal,Netherlands,New Caledonia,New Zealand,Nicaragua,Niger,Nigeria,Niue,Norfolk Island,Northern Mariana Islands,Norway,Oman,Pakistan,Palau,Palestine,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Pitcairn,Poland,Portugal,Puerto Rico,Qatar,Romania,Russia,Rwanda,Réunion,Samoa (American),Samoa (western),San Marino,Sao Tome & Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Georgia & the South Sandwich Islands,South Sudan,Spain,Sri Lanka,St Barthélemy,St Kitts & Nevis,St Lucia,St Maarten (Dutch),St Martin (French),St Pierre & Miquelon,St Vincent,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikistan,Tanzania,Thailand,Togo,Tokelau,Tonga,Trinidad & Tobago,Tunisia,Turkey,Turkmenistan,Turks & Caicos Is,US minor outlying islands,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,Uruguay,Uzbekistan,Vanuatu,Vatican City,Venezuela,Vietnam,Virgin Islands (UK),Virgin Islands (US),Wallis & Futuna,Western Sahara,Yemen,Zambia,Zimbabwe,Åland Islands"]
    }

    materialization: {
      datagroup_trigger: thelook_default_datagroup
    }
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: pegdates {}

explore: person {}

explore: persons {}

explore: persons2 {}

explore: products {}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}

explore: saralooker {
  join: users {
    type: left_outer
    sql_on: ${saralooker.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: schema_migrations {}

explore: sindhu {
  join: users {
    type: left_outer
    sql_on: ${sindhu.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: ten_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${ten_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders_access_filter {
  view_name: orders
  access_filter: {
    field: orders.status
    user_attribute: user_access_none
  }
}

explore: test {}

explore: users {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: vvimgsrc1onerroralert2ll {}

explore: xin_test_for_bug2 {}

explore: xss_test {}

explore: xss_test_1 {}

explore: xss_test_10 {}

explore: xss_test_11 {}

explore: xss_test_12 {}

explore: xss_test_13 {}

explore: xss_test_14 {}

explore: xss_test_15 {}

explore: xss_test_16 {}

explore: xss_test_2 {}

explore: xss_test_4 {}

explore: xss_test_5 {}

explore: xss_test_6 {}

explore: xss_test_7 {}

explore: xss_test_8 {}

explore: xss_test_9 {}
