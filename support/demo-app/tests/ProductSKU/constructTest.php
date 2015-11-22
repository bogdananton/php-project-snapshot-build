<?php
namespace tests;

use DemoApp\ProductSKU;

class constructTest extends \PHPUnit_Framework_TestCase
{
    /**
     * When string value is given then store locally.
     */
    public function testWhenStringValueIsGivenThenStoreLocally()
    {
        $string = new ProductSKU('abcd');
        static::assertEquals('abcd', \PHPUnit_Framework_Assert::readAttribute($string, 'value'));
    }

    /**
     * When empty string value is given then throw exception.
     * @expectedException \LogicException
     * @expectedExceptionMessage SKU's length needs to be at least 4 chars.
     */
    public function testWhenEmptyStringValueIsGivenThenThrowException()
    {
        new ProductSKU('');
    }

    /**
     * When string shorter than 4 chars is given then throw exception.
     * @expectedException \LogicException
     * @expectedExceptionMessage SKU's length needs to be at least 4 chars.
     */
    public function testWhenStringShortedThan4CharsIsGivenThenThrowException()
    {
        new ProductSKU('123');
    }

    /**
     * When a non-string is passed then throw exception.
     *
     * @expectedException \ValueObjects\Exception\InvalidNativeArgumentException
     * @expectedExceptionMessage Argument "[]" is invalid. Allowed types for argument are "string".
     */
    public function testWhenANonStringIsPassedThenThrowException()
    {
        new ProductSKU([]);
    }
}