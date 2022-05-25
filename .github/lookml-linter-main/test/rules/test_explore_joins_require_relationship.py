from linter.rule import Severity
from linter.rules.explore_joins_require_relationship import ExploreJoinsRequireRelationship


def test_run_method_successfully_validates_explore_with_joins_and_relationships() -> None:
    rule = ExploreJoinsRequireRelationship(Severity.ERROR.value)

    explore = {'sql_always_where': "${products.category} in\n  (select ${products.category} from ${products.SQL_TABLE_NAME} products\n  where ${products.brand} = 'Allegra K'\n  group by 1)", 'joins': [{'type': 'left_outer', 'sql_on': '${order_items.user_id} = ${users.id}', 'relationship': 'many_to_one', 'name': 'users'}, {'fields': [
        'inventory_items.id'], 'type': 'left_outer', 'sql_on': '${order_items.inventory_item_id} = ${inventory_items.id}', 'relationship': 'many_to_one', 'name': 'inventory_items'}, {'type': 'left_outer', 'sql_on': '${inventory_items.product_id} = ${products.id}', 'relationship': 'many_to_one', 'name': 'products'}], 'name': 'order_items'}
    rule_result = rule.run(explore)
    assert rule_result == True


def test_run_method_successfully_validates_explore_without_joins() -> None:
    rule = ExploreJoinsRequireRelationship(Severity.ERROR.value)

    explore = {
        'sql_always_where': "${products.category} in\n  (select ${products.category} from ${products.SQL_TABLE_NAME} products\n  where ${products.brand} = 'Allegra K'\n  group by 1)", 'name': 'order_items'}
    rule_result = rule.run(explore)
    assert rule_result == True


def test_run_method_fails_to_validate_explore_with_joins_and_without_relationship() -> None:
    rule = ExploreJoinsRequireRelationship(Severity.ERROR.value)

    explore = {'sql_always_where': "${products.category} in\n  (select ${products.category} from ${products.SQL_TABLE_NAME} products\n  where ${products.brand} = 'Allegra K'\n  group by 1)", 'joins': [{'type': 'left_outer', 'sql_on': '${order_items.user_id} = ${users.id}', 'name': 'users'}, {'fields': [
        'inventory_items.id'], 'type': 'left_outer', 'sql_on': '${order_items.inventory_item_id} = ${inventory_items.id}', 'relationship': 'many_to_one', 'name': 'inventory_items'}, {'type': 'left_outer', 'sql_on': '${inventory_items.product_id} = ${products.id}', 'relationship': 'many_to_one', 'name': 'products'}], 'name': 'order_items'}
    rule_result = rule.run(explore)
    assert rule_result == False
