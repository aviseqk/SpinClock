#include "unity/src/unity.h"
#include "../src/rt_sequencer.h"

void setUp(void) {}
void tearDown(void) {}

void test_basic_sequence(void) {
    int result = spinclock_init();
    TEST_ASSERT_EQUAL_INT(0, result);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_basic_sequence);
    return UNITY_END();
}

