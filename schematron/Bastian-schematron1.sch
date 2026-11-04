<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="location[contains(., 'AU')]" role="error">
            <assert test="@long &gt; 100 and @lat &lt; 0">
                if location is in AU long must be more than 100, and lat must be less than 0
            </assert>
        </rule>
        <rule context="location[contains(., 'USA')]" role="error">
            <assert test="@long &lt; 0 and @lat &gt; 0">
                if location is in USA long must be less than 0 and the lat must be greater than 0
            </assert>
        </rule>
    </pattern>
    
</sch:schema>
