package com.nenu.innovation.test;

import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * AbstractTestCase
 *
 * @author: wychen
 * @time: 2017/4/2 21:05
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/spring*.xml"})
public class AbstractTestCase extends TestCase {
}
