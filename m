Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Live Migration of Virtio Virtual Function
Date: Thu, 12 Aug 2021 12:08:41 +0000
Message-ID: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99DM4PR12MB5040namp_"
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99DM4PR12MB5040namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
Live migration is one of the most important features of virtualization and =
virtio devices are oftenly found in virtual environments.

The migration process is managed by a migration SW that is running on the h=
ypervisor and the VM is not aware of the process at all.

Unlike the vDPA case, a real pci Virtual Function state resides in the HW.

In our vision, in order to fulfil the Live migration requirements for virtu=
al functions, each physical function device must implement migration operat=
ions. Using these operations, it will be able to master the migration proce=
ss for the virtual function devices. Each capable physical function device =
has a supervisor permissions to change the virtual function operational sta=
tes, save/restore its internal state and start/stop dirty pages tracking.

An example of this approach can be seen in the way NVIDIA performs live mig=
ration of a ConnectX NIC function:
https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci

NVIDIAs SNAP technology enables hardware-accelerated software defined PCIe =
devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage and networki=
ng solutions. The host OS/hypervisor uses its standard drivers that are imp=
lemented according to a well-known VIRTIO specifications.

In order to implement Live Migration for these virtual function devices, th=
at use a standard drivers as mentioned, the specification should define how=
 HW vendor should build their devices and for SW developers to adjust the d=
rivers.
This will enable specification compliant vendor agnostic solution.

This is exactly how we built the migration driver for ConnectX (internal HW=
 design doc) and I guess that this is the way other vendors work.

For that, I would like to know if the approach of "PF that controls the VF =
live migration process" is acceptable by the VIRTIO technical group ?

Cheers,
-Max.

--_000_DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99DM4PR12MB5040namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">Live migration is one of the most important features=
 of virtualization and virtio devices are oftenly found in virtual environm=
ents.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The migration process is managed by a migration SW t=
hat is running on the hypervisor and the VM is not aware of the process at =
all.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Unlike the vDPA case, a real pci Virtual Function st=
ate resides in the HW.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In our vision, in order to fulfil the Live migration=
 requirements for virtual functions, each physical function device must imp=
lement migration operations. Using these operations, it will be able to mas=
ter the migration process for the
 virtual function devices. Each capable physical function device has a supe=
rvisor permissions to change the virtual function operational states, save/=
restore its internal state and start/stop dirty pages tracking.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">An example of this approach can be seen in the way N=
VIDIA performs live migration of a ConnectX NIC function:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/jgunthorpe/linux/commi=
ts/mlx5_vfio_pci">https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci=
</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">NVIDIAs SNAP technology enables hardware-accelerated=
 software defined PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used f=
or storage and networking solutions. The host OS/hypervisor uses its standa=
rd drivers that are implemented according
 to a well-known VIRTIO specifications.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In order to implement Live Migration for these virtu=
al function devices, that use a standard drivers as mentioned, the specific=
ation should define how HW vendor should build their devices and for SW dev=
elopers to adjust the drivers.<o:p></o:p></p>
<p class=3D"MsoNormal">This will enable specification compliant vendor agno=
stic solution.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is exactly how we built the migration driver fo=
r ConnectX (internal HW design doc) and I guess that this is the way other =
vendors work.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For that, I would like to know if the approach of &#=
8220;PF that controls the VF live migration process&#8221; is acceptable by=
 the VIRTIO technical group ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">-Max.<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99DM4PR12MB5040namp_--

