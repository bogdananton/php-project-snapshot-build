<?php
namespace DemoApp;

use ValueObjects\Exception\InvalidNativeArgumentException;
use ValueObjects\StringLiteral\StringLiteral;

class ProductSKU extends StringLiteral
{
    protected $value;

    public function __construct($value = '')
    {
        if (!is_string($value)) {
            throw new InvalidNativeArgumentException(json_encode($value), ['string']);
        }

        if (strlen(trim($value)) < 4) {
            throw new \LengthException('SKU\'s length needs to be at least 4 chars.');
        }

        $this->value = $value;
    }
}
