Dim StringTable
Set StringTable = CreateObject("Scripting.Dictionary")
StringTable.CompareMode = vbBTextCompare

Function GetFileName()
    Dim locale
    locale = GetLocale()
    select case locale
        case 2052
            GetFileName = "StringTable_CN.RC"
        case 1041
            GetFileName = "StringTable_JP.RC"
        case Else
            GetFileName = "StringTable.RC"
    end select
End Function

Sub LoadStringTable(filename)
    Dim fso, file, patt, re, matches, textline
    Set re = new RegExp
    re.Pattern = "\s*(\d+)\s+(""[^""]*"")\s*(//.*)?"
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile(filename, 1, False, -1)

    Do While file.AtEndOfStream <> True
        textline = file.ReadLine
        set matches = re.Execute(textline)
        For Each match in matches
            StringTable.Add match.SubMatches(0), match.SubMatches(1)
        Next
    Loop
    file.Close()
    
End Sub

Function LoadResString(id)
    LoadResString = StringTable.Item(CStr(id))
End Function

LoadStringTable GetFileName()

