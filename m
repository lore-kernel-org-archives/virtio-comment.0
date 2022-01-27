Return-Path: <virtio-comment-return-2654-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08D5D98650D
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 Jan 2022 10:25:37 +0000 (UTC)
Message-ID: <7baddbd5-71af-d207-3e61-a842b5844fa0@nvidia.com>
Date: Thu, 27 Jan 2022 12:25:23 +0200
MIME-Version: 1.0
References: <20220124093918.34371-1-mgurtovoy@nvidia.com>
 <20220124093918.34371-2-mgurtovoy@nvidia.com>
 <1b77bbb8-a488-a2a8-1374-b8691356ac15@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <1b77bbb8-a488-a2a8-1374-b8691356ac15@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2 1/4] Add virtio Admin Virtqueue
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 1/27/2022 5:14 AM, Jason Wang wrote:
>
> =E5=9C=A8 2022/1/24 =E4=B8=8B=E5=8D=885:39, Max Gurtovoy =E5=86=99=E9=81=
=93:
>> In one of the many use cases a user wants to manipulate features and
>> configuration of the virtio devices regardless of the device type
>> (net/block/console). Some of this configuration is generic enough. i.e
>> Number of MSI-X vectors of a virtio PCI VF device. There is a need to do
>> such features query and manipulation by its parent PCI PF.
>>
>> Currently virtio specification defines control virtqueue to manipulate
>> features and configuration of the device it operates on. However,
>> control virtqueue commands are device type specific, which makes it very
>> difficult to extend for device agnostic commands.
>>
>> To support this requirement in elegant way, this patch introduces a new
>> admin virtqueue. Admin virtqueue will use the same command format for=20
>> all
>> types of virtio devices.
>>
>> Manipulate features via admin virtqueue is asynchronous, scalable, easy
>> to extend and doesn't require additional and expensive on-die resources
>> to be allocated for every new feature that will be added in the future.
>>
>> Subsequent patches make use of this admin virtqueue.
>>
>> Reviewed-by: Parav Pandit <parav@nvidia.com>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> ---
>> =C2=A0 admin-virtq.tex | 89 ++++++++++++++++++++++++++++++++++++++++++++=
+++++
>> =C2=A0 content.tex=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++--
>> =C2=A0 2 files changed, 96 insertions(+), 2 deletions(-)
>> =C2=A0 create mode 100644 admin-virtq.tex
>>
>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>> new file mode 100644
>> index 0000000..1a41c22
>> --- /dev/null
>> +++ b/admin-virtq.tex
>> @@ -0,0 +1,89 @@
>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio=20
>> Device / Admin Virtqueues}
>> +
>> +Admin virtqueue is used to send administrative commands to manipulate
>> +various features of the device and/or to manipulate various features,
>> +if possible, of another device within the same group (e.g. PCI VFs of
>> +a parent PCI PF device are grouped together. These devices can be
>> +optionally managed by its parent PCI PF using its admin virtqueue.).
>> +
>> +Use of Admin virtqueue is negotiated by the VIRTIO_F_ADMIN_VQ
>> +feature bit.
>> +
>> +Admin virtqueue index may vary among different device types.
>> +
>> +Regardless of device offering VIRTIO_F_IN_ORDER, admin queue command=20
>> buffers
>> +are used by the device in out of order manner.
>> +
>> +The Admin command set defines the commands that may be issued only=20
>> to the admin
>> +virtqueue. Each virtio device that advertises the VIRTIO_F_ADMIN_VQ=20
>> feature, MUST
>> +support all the mandatory admin commands. A device MAY support also=20
>> one or more
>> +optional admin commands. All commands are of the following form:
>
>
> Do we need a way for advertising the supported optional commands (or=20
> features bits)? Otherwise dealing with the compatibility will result=20
> of per command probing.
>
>
>> +
>> +\begin{lstlisting}
>> +struct virtio_admin_cmd {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-readable part */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 command;
>
>
> Two questions:
>
> 1) It looks to me it's better to have a explicit device_id here other=20
> than embed it in each command

this was already discussed.

We agreed that some commands are not referring to different device so=20
no, we don't need to put it in generic structure.

I'm not against putting such id but we don't have an exact idea how will=20
SF device_id will look like.

Maybe it will be some 128 bit uuid ? maybe u64 ? how can we guess ?


>
> 2) virtio-net cvq use class/command which seems more elegant, e.g all=20
> commands belongs to MSI could be grouped into the same class

why can't we do it in u16 command opcode ? are you open for changes or=20
should we copy/paste from net cvq ?

Let's ask differently. Why we need class/command structure ? why is it=20
more elegant ?

>
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_data[];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-writable part */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 status;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_error;
>
>
> I wonder the reason why not using a single field for the above two=20
> fields. (Or any value for separating command specific error out, we=20
> don't do that for virtio-net cvq).

each command have its own specific errors.

virtio net cvq is not generic - it's a net device cvqueue.

To make it generic we need to separate.

>
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_result[]=
;
>> +};
>> +\end{lstlisting}
>> +
>> +The following table describes the generic Admin status codes:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Opcode & Status & Description \\
>> +\hline \hline
>> +00h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_OK=C2=A0=C2=A0=C2=A0 & successful=
 completion=C2=A0 \\
>> +\hline
>> +01h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_CS_ERR=C2=A0=C2=A0=C2=A0 & comman=
d specific error=C2=A0 \\
>> +\hline
>> +02h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_COMMAND_UNSUPPORTED=C2=A0=C2=A0=
=C2=A0 & unsupported or=20
>> invalid opcode=C2=A0 \\
>> +\hline
>> +\end{tabular}
>> +
>> +The \field{command} and \field{command_specific_data} are
>> +set by the driver, and the device sets the \field{status}, the
>> +\field{command_specific_error} and the \field{command_specific_result},
>> +if needed.
>> +
>> +The \field{command_specific_error} should be inspected by the driver=20
>> only if \field{status} is set to
>> +VIRTIO_ADMIN_STATUS_CS_ERR by the device. In this case, the content=20
>> of \field{command_specific_error}
>> +holds the command specific error. If \field{status} is not set to=20
>> VIRTIO_ADMIN_STATUS_CS_ERR, the
>> +\field{command_specific_error} value is undefined.
>> +
>> +The following table describes the Admin command set:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Opcode & Command & M/O \\
>> +\hline \hline
>> +0000h=C2=A0=C2=A0 & VIRTIO_ADMIN_CAPS_IDENTIFY=C2=A0=C2=A0=C2=A0 & M=C2=
=A0 \\
>> +\hline
>> +0001h - 7FFFh=C2=A0=C2=A0 & Generic admin cmds=C2=A0=C2=A0=C2=A0 & -=C2=
=A0 \\
>> +\hline
>> +8000h - FFFFh=C2=A0=C2=A0 & Reserved=C2=A0=C2=A0=C2=A0 & - \\
>> +\hline
>> +\end{tabular}
>
>
> See above, I'd suggest to use class/command as virtio-net cvq.

see my comment above.

>
>
>> +
>> +\subsection{VIRTIO ADMIN CAPS IDENTIFY command}\label{sec:Basic=20
>> Facilities of a Virtio Device / Admin Virtqueues / VIRTIO ADMIN CAPS=20
>> IDENTIFY command}
>> +
>> +The VIRTIO_ADMIN_CAPS_IDENTIFY command has no command specific data=20
>> set by the driver.
>> +This command upon success, returns a data buffer that describes=20
>> information about the supported
>> +admin capabilities by the device. This information is of form:
>> +\begin{lstlisting}
>> +struct virtio_admin_caps_identify_result {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[0] - Bit 0x0 - Bit 0x=
7 are reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[1] - Bit 0x0 - Bit 0x=
7 are reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[2] - Bit 0x0 - Bit 0x=
7 are reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ....
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[8191] - Bit 0x0 - Bit=
 0x7 are reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 caps[8192];
>> +};
>
>
> Ok, so I see the identify command. But I wonder if we can do that via=20
> the feature bits?

It doesn't scale. I tried it. It doesn't work.


Thanks.

>
> Thanks
>
>
>> +\end{lstlisting}
>> diff --git a/content.tex b/content.tex
>> index 32de668..c524fab 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities=20
>> of a Virtio Device / Feature B
>> =C2=A0 \begin{description}
>> =C2=A0 \item[0 to 23] Feature bits for the specific device type
>> =C2=A0 -\item[24 to 40] Feature bits reserved for extensions to the queu=
e and
>> +\item[24 to 41] Feature bits reserved for extensions to the queue and
>> =C2=A0=C2=A0=C2=A0 feature negotiation mechanisms
>> =C2=A0 -\item[41 and above] Feature bits reserved for future extensions.
>> +\item[42 and above] Feature bits reserved for future extensions.
>> =C2=A0 \end{description}
>> =C2=A0 =C2=A0 \begin{note}
>> @@ -449,6 +449,8 @@ \section{Exporting Objects}\label{sec:Basic=20
>> Facilities of a Virtio Device / Expo
>> =C2=A0 types. It is RECOMMENDED that devices generate version 4
>> =C2=A0 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>> =C2=A0 +\input{admin-virtq.tex}
>> +
>> =C2=A0 \chapter{General Initialization And Device=20
>> Operation}\label{sec:General Initialization And Device Operation}
>> =C2=A0 =C2=A0 We start with an overview of device initialization, then e=
xpand=20
>> on the
>> @@ -6847,6 +6849,9 @@ \chapter{Reserved Feature=20
>> Bits}\label{sec:Reserved Feature Bits}
>> =C2=A0=C2=A0=C2=A0 that the driver can reset a queue individually.
>> =C2=A0=C2=A0=C2=A0 See \ref{sec:Basic Facilities of a Virtio Device / Vi=
rtqueues /=20
>> Virtqueue Reset}.
>> =C2=A0 +=C2=A0 \item[VIRTIO_F_ADMIN_VQ (41)] This feature indicates that
>> +=C2=A0 the device supports administration virtqueue negotiation.
>> +
>> =C2=A0 \end{description}
>> =C2=A0 =C2=A0 \drivernormative{\section}{Reserved Feature Bits}{Reserved=
=20
>> Feature Bits}
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgurtov=
oy%40nvidia.com%7Ca448108b88d84d87023d08d9e143238e%7C43083d15727340c1b7db39=
efd9ccc17a%7C0%7C0%7C637788501921358048%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
SW%2FM98QZ7Av2wsv1NoekveDdQmlfWMYcvZQiFvpLcAE%3D&amp;reserved=3D0
> Feedback License:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
asis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cmgurt=
ovoy%40nvidia.com%7Ca448108b88d84d87023d08d9e143238e%7C43083d15727340c1b7db=
39efd9ccc17a%7C0%7C0%7C637788501921358048%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DC5D9qmFqbNrx7CoTzsx%2B9qalts534XPaImHlcszwm1M%3D&amp;reserved=3D0
> List Guidelines:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
asis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7Ca448108b88d84d87023d08d9e143238e%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637788501921358048%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda=
ta=3Dbi7OJDuH9CvoKdxtA01dn5SpZwDp3Bna4%2B00bVOuz2o%3D&amp;reserved=3D0
> Committee:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
asis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvi=
dia.com%7Ca448108b88d84d87023d08d9e143238e%7C43083d15727340c1b7db39efd9ccc1=
7a%7C0%7C0%7C637788501921358048%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DSdGNrxTU=
ZVIe2WJwb%2BdbT2UxagM9AdEzDWXccFvRE3s%3D&amp;reserved=3D0
> Join OASIS:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
asis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Ca4481=
08b88d84d87023d08d9e143238e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63=
7788501921358048%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DynKmp30vKJMw%2FL4IHbBFY=
9EebT%2BsVX2%2Boz7IIcO%2F1xg%3D&amp;reserved=3D0
>

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

