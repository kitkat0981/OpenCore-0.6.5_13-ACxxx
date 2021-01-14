DefinitionBlock("", "SSDT", 2, "GWYD", "BATT", 0) {
	External (\_SB.PCI0.LPCB.EC0, DeviceObj)

    // ------------------------- Rehabman's Methods -------------------------
    
    // Status from two EC fields
    Method (B1B2, 2, NotSerialized) {
        Return(Arg0 | (Arg1 << 0x08))
    }

    // Status from four EC fields
    Method (B1B4, 4, NotSerialized)
    {
        Local0 = Arg3
        Local0 = Arg2 | (Local0 << 0x08)
        Local0 = Arg1 | (Local0 << 0x08)
        Local0 = Arg0 | (Local0 << 0x08)
        Return(Local0)
    }

    Scope (\_SB.PCI0.LPCB.EC0) {
        
        /*  Called from RECB, grabs a single byte from EC
        *  Arg0 - offset in bytes from zero-based EC
        */
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion(XXOR, EmbeddedControl, Arg0, 1)
            Field(XXOR, ByteAcc, NoLock, Preserve) { BYTE, 8 }
            Return(BYTE)
        }
        
        /*  Grabs specified number of bytes from EC
        *  Arg0 - offset in bytes from zero-based EC
        *  Arg1 - size of buffer in bits
        */
        Method (RECB, 2, Serialized)
        {
            Arg1 = Arg1 >> 0x03
            Name(TEMP, Buffer(Arg1) { })
            Arg1 = Arg0 + Arg1
            Local0 = 0
            While (Arg0 < Arg1)
            {
                Store(RE1B(Arg0), Index(TEMP, Local0))
                Arg0++
                Local0++
            }
            Return(TEMP)
        }
    }

    // ----------------------- End Rehabman's Methods ------------------------

	Scope (\_SB.PCI0.LPCB.EC0)
	{
		OperationRegion (XRAM, EmbeddedControl, 0x00, 0x0100)
	}


}