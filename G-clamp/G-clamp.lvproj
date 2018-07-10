<?xml version='1.0'?>
<Project Type="Project" LVVersion="8008005">
   <Item Name="My Computer" Type="My Computer">
      <Property Name="CCSymbols" Type="Str">OS,Win;CPU,x86;</Property>
      <Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.tcp.acl" Type="Str">370000000A000000010000002B000000030000000F0000003133362E3134322E3137352E31363710000000030000000000010000000000</Property>
      <Property Name="server.tcp.enabled" Type="Bool">true</Property>
      <Property Name="server.tcp.port" Type="Int">3363</Property>
      <Property Name="server.tcp.serviceName" Type="Str"></Property>
      <Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
      <Property Name="server.vi.access" Type="Str"></Property>
      <Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
      <Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="specify.custom.address" Type="Bool">false</Property>
      <Item Name="Host" Type="Folder">
         <Item Name="Amplifiers" Type="Folder">
            <Item Name="MultiClamp 700B Files" Type="Folder">
               <Item Name="AxMultiClampMsg.pdf" Type="Document" URL="Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.pdf"/>
               <Item Name="AxMultiClampMsg.dll" Type="Document" URL="Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.dll"/>
               <Item Name="AxMultiClampMsg.h" Type="Document" URL="Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.h"/>
               <Item Name="AxMultiClampMsg.lib" Type="Document" URL="Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.lib"/>
            </Item>
            <Item Name="AxoClamp 2B Host.vi" Type="VI" URL="Amplifiers/AxoClamp 2B Host.vi"/>
            <Item Name="AxoClamp 2B - Mode.ctl" Type="VI" URL="Amplifiers/AxoClamp 2B - Mode.ctl"/>
            <Item Name="Axopatch 200B Host.vi" Type="VI" URL="Amplifiers/Axopatch 200B Host.vi"/>
            <Item Name="Axopatch 200B GAIN.ctl" Type="VI" URL="Amplifiers/Axopatch 200B GAIN.ctl"/>
            <Item Name="Axopatch 200B FILTER kHz.ctl" Type="VI" URL="Amplifiers/Axopatch 200B FILTER kHz.ctl"/>
            <Item Name="Axopatch 200B Cmembrane.ctl" Type="VI" URL="Amplifiers/Axopatch 200B Cmembrane.ctl"/>
            <Item Name="Axopatch 200B MODE.ctl" Type="VI" URL="Amplifiers/Axopatch 200B MODE.ctl"/>
            <Item Name="Model 2400 Host.vi" Type="VI" URL="Amplifiers/Model 2400 Host.vi"/>
            <Item Name="Model 2400 MODE.ctl" Type="VI" URL="Amplifiers/Model 2400 MODE.ctl"/>
            <Item Name="Model 2400 Cmembrane.ctl" Type="VI" URL="Amplifiers/Model 2400 Cmembrane.ctl"/>
            <Item Name="Model 2400 FILTER kHz.ctl" Type="VI" URL="Amplifiers/Model 2400 FILTER kHz.ctl"/>
            <Item Name="Model 2400 GAIN.ctl" Type="VI" URL="Amplifiers/Model 2400 GAIN.ctl"/>
            <Item Name="MultiClamp 700B Host.vi" Type="VI" URL="Amplifiers/MultiClamp 700B Host.vi"/>
         </Item>
         <Item Name="ExpModules" Type="Folder">
            <Item Name="Vclamp - SaveData (SubVI).vi" Type="VI" URL="ExpModules/Vclamp - SaveData (SubVI).vi"/>
            <Item Name="Vclamp - Host.cfg" Type="Document" URL="ExpModules/Vclamp - Host.cfg"/>
            <Item Name="Vclamp - Parameters.ctl" Type="VI" URL="ExpModules/Vclamp - Parameters.ctl"/>
            <Item Name="Vclamp - Host.vi" Type="VI" URL="ExpModules/Vclamp - Host.vi"/>
            <Item Name="Threshold Gsyn - Host.vi" Type="VI" URL="ExpModules/Threshold Gsyn - Host.vi"/>
            <Item Name="Threshold Gsyn - SaveData (SubVI).vi" Type="VI" URL="ExpModules/Threshold Gsyn - SaveData (SubVI).vi"/>
            <Item Name="ExpModules Variables.lvlib" Type="Library" URL="ExpModules/ExpModules Variables.lvlib">
               <Item Name="Vclamp - Parameters" Type="Variable"/>
               <Item Name="Threshold Gsyn - Parameters" Type="Variable"/>
               <Item Name="Synaptic Gain - Parameters2" Type="Variable"/>
               <Item Name="Synaptic Gain - Parameters" Type="Variable"/>
               <Item Name="StripChart - Parameters" Type="Variable"/>
               <Item Name="StripChart - Parameters2" Type="Variable"/>
               <Item Name="Synaptic Gain - Parameters3" Type="Variable"/>
            </Item>
            <Item Name="Synaptic Gain - SaveData (SubVI).vi" Type="VI" URL="ExpModules/Synaptic Gain - SaveData (SubVI).vi"/>
            <Item Name="Synaptic Gain - Host.vi" Type="VI" URL="ExpModules/Synaptic Gain - Host.vi"/>
            <Item Name="StripChart - Host.vi" Type="VI" URL="ExpModules/StripChart - Host.vi"/>
         </Item>
         <Item Name="G-clamp v2 - Host.vi" Type="VI" URL="Main VIs/Host/G-clamp v2 - Host.vi"/>
         <Item Name="G-clamp v2 - Host.lvlib" Type="Library" URL="Main VIs/Host/G-clamp v2 - Host.lvlib">
            <Item Name="VIs" Type="Folder">
               <Item Name="SynCond LV 2-style Global.vi" Type="VI" URL="Main VIs/Host/SynCond LV 2-style Global.vi"/>
               <Item Name="SynapticConductanceEditor.vi" Type="VI" URL="Main VIs/Host/SynapticConductanceEditor.vi"/>
               <Item Name="Seal Test - Host.vi" Type="VI" URL="Main VIs/Host/Seal Test - Host.vi"/>
               <Item Name="Membrane Test - Host.vi" Type="VI" URL="Main VIs/Host/Membrane Test - Host.vi"/>
               <Item Name="IP DataBuffer LV 2-style Global.vi" Type="VI" URL="Main VIs/Host/IP DataBuffer LV 2-style Global.vi"/>
               <Item Name="Create Plugin List.vi" Type="VI" URL="Main VIs/Host/Create Plugin List.vi"/>
               <Item Name="Bridge Test - Host.vi" Type="VI" URL="Main VIs/Host/Bridge Test - Host.vi"/>
               <Item Name="ConfigFileOps.vi" Type="VI" URL="Main VIs/Host/ConfigFileOps.vi"/>
               <Item Name="Message.vi" Type="VI" URL="Main VIs/Host/Message.vi"/>
            </Item>
            <Item Name="Variables" Type="Folder">
               <Item Name="Abort Experiment" Type="Variable"/>
               <Item Name="Bridge Test - Parameters" Type="Variable"/>
               <Item Name="Membrane Test - Parameters" Type="Variable"/>
               <Item Name="Seal Test - Paramters" Type="Variable"/>
               <Item Name="RT Loop Info" Type="Variable"/>
               <Item Name="Stop Host Amplifier VI" Type="Variable"/>
               <Item Name="Log" Type="Variable"/>
               <Item Name="LogFile" Type="Variable"/>
               <Item Name="Save Data" Type="Variable"/>
               <Item Name="DataDirectory" Type="Variable"/>
               <Item Name="Virtual G&apos;s" Type="Variable"/>
               <Item Name="Telegraph to Amp." Type="Variable"/>
               <Item Name="Virtual G&apos;s.ctl" Type="VI" URL="Main VIs/Virtual G&apos;s.ctl"/>
               <Item Name="Membrane_Seal_Bridge Test - Parameters.ctl" Type="VI" URL="Main VIs/Membrane_Seal_Bridge Test - Parameters.ctl"/>
               <Item Name="RT Loop Info.ctl" Type="VI" URL="Main VIs/RT Loop Info.ctl"/>
               <Item Name="Progress" Type="Variable"/>
               <Item Name="DataFile" Type="Variable"/>
               <Item Name="Telegraph from Amp." Type="Variable"/>
               <Item Name="ChannelInfo" Type="Variable"/>
               <Item Name="ChannelInfo.ctl" Type="VI" URL="Main VIs/ChannelInfo.ctl"/>
               <Item Name="MessageStop" Type="Variable"/>
               <Item Name="ExtDevice - Parameters" Type="Variable"/>
            </Item>
            <Item Name="G-clamp v2 Host.cfg" Type="Document" URL="Main VIs/Host/G-clamp v2 Host.cfg"/>
            <Item Name="G-clamp v2 - Host.rtm" Type="Document" URL="Main VIs/Host/G-clamp v2 - Host.rtm"/>
         </Item>
      </Item>
      <Item Name="Target" Type="Folder">
         <Item Name="Amplifiers" Type="Folder">
            <Item Name="AxoClamp 2B Target.vi" Type="VI" URL="Amplifiers/AxoClamp 2B Target.vi"/>
            <Item Name="Axopatch 200B Target.vi" Type="VI" URL="Amplifiers/Axopatch 200B Target.vi"/>
            <Item Name="Model 2400 Target.vi" Type="VI" URL="Amplifiers/Model 2400 Target.vi"/>
            <Item Name="MultiClamp 700B Target.vi" Type="VI" URL="Amplifiers/MultiClamp 700B Target.vi"/>
         </Item>
         <Item Name="ExpModules" Type="Folder">
            <Item Name="Seal Test - Target.vi" Type="VI" URL="Main VIs/Target/Seal Test - Target.vi"/>
            <Item Name="Membrane Test - Target.vi" Type="VI" URL="Main VIs/Target/Membrane Test - Target.vi"/>
            <Item Name="Bridge Test - Target.vi" Type="VI" URL="Main VIs/Target/Bridge Test - Target.vi"/>
            <Item Name="Vclamp - Target.vi" Type="VI" URL="ExpModules/Vclamp - Target.vi"/>
            <Item Name="Threshold Gsyn - Target.vi" Type="VI" URL="ExpModules/Threshold Gsyn - Target.vi"/>
            <Item Name="Synaptic Gain - Target.vi" Type="VI" URL="ExpModules/Synaptic Gain - Target.vi"/>
            <Item Name="StripChart - Target.vi" Type="VI" URL="ExpModules/StripChart - Target.vi"/>
         </Item>
         <Item Name="G-clamp v2 - Target.lvlib" Type="Library" URL="Main VIs/Target/G-clamp v2 - Target.lvlib">
            <Item Name="VIs" Type="Folder">
               <Item Name="rt fifo.ctl" Type="VI" URL="Main VIs/Target/rt fifo.ctl"/>
               <Item Name="RT FIFO LV 2-style Global.vi" Type="VI" URL="Main VIs/Target/RT FIFO LV 2-style Global.vi"/>
               <Item Name="Boolean LV 2-style Global.vi" Type="VI" URL="Main VIs/Target/Boolean LV 2-style Global.vi"/>
               <Item Name="GetMemoryStats.vi" Type="VI" URL="Main VIs/Target/MemoryExample7_0.llb/GetMemoryStats.vi"/>
            </Item>
            <Item Name="Variables" Type="Folder">
               <Item Name="ErrorCluster" Type="Variable"/>
               <Item Name="SystemInfo" Type="Variable"/>
               <Item Name="Telegraph from Amp." Type="Variable"/>
               <Item Name="Telegraph to Amp." Type="Variable"/>
               <Item Name="AmplifierVI" Type="Variable"/>
               <Item Name="ExpModuleVI" Type="Variable"/>
               <Item Name="TimeStamp" Type="Variable"/>
               <Item Name="ExitTargetApp" Type="Variable"/>
               <Item Name="Gain V" Type="Variable"/>
               <Item Name="Gain I" Type="Variable"/>
            </Item>
         </Item>
         <Item Name="G-clamp v2 - Target.vi" Type="VI" URL="Main VIs/Target/G-clamp v2 - Target.vi"/>
         <Item Name="G-clamp v2.nce" Type="Document" URL="Main VIs/Target/G-clamp v2.nce"/>
      </Item>
      <Item Name="OfflineUtilities" Type="Folder">
         <Item Name="G-clamp File Utilities.llb" Type="Document" URL="OfflineUtilities/G-clamp File Utilities.llb"/>
      </Item>
      <Item Name="G-clamp v2 Programming Documentation.doc" Type="Document" URL="G-clamp v2 Programming Documentation.doc"/>
      <Item Name="CreateCondTemplate (SubVI).vi" Type="VI" URL="ExpModules/CreateCondTemplate (SubVI).vi"/>
      <Item Name="G-clamp v2_1 User Manual.doc" Type="Document" URL="G-clamp v2_1 User Manual.doc"/>
      <Item Name="Dependencies" Type="Dependencies"/>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="Main Target VI" Type="Source Distribution">
            <Property Name="Absolute[0]" Type="Bool">false</Property>
            <Property Name="Absolute[1]" Type="Bool">false</Property>
            <Property Name="BuildName" Type="Str">Main Target VI</Property>
            <Property Name="DependencyApplyDestination" Type="Bool">true</Property>
            <Property Name="DependencyApplyInclusion" Type="Bool">true</Property>
            <Property Name="DependencyApplyPassword" Type="Bool">true</Property>
            <Property Name="DependencyApplyProperties" Type="Bool">true</Property>
            <Property Name="DependencyFolderDestination" Type="Int">0</Property>
            <Property Name="DependencyFolderInclusion" Type="Str">As Needed</Property>
            <Property Name="DependencyFolderMask" Type="Str">Default</Property>
            <Property Name="DependencyFolderPasswordSetting" Type="Str">No Password Change</Property>
            <Property Name="DependencyFolderPasswordToApply" Type="Str"></Property>
            <Property Name="DependencyFolderPropertiesItemCount" Type="Int">0</Property>
            <Property Name="DependencyFolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="DestinationID[0]" Type="Str">{FC311C6B-6B40-413C-B30A-75E306D6D881}</Property>
            <Property Name="DestinationID[1]" Type="Str">{44A349F3-BD17-4C13-A45C-21B7FF2A9ADF}</Property>
            <Property Name="DestinationItemCount" Type="Int">2</Property>
            <Property Name="DestinationName[0]" Type="Str">Destination Directory</Property>
            <Property Name="DestinationName[1]" Type="Str">Support Directory</Property>
            <Property Name="DestinationOption" Type="Str">Single Destination</Property>
            <Property Name="Disconnect" Type="Bool">true</Property>
            <Property Name="ExcludeInstrLib" Type="Bool">false</Property>
            <Property Name="ExcludeUserLib" Type="Bool">false</Property>
            <Property Name="ExcludeVILIB" Type="Bool">false</Property>
            <Property Name="Path[0]" Type="Path">../../ni-rt/startup</Property>
            <Property Name="Path[1]" Type="Path">../../ni-rt/startup/data</Property>
            <Property Name="SourceInfoItemCount" Type="Int">113</Property>
            <Property Name="SourceItem[0].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[0].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[0].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[0].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[0].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[0].ItemID" Type="Ref">/My Computer/Host</Property>
            <Property Name="SourceItem[0].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[1].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[1].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[1].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[1].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[1].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[1].ItemID" Type="Ref">/My Computer/Host/Amplifiers</Property>
            <Property Name="SourceItem[1].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[10].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[10].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[10].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[10].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[10].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B GAIN.ctl</Property>
            <Property Name="SourceItem[10].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[100].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[100].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[100].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/Telegraph from Amp.</Property>
            <Property Name="SourceItem[100].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[101].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[101].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[101].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/Telegraph to Amp.</Property>
            <Property Name="SourceItem[101].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[102].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[102].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[102].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/AmplifierVI</Property>
            <Property Name="SourceItem[102].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[103].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[103].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[103].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ExpModuleVI</Property>
            <Property Name="SourceItem[103].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[104].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[104].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[104].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/TimeStamp</Property>
            <Property Name="SourceItem[104].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[105].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[105].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[105].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ExitTargetApp</Property>
            <Property Name="SourceItem[105].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[106].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[106].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.vi</Property>
            <Property Name="SourceItem[106].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[107].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[107].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[107].ItemID" Type="Ref">/My Computer/Target/G-clamp v2.nce</Property>
            <Property Name="SourceItem[107].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[108].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[108].FolderInclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[108].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[108].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[108].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[108].ItemID" Type="Ref">/My Computer/OfflineUtilities</Property>
            <Property Name="SourceItem[108].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[109].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[109].FolderInclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[109].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[109].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[109].ItemID" Type="Ref">/My Computer/OfflineUtilities/G-clamp File Utilities.llb</Property>
            <Property Name="SourceItem[109].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[11].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[11].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[11].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[11].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[11].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B FILTER kHz.ctl</Property>
            <Property Name="SourceItem[11].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[110].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[110].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[110].ItemID" Type="Ref">/My Computer/G-clamp v2 Programming Documentation.doc</Property>
            <Property Name="SourceItem[110].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[111].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[111].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[111].ItemID" Type="Ref">/My Computer/CreateCondTemplate (SubVI).vi</Property>
            <Property Name="SourceItem[111].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[112].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[112].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[112].ItemID" Type="Ref">/My Computer/G-clamp v2_1 User Manual.doc</Property>
            <Property Name="SourceItem[112].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[12].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[12].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[12].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[12].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[12].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B Cmembrane.ctl</Property>
            <Property Name="SourceItem[12].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[13].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[13].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[13].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[13].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[13].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B MODE.ctl</Property>
            <Property Name="SourceItem[13].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[14].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[14].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[14].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[14].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[14].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 Host.vi</Property>
            <Property Name="SourceItem[14].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[15].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[15].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[15].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[15].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[15].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 MODE.ctl</Property>
            <Property Name="SourceItem[15].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[16].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[16].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[16].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[16].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[16].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 Cmembrane.ctl</Property>
            <Property Name="SourceItem[16].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[17].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[17].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[17].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[17].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[17].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 FILTER kHz.ctl</Property>
            <Property Name="SourceItem[17].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[18].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[18].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[18].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[18].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[18].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 GAIN.ctl</Property>
            <Property Name="SourceItem[18].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[19].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[19].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[19].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[19].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[19].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Host.vi</Property>
            <Property Name="SourceItem[19].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[2].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[2].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[2].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[2].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[2].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[2].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files</Property>
            <Property Name="SourceItem[2].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[20].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[20].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[20].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[20].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[20].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[20].ItemID" Type="Ref">/My Computer/Host/ExpModules</Property>
            <Property Name="SourceItem[20].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[21].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[21].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[21].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[21].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[21].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[21].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[22].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[22].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[22].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[22].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[22].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Host.cfg</Property>
            <Property Name="SourceItem[22].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[23].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[23].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[23].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[23].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[23].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Parameters.ctl</Property>
            <Property Name="SourceItem[23].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[24].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[24].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[24].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[24].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[24].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Host.vi</Property>
            <Property Name="SourceItem[24].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[25].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[25].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[25].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[25].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[25].ItemID" Type="Ref">/My Computer/Host/ExpModules/Threshold Gsyn - Host.vi</Property>
            <Property Name="SourceItem[25].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[26].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[26].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[26].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[26].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[26].ItemID" Type="Ref">/My Computer/Host/ExpModules/Threshold Gsyn - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[26].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[27].ApplyDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[27].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[27].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[27].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[27].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[27].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[27].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib</Property>
            <Property Name="SourceItem[27].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[28].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[28].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[28].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[28].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[28].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[28].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Vclamp - Parameters</Property>
            <Property Name="SourceItem[28].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[29].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[29].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[29].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[29].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[29].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[29].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Threshold Gsyn - Parameters</Property>
            <Property Name="SourceItem[29].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[3].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[3].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[3].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[3].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[3].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.pdf</Property>
            <Property Name="SourceItem[3].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[30].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[30].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[30].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[30].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[30].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[30].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters2</Property>
            <Property Name="SourceItem[30].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[31].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[31].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[31].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[31].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[31].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[31].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters</Property>
            <Property Name="SourceItem[31].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[32].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[32].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[32].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[32].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[32].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[32].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/StripChart - Parameters</Property>
            <Property Name="SourceItem[32].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[33].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[33].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[33].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[33].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[33].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[33].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/StripChart - Parameters2</Property>
            <Property Name="SourceItem[33].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[34].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[34].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[34].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[34].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[34].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[34].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters3</Property>
            <Property Name="SourceItem[34].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[35].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[35].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[35].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[35].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[35].ItemID" Type="Ref">/My Computer/Host/ExpModules/Synaptic Gain - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[35].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[36].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[36].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[36].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[36].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[36].ItemID" Type="Ref">/My Computer/Host/ExpModules/StripChart - Host.vi</Property>
            <Property Name="SourceItem[36].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[37].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[37].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[37].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[37].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[37].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.vi</Property>
            <Property Name="SourceItem[37].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[38].ApplyDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[38].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[38].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[38].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[38].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[38].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[38].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib</Property>
            <Property Name="SourceItem[38].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[39].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[39].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[39].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[39].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[39].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[39].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[39].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs</Property>
            <Property Name="SourceItem[39].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[4].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[4].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[4].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[4].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[4].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.dll</Property>
            <Property Name="SourceItem[4].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[40].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[40].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[40].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[40].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[40].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[40].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/SynCond LV 2-style Global.vi</Property>
            <Property Name="SourceItem[40].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[41].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[41].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[41].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[41].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[41].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[41].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/SynapticConductanceEditor.vi</Property>
            <Property Name="SourceItem[41].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[42].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[42].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[42].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[42].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[42].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[42].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Seal Test - Host.vi</Property>
            <Property Name="SourceItem[42].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[43].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[43].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[43].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[43].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[43].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[43].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Membrane Test - Host.vi</Property>
            <Property Name="SourceItem[43].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[44].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[44].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[44].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[44].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[44].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[44].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/IP DataBuffer LV 2-style Global.vi</Property>
            <Property Name="SourceItem[44].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[45].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[45].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[45].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[45].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[45].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[45].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Create Plugin List.vi</Property>
            <Property Name="SourceItem[45].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[46].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[46].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[46].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[46].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[46].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[46].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Bridge Test - Host.vi</Property>
            <Property Name="SourceItem[46].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[47].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[47].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[47].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[47].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[47].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[47].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/ConfigFileOps.vi</Property>
            <Property Name="SourceItem[47].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[48].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[48].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[48].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[48].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[48].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[48].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Message.vi</Property>
            <Property Name="SourceItem[48].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[49].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[49].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[49].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[49].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[49].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[49].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[49].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables</Property>
            <Property Name="SourceItem[49].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[5].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[5].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[5].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[5].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[5].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.h</Property>
            <Property Name="SourceItem[5].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[50].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[50].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[50].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[50].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[50].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[50].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Abort Experiment</Property>
            <Property Name="SourceItem[50].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[51].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[51].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[51].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[51].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[51].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[51].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Bridge Test - Parameters</Property>
            <Property Name="SourceItem[51].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[52].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[52].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[52].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[52].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[52].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[52].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Membrane Test - Parameters</Property>
            <Property Name="SourceItem[52].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[53].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[53].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[53].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[53].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[53].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[53].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Seal Test - Paramters</Property>
            <Property Name="SourceItem[53].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[54].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[54].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[54].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[54].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[54].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[54].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/RT Loop Info</Property>
            <Property Name="SourceItem[54].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[55].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[55].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[55].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[55].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[55].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[55].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Stop Host Amplifier VI</Property>
            <Property Name="SourceItem[55].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[56].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[56].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[56].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[56].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[56].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[56].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Log</Property>
            <Property Name="SourceItem[56].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[57].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[57].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[57].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[57].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[57].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[57].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/LogFile</Property>
            <Property Name="SourceItem[57].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[58].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[58].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[58].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[58].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[58].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[58].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Save Data</Property>
            <Property Name="SourceItem[58].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[59].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[59].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[59].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[59].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[59].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[59].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/DataDirectory</Property>
            <Property Name="SourceItem[59].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[6].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[6].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[6].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[6].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[6].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.lib</Property>
            <Property Name="SourceItem[6].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[60].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[60].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[60].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[60].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[60].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[60].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Virtual G's</Property>
            <Property Name="SourceItem[60].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[61].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[61].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[61].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[61].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[61].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[61].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Telegraph to Amp.</Property>
            <Property Name="SourceItem[61].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[62].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[62].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[62].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[62].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[62].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[62].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Virtual G's.ctl</Property>
            <Property Name="SourceItem[62].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[63].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[63].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[63].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[63].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[63].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[63].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Membrane_Seal_Bridge Test - Parameters.ctl</Property>
            <Property Name="SourceItem[63].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[64].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[64].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[64].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[64].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[64].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[64].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/RT Loop Info.ctl</Property>
            <Property Name="SourceItem[64].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[65].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[65].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[65].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[65].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[65].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[65].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Progress</Property>
            <Property Name="SourceItem[65].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[66].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[66].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[66].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[66].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[66].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[66].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/DataFile</Property>
            <Property Name="SourceItem[66].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[67].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[67].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[67].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[67].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[67].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[67].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Telegraph from Amp.</Property>
            <Property Name="SourceItem[67].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[68].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[68].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[68].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[68].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[68].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[68].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ChannelInfo</Property>
            <Property Name="SourceItem[68].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[69].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[69].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[69].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[69].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[69].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[69].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ChannelInfo.ctl</Property>
            <Property Name="SourceItem[69].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[7].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[7].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[7].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[7].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[7].ItemID" Type="Ref">/My Computer/Host/Amplifiers/AxoClamp 2B Host.vi</Property>
            <Property Name="SourceItem[7].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[70].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[70].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[70].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[70].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[70].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[70].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/MessageStop</Property>
            <Property Name="SourceItem[70].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[71].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[71].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[71].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[71].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[71].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[71].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ExtDevice - Parameters</Property>
            <Property Name="SourceItem[71].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[72].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[72].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[72].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[72].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[72].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[72].ItemID" Type="Ref"></Property>
            <Property Name="SourceItem[72].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[73].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[73].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[73].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[73].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[73].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[73].ItemID" Type="Ref"></Property>
            <Property Name="SourceItem[73].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[74].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[74].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[74].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[74].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[74].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[74].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/G-clamp v2 Host.cfg</Property>
            <Property Name="SourceItem[74].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[75].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[75].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[75].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[75].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[75].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[75].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/G-clamp v2 - Host.rtm</Property>
            <Property Name="SourceItem[75].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[76].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[76].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[76].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[76].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[76].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[76].ItemID" Type="Ref">/My Computer/Host/ExpModules/Synaptic Gain - Host.vi</Property>
            <Property Name="SourceItem[76].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[77].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[77].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[77].ItemID" Type="Ref">/My Computer/Target</Property>
            <Property Name="SourceItem[77].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[78].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[78].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[78].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[78].ItemID" Type="Ref">/My Computer/Target/Amplifiers</Property>
            <Property Name="SourceItem[78].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[79].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[79].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[79].ItemID" Type="Ref">/My Computer/Target/Amplifiers/AxoClamp 2B Target.vi</Property>
            <Property Name="SourceItem[79].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[8].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[8].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[8].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[8].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[8].ItemID" Type="Ref">/My Computer/Host/Amplifiers/AxoClamp 2B - Mode.ctl</Property>
            <Property Name="SourceItem[8].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[80].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[80].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[80].ItemID" Type="Ref">/My Computer/Target/Amplifiers/Axopatch 200B Target.vi</Property>
            <Property Name="SourceItem[80].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[81].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[81].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[81].ItemID" Type="Ref">/My Computer/Target/Amplifiers/Model 2400 Target.vi</Property>
            <Property Name="SourceItem[81].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[82].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[82].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[82].ItemID" Type="Ref">/My Computer/Target/Amplifiers/MultiClamp 700B Target.vi</Property>
            <Property Name="SourceItem[82].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[83].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[83].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[83].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[83].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[83].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[83].ItemID" Type="Ref">/My Computer/Target/ExpModules</Property>
            <Property Name="SourceItem[83].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[84].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[84].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[84].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[84].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[84].ItemID" Type="Ref">/My Computer/Target/ExpModules/Seal Test - Target.vi</Property>
            <Property Name="SourceItem[84].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[85].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[85].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[85].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[85].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[85].ItemID" Type="Ref">/My Computer/Target/ExpModules/Membrane Test - Target.vi</Property>
            <Property Name="SourceItem[85].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[86].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[86].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[86].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[86].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[86].ItemID" Type="Ref">/My Computer/Target/ExpModules/Bridge Test - Target.vi</Property>
            <Property Name="SourceItem[86].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[87].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[87].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[87].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[87].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[87].ItemID" Type="Ref">/My Computer/Target/ExpModules/Vclamp - Target.vi</Property>
            <Property Name="SourceItem[87].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[88].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[88].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[88].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[88].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[88].ItemID" Type="Ref">/My Computer/Target/ExpModules/Threshold Gsyn - Target.vi</Property>
            <Property Name="SourceItem[88].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[89].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[89].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[89].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[89].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[89].ItemID" Type="Ref">/My Computer/Target/ExpModules/Synaptic Gain - Target.vi</Property>
            <Property Name="SourceItem[89].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[9].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[9].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[9].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[9].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[9].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B Host.vi</Property>
            <Property Name="SourceItem[9].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[90].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[90].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[90].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[90].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[90].ItemID" Type="Ref">/My Computer/Target/ExpModules/StripChart - Target.vi</Property>
            <Property Name="SourceItem[90].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[91].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[91].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[91].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[91].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib</Property>
            <Property Name="SourceItem[91].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[92].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[92].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[92].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[92].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs</Property>
            <Property Name="SourceItem[92].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[93].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[93].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[93].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/rt fifo.ctl</Property>
            <Property Name="SourceItem[93].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[94].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[94].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[94].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/RT FIFO LV 2-style Global.vi</Property>
            <Property Name="SourceItem[94].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[95].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[95].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[95].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/Boolean LV 2-style Global.vi</Property>
            <Property Name="SourceItem[95].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[96].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[96].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[96].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/GetMemoryStats.vi</Property>
            <Property Name="SourceItem[96].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[97].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[97].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[97].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[97].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables</Property>
            <Property Name="SourceItem[97].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[98].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[98].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[98].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ErrorCluster</Property>
            <Property Name="SourceItem[98].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[99].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[99].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[99].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/SystemInfo</Property>
            <Property Name="SourceItem[99].TopLevelVI" Type="Str">Never</Property>
         </Item>
         <Item Name="Target Dynamic VIs" Type="Source Distribution">
            <Property Name="Absolute[0]" Type="Bool">false</Property>
            <Property Name="Absolute[1]" Type="Bool">false</Property>
            <Property Name="BuildName" Type="Str">Target Dynamic VIs</Property>
            <Property Name="DependencyApplyDestination" Type="Bool">true</Property>
            <Property Name="DependencyApplyInclusion" Type="Bool">true</Property>
            <Property Name="DependencyApplyPassword" Type="Bool">true</Property>
            <Property Name="DependencyApplyProperties" Type="Bool">true</Property>
            <Property Name="DependencyFolderDestination" Type="Int">0</Property>
            <Property Name="DependencyFolderInclusion" Type="Str">As Needed</Property>
            <Property Name="DependencyFolderMask" Type="Str">Default</Property>
            <Property Name="DependencyFolderPasswordSetting" Type="Str">No Password Change</Property>
            <Property Name="DependencyFolderPasswordToApply" Type="Str"></Property>
            <Property Name="DependencyFolderPropertiesItemCount" Type="Int">0</Property>
            <Property Name="DependencyFolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="DestinationID[0]" Type="Str">{27D9230E-263F-42A2-B946-B7E0EE19FDC1}</Property>
            <Property Name="DestinationID[1]" Type="Str">{5790C8EC-776B-4A4A-B580-E8799FA56B23}</Property>
            <Property Name="DestinationItemCount" Type="Int">2</Property>
            <Property Name="DestinationName[0]" Type="Str">Destination Directory</Property>
            <Property Name="DestinationName[1]" Type="Str">Support Directory</Property>
            <Property Name="DestinationOption" Type="Str">Single Destination</Property>
            <Property Name="Disconnect" Type="Bool">true</Property>
            <Property Name="ExcludeInstrLib" Type="Bool">false</Property>
            <Property Name="ExcludeUserLib" Type="Bool">false</Property>
            <Property Name="ExcludeVILIB" Type="Bool">false</Property>
            <Property Name="Path[0]" Type="Path">../../ni-rt/startup/Dynamic VIs</Property>
            <Property Name="Path[1]" Type="Path">../../ni-rt/startup/Dynamic VIs/data</Property>
            <Property Name="SourceInfoItemCount" Type="Int">113</Property>
            <Property Name="SourceItem[0].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[0].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[0].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[0].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[0].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[0].ItemID" Type="Ref">/My Computer/Host</Property>
            <Property Name="SourceItem[0].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[1].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[1].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[1].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[1].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[1].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[1].ItemID" Type="Ref">/My Computer/Host/Amplifiers</Property>
            <Property Name="SourceItem[1].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[10].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[10].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[10].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[10].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[10].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B GAIN.ctl</Property>
            <Property Name="SourceItem[10].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[100].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[100].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[100].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[100].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[100].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/Telegraph from Amp.</Property>
            <Property Name="SourceItem[100].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[101].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[101].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[101].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[101].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[101].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/Telegraph to Amp.</Property>
            <Property Name="SourceItem[101].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[102].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[102].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[102].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[102].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[102].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/AmplifierVI</Property>
            <Property Name="SourceItem[102].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[103].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[103].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[103].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[103].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[103].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ExpModuleVI</Property>
            <Property Name="SourceItem[103].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[104].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[104].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[104].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[104].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[104].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/TimeStamp</Property>
            <Property Name="SourceItem[104].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[105].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[105].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[105].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[105].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[105].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ExitTargetApp</Property>
            <Property Name="SourceItem[105].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[106].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[106].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[106].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.vi</Property>
            <Property Name="SourceItem[106].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[107].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[107].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[107].ItemID" Type="Ref">/My Computer/Target/G-clamp v2.nce</Property>
            <Property Name="SourceItem[107].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[108].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[108].FolderInclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[108].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[108].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[108].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[108].ItemID" Type="Ref">/My Computer/OfflineUtilities</Property>
            <Property Name="SourceItem[108].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[109].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[109].FolderInclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[109].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[109].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[109].ItemID" Type="Ref">/My Computer/OfflineUtilities/G-clamp File Utilities.llb</Property>
            <Property Name="SourceItem[109].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[11].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[11].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[11].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[11].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[11].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B FILTER kHz.ctl</Property>
            <Property Name="SourceItem[11].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[110].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[110].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[110].ItemID" Type="Ref">/My Computer/G-clamp v2 Programming Documentation.doc</Property>
            <Property Name="SourceItem[110].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[111].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[111].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[111].ItemID" Type="Ref">/My Computer/CreateCondTemplate (SubVI).vi</Property>
            <Property Name="SourceItem[111].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[112].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[112].Inclusion" Type="Str">Always Exclude</Property>
            <Property Name="SourceItem[112].ItemID" Type="Ref">/My Computer/G-clamp v2_1 User Manual.doc</Property>
            <Property Name="SourceItem[112].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[12].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[12].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[12].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[12].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[12].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B Cmembrane.ctl</Property>
            <Property Name="SourceItem[12].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[13].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[13].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[13].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[13].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[13].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B MODE.ctl</Property>
            <Property Name="SourceItem[13].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[14].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[14].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[14].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[14].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[14].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 Host.vi</Property>
            <Property Name="SourceItem[14].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[15].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[15].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[15].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[15].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[15].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 MODE.ctl</Property>
            <Property Name="SourceItem[15].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[16].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[16].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[16].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[16].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[16].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 Cmembrane.ctl</Property>
            <Property Name="SourceItem[16].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[17].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[17].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[17].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[17].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[17].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 FILTER kHz.ctl</Property>
            <Property Name="SourceItem[17].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[18].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[18].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[18].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[18].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[18].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Model 2400 GAIN.ctl</Property>
            <Property Name="SourceItem[18].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[19].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[19].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[19].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[19].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[19].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Host.vi</Property>
            <Property Name="SourceItem[19].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[2].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[2].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[2].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[2].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[2].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[2].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files</Property>
            <Property Name="SourceItem[2].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[20].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[20].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[20].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[20].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[20].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[20].ItemID" Type="Ref">/My Computer/Host/ExpModules</Property>
            <Property Name="SourceItem[20].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[21].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[21].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[21].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[21].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[21].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[21].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[22].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[22].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[22].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[22].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[22].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Host.cfg</Property>
            <Property Name="SourceItem[22].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[23].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[23].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[23].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[23].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[23].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Parameters.ctl</Property>
            <Property Name="SourceItem[23].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[24].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[24].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[24].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[24].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[24].ItemID" Type="Ref">/My Computer/Host/ExpModules/Vclamp - Host.vi</Property>
            <Property Name="SourceItem[24].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[25].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[25].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[25].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[25].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[25].ItemID" Type="Ref">/My Computer/Host/ExpModules/Threshold Gsyn - Host.vi</Property>
            <Property Name="SourceItem[25].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[26].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[26].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[26].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[26].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[26].ItemID" Type="Ref">/My Computer/Host/ExpModules/Threshold Gsyn - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[26].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[27].ApplyDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[27].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[27].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[27].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[27].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[27].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[27].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib</Property>
            <Property Name="SourceItem[27].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[28].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[28].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[28].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[28].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[28].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[28].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Vclamp - Parameters</Property>
            <Property Name="SourceItem[28].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[29].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[29].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[29].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[29].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[29].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[29].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Threshold Gsyn - Parameters</Property>
            <Property Name="SourceItem[29].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[3].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[3].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[3].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[3].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[3].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.pdf</Property>
            <Property Name="SourceItem[3].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[30].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[30].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[30].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[30].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[30].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[30].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters2</Property>
            <Property Name="SourceItem[30].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[31].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[31].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[31].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[31].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[31].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[31].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters</Property>
            <Property Name="SourceItem[31].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[32].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[32].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[32].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[32].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[32].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[32].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/StripChart - Parameters</Property>
            <Property Name="SourceItem[32].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[33].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[33].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[33].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[33].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[33].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[33].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/StripChart - Parameters2</Property>
            <Property Name="SourceItem[33].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[34].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[34].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[34].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[34].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[34].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[34].ItemID" Type="Ref">/My Computer/Host/ExpModules/ExpModules Variables.lvlib/Synaptic Gain - Parameters3</Property>
            <Property Name="SourceItem[34].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[35].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[35].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[35].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[35].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[35].ItemID" Type="Ref">/My Computer/Host/ExpModules/Synaptic Gain - SaveData (SubVI).vi</Property>
            <Property Name="SourceItem[35].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[36].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[36].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[36].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[36].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[36].ItemID" Type="Ref">/My Computer/Host/ExpModules/StripChart - Host.vi</Property>
            <Property Name="SourceItem[36].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[37].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[37].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[37].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[37].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[37].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.vi</Property>
            <Property Name="SourceItem[37].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[38].ApplyDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[38].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[38].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[38].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[38].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[38].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[38].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib</Property>
            <Property Name="SourceItem[38].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[39].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[39].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[39].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[39].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[39].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[39].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[39].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs</Property>
            <Property Name="SourceItem[39].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[4].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[4].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[4].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[4].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[4].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.dll</Property>
            <Property Name="SourceItem[4].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[40].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[40].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[40].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[40].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[40].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[40].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/SynCond LV 2-style Global.vi</Property>
            <Property Name="SourceItem[40].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[41].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[41].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[41].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[41].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[41].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[41].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/SynapticConductanceEditor.vi</Property>
            <Property Name="SourceItem[41].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[42].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[42].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[42].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[42].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[42].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[42].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Seal Test - Host.vi</Property>
            <Property Name="SourceItem[42].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[43].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[43].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[43].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[43].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[43].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[43].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Membrane Test - Host.vi</Property>
            <Property Name="SourceItem[43].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[44].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[44].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[44].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[44].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[44].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[44].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/IP DataBuffer LV 2-style Global.vi</Property>
            <Property Name="SourceItem[44].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[45].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[45].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[45].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[45].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[45].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[45].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Create Plugin List.vi</Property>
            <Property Name="SourceItem[45].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[46].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[46].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[46].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[46].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[46].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[46].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Bridge Test - Host.vi</Property>
            <Property Name="SourceItem[46].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[47].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[47].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[47].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[47].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[47].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[47].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/ConfigFileOps.vi</Property>
            <Property Name="SourceItem[47].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[48].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[48].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[48].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[48].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[48].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[48].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/VIs/Message.vi</Property>
            <Property Name="SourceItem[48].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[49].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[49].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[49].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[49].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[49].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[49].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[49].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables</Property>
            <Property Name="SourceItem[49].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[5].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[5].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[5].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[5].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[5].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.h</Property>
            <Property Name="SourceItem[5].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[50].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[50].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[50].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[50].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[50].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[50].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Abort Experiment</Property>
            <Property Name="SourceItem[50].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[51].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[51].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[51].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[51].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[51].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[51].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Bridge Test - Parameters</Property>
            <Property Name="SourceItem[51].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[52].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[52].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[52].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[52].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[52].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[52].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Membrane Test - Parameters</Property>
            <Property Name="SourceItem[52].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[53].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[53].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[53].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[53].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[53].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[53].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Seal Test - Paramters</Property>
            <Property Name="SourceItem[53].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[54].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[54].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[54].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[54].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[54].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[54].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/RT Loop Info</Property>
            <Property Name="SourceItem[54].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[55].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[55].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[55].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[55].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[55].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[55].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Stop Host Amplifier VI</Property>
            <Property Name="SourceItem[55].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[56].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[56].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[56].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[56].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[56].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[56].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Log</Property>
            <Property Name="SourceItem[56].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[57].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[57].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[57].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[57].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[57].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[57].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/LogFile</Property>
            <Property Name="SourceItem[57].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[58].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[58].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[58].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[58].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[58].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[58].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Save Data</Property>
            <Property Name="SourceItem[58].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[59].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[59].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[59].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[59].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[59].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[59].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/DataDirectory</Property>
            <Property Name="SourceItem[59].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[6].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[6].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[6].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[6].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[6].ItemID" Type="Ref">/My Computer/Host/Amplifiers/MultiClamp 700B Files/AxMultiClampMsg.lib</Property>
            <Property Name="SourceItem[6].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[60].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[60].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[60].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[60].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[60].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[60].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Virtual G's</Property>
            <Property Name="SourceItem[60].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[61].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[61].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[61].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[61].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[61].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[61].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Telegraph to Amp.</Property>
            <Property Name="SourceItem[61].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[62].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[62].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[62].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[62].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[62].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[62].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Virtual G's.ctl</Property>
            <Property Name="SourceItem[62].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[63].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[63].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[63].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[63].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[63].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[63].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Membrane_Seal_Bridge Test - Parameters.ctl</Property>
            <Property Name="SourceItem[63].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[64].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[64].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[64].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[64].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[64].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[64].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/RT Loop Info.ctl</Property>
            <Property Name="SourceItem[64].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[65].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[65].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[65].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[65].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[65].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[65].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Progress</Property>
            <Property Name="SourceItem[65].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[66].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[66].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[66].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[66].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[66].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[66].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/DataFile</Property>
            <Property Name="SourceItem[66].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[67].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[67].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[67].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[67].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[67].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[67].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/Telegraph from Amp.</Property>
            <Property Name="SourceItem[67].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[68].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[68].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[68].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[68].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[68].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[68].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ChannelInfo</Property>
            <Property Name="SourceItem[68].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[69].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[69].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[69].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[69].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[69].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[69].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ChannelInfo.ctl</Property>
            <Property Name="SourceItem[69].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[7].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[7].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[7].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[7].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[7].ItemID" Type="Ref">/My Computer/Host/Amplifiers/AxoClamp 2B Host.vi</Property>
            <Property Name="SourceItem[7].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[70].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[70].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[70].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[70].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[70].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[70].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/MessageStop</Property>
            <Property Name="SourceItem[70].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[71].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[71].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[71].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[71].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[71].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[71].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/Variables/ExtDevice - Parameters</Property>
            <Property Name="SourceItem[71].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[72].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[72].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[72].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[72].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[72].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[72].ItemID" Type="Ref"></Property>
            <Property Name="SourceItem[72].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[73].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[73].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[73].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[73].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[73].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[73].ItemID" Type="Ref"></Property>
            <Property Name="SourceItem[73].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[74].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[74].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[74].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[74].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[74].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[74].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/G-clamp v2 Host.cfg</Property>
            <Property Name="SourceItem[74].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[75].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[75].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[75].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[75].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[75].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[75].ItemID" Type="Ref">/My Computer/Host/G-clamp v2 - Host.lvlib/G-clamp v2 - Host.rtm</Property>
            <Property Name="SourceItem[75].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[76].DisableDestination" Type="Bool">true</Property>
            <Property Name="SourceItem[76].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[76].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[76].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[76].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[76].ItemID" Type="Ref">/My Computer/Host/ExpModules/Synaptic Gain - Host.vi</Property>
            <Property Name="SourceItem[76].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[77].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[77].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[77].ItemID" Type="Ref">/My Computer/Target</Property>
            <Property Name="SourceItem[77].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[78].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[78].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[78].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[78].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[78].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[78].ItemID" Type="Ref">/My Computer/Target/Amplifiers</Property>
            <Property Name="SourceItem[78].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[79].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[79].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[79].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[79].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[79].ItemID" Type="Ref">/My Computer/Target/Amplifiers/AxoClamp 2B Target.vi</Property>
            <Property Name="SourceItem[79].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[8].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[8].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[8].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[8].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[8].ItemID" Type="Ref">/My Computer/Host/Amplifiers/AxoClamp 2B - Mode.ctl</Property>
            <Property Name="SourceItem[8].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[80].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[80].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[80].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[80].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[80].ItemID" Type="Ref">/My Computer/Target/Amplifiers/Axopatch 200B Target.vi</Property>
            <Property Name="SourceItem[80].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[81].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[81].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[81].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[81].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[81].ItemID" Type="Ref">/My Computer/Target/Amplifiers/Model 2400 Target.vi</Property>
            <Property Name="SourceItem[81].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[82].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[82].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[82].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[82].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[82].ItemID" Type="Ref">/My Computer/Target/Amplifiers/MultiClamp 700B Target.vi</Property>
            <Property Name="SourceItem[82].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[83].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[83].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[83].ItemID" Type="Ref">/My Computer/Target/ExpModules</Property>
            <Property Name="SourceItem[83].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[84].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[84].ItemID" Type="Ref">/My Computer/Target/ExpModules/Seal Test - Target.vi</Property>
            <Property Name="SourceItem[84].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[85].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[85].ItemID" Type="Ref">/My Computer/Target/ExpModules/Membrane Test - Target.vi</Property>
            <Property Name="SourceItem[85].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[86].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[86].ItemID" Type="Ref">/My Computer/Target/ExpModules/Bridge Test - Target.vi</Property>
            <Property Name="SourceItem[86].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[87].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[87].ItemID" Type="Ref">/My Computer/Target/ExpModules/Vclamp - Target.vi</Property>
            <Property Name="SourceItem[87].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[88].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[88].ItemID" Type="Ref">/My Computer/Target/ExpModules/Threshold Gsyn - Target.vi</Property>
            <Property Name="SourceItem[88].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[89].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[89].ItemID" Type="Ref">/My Computer/Target/ExpModules/Synaptic Gain - Target.vi</Property>
            <Property Name="SourceItem[89].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[9].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[9].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[9].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[9].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[9].ItemID" Type="Ref">/My Computer/Host/Amplifiers/Axopatch 200B Host.vi</Property>
            <Property Name="SourceItem[9].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[90].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[90].ItemID" Type="Ref">/My Computer/Target/ExpModules/StripChart - Target.vi</Property>
            <Property Name="SourceItem[90].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[91].ApplyInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[91].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[91].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[91].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[91].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[91].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib</Property>
            <Property Name="SourceItem[91].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[92].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[92].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[92].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[92].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[92].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[92].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs</Property>
            <Property Name="SourceItem[92].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[93].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[93].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[93].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[93].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[93].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/rt fifo.ctl</Property>
            <Property Name="SourceItem[93].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[94].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[94].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[94].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[94].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[94].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/RT FIFO LV 2-style Global.vi</Property>
            <Property Name="SourceItem[94].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[95].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[95].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[95].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[95].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[95].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/Boolean LV 2-style Global.vi</Property>
            <Property Name="SourceItem[95].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[96].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[96].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[96].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[96].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[96].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/VIs/GetMemoryStats.vi</Property>
            <Property Name="SourceItem[96].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[97].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[97].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[97].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[97].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[97].IsFolder" Type="Bool">true</Property>
            <Property Name="SourceItem[97].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables</Property>
            <Property Name="SourceItem[97].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[98].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[98].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[98].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[98].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[98].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/ErrorCluster</Property>
            <Property Name="SourceItem[98].TopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[99].DisableInclusion" Type="Bool">true</Property>
            <Property Name="SourceItem[99].FolderInclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[99].FolderTopLevelVI" Type="Str">Never</Property>
            <Property Name="SourceItem[99].Inclusion" Type="Str">As Needed</Property>
            <Property Name="SourceItem[99].ItemID" Type="Ref">/My Computer/Target/G-clamp v2 - Target.lvlib/Variables/SystemInfo</Property>
            <Property Name="SourceItem[99].TopLevelVI" Type="Str">Never</Property>
         </Item>
      </Item>
   </Item>
   <Item Name="G-clamp2" Type="RT PXI Chassis">
      <Property Name="alias.name" Type="Str">G-clamp2</Property>
      <Property Name="alias.value" Type="Str">136.142.127.246</Property>
      <Property Name="CCSymbols" Type="Str">OS,PharLap;CPU,x86;TARGET_TYPE,RT;</Property>
      <Property Name="host.TargetCPUID" Type="UInt">3</Property>
      <Property Name="host.TargetOSID" Type="UInt">15</Property>
      <Property Name="target.cleanupVisa" Type="Bool">true</Property>
      <Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
      <Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
      <Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
      <Property Name="target.IsRemotePanelSupported" Type="Bool">true</Property>
      <Property Name="target.RTTarget.ApplicationPath" Type="Path">/c/ni-rt/startup/startup.rtexe</Property>
      <Property Name="target.RTTarget.EnableFileSharing" Type="Bool">true</Property>
      <Property Name="target.RTTarget.IPAccess" Type="Str">+*</Property>
      <Property Name="target.RTTarget.LaunchAppAtBoot" Type="Bool">false</Property>
      <Property Name="target.RTTarget.VIPath" Type="Path">/c/ni-rt/startup</Property>
      <Property Name="target.server.app.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="target.server.control.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="target.server.tcp.access" Type="Str">+*</Property>
      <Property Name="target.server.tcp.enabled" Type="Bool">true</Property>
      <Property Name="target.server.tcp.paranoid" Type="Bool">true</Property>
      <Property Name="target.server.tcp.port" Type="Int">3363</Property>
      <Property Name="target.server.tcp.serviceName" Type="Str"></Property>
      <Property Name="target.server.tcp.serviceName.default" Type="Str">Main Application Instance/VI Server</Property>
      <Property Name="target.server.vi.access" Type="Str">+*</Property>
      <Property Name="target.server.vi.callsEnabled" Type="Bool">true</Property>
      <Property Name="target.server.vi.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="target.WebServer.Enabled" Type="Bool">false</Property>
      <Property Name="target.WebServer.LogEnabled" Type="Bool">false</Property>
      <Property Name="target.WebServer.LogPath" Type="Path">/c/ni-rt/system/www/www.log</Property>
      <Property Name="target.WebServer.Port" Type="Int">80</Property>
      <Property Name="target.WebServer.RootPath" Type="Path">/c/ni-rt/system/www</Property>
      <Property Name="target.WebServer.TcpAccess" Type="Str">c+*</Property>
      <Property Name="target.WebServer.Timeout" Type="Int">60</Property>
      <Property Name="target.WebServer.ViAccess" Type="Str">+*</Property>
      <Item Name="Dependencies" Type="Dependencies"/>
      <Item Name="Build Specifications" Type="Build"/>
   </Item>
</Project>
