/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-SBUS-MCHC.aml, Fri Jun 26 22:16:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000108 (264)
 *     Revision         0x02
 *     Checksum         0x77
 *     OEM ID           "ACDT"
 *     OEM Table ID     "MCHCSBUS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "MCHCSBUS", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.SBUS.BUS0, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }
    }

    Device (_SB.PCI0.SBUS.BUS0)
    {
        Name (_CID, "smbus")  // _CID: Compatible ID
        Name (_ADR, Zero)  // _ADR: Address
        Device (DVL0)
        {
            Name (_ADR, 0x57)  // _ADR: Address
            Name (_CID, "diagsvault")  // _CID: Compatible ID
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LNot (Arg2))
                {
                    Return (Buffer (One)
                    {
                         0x57                                             // W
                    })
                }

                Return (Package (0x02)
                {
                    "address", 
                    0x57
                })
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                             0x03                                             // .
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                 0x00                                             // .
            }, Arg4)
        Return (Zero)
    }
}

