<?php
class TestListener extends PHPUnit_Util_Printer implements PHPUnit_Framework_TestListener
{
    protected $log;

    protected $timer = [];

    public function __construct()
    {
        $this->log = new Monolog\Logger('log');
        $this->log->pushHandler(new Monolog\Handler\BufferHandler(new \Monolog\Handler\StreamHandler('php://stdout')));
    }

    public function __destruct()
    {}

    public function startTestSuite(PHPUnit_Framework_TestSUite $suite)
    {
    }

    public function endTestSuite(PHPUnit_Framework_TestSuite $suite)
    {
    }

    public function addError(PHPUnit_Framework_Test $test, Exception $e, $time)
    {}

    public function addFailure(PHPUnit_Framework_Test $test, PHPUnit_Framework_AssertionFailedError $e, $time)
    {}

    public function addIncompleteTest(PHPUnit_Framework_Test $test, Exception $e, $time)
    {}

    public function addSkippedTest(PHPUnit_Framework_Test $test, Exception $e, $time)
    {}

    public function addRiskyTest(PHPUnit_Framework_Test $test, Exception $e, $time)
    {}

    public function startTest(PHPUnit_Framework_Test $test)
    {
        $this->timer[$test->getName()] = $this->getCurrentTime();
    }

    public function endTest(PHPUnit_Framework_Test $test, $time)
    {
        $startTime = $this->timer[$test->getName()];
        $duration = number_format($this->getCurrentTime() - $startTime, 4);
        $message = $test->getName() . ' executed in ' . $duration . 's';

        $this->log->addInfo($message);
    }

    protected function getCurrentTime()
    {
        return time() + microtime();
    }
}
