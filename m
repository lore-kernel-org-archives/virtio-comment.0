Return-Path: <virtio-comment-return-2659-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95B27986590
	for <virtio-comment@lists.oasis-open.org>; Fri, 28 Jan 2022 03:19:03 +0000 (UTC)
MIME-Version: 1.0
References: <20220124093918.34371-1-mgurtovoy@nvidia.com> <20220124093918.34371-2-mgurtovoy@nvidia.com>
 <1b77bbb8-a488-a2a8-1374-b8691356ac15@redhat.com> <7baddbd5-71af-d207-3e61-a842b5844fa0@nvidia.com>
 <CACGkMEv48vLgR9Ok9AB-yf1eURo_8w6HyqiKKxyavGwKpK2mSQ@mail.gmail.com> <ce62cf49-893b-ad59-7759-c5e5ad940aae@nvidia.com>
In-Reply-To: <ce62cf49-893b-ad59-7759-c5e5ad940aae@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Jan 2022 11:18:42 +0800
Message-ID: <CACGkMEv_E7h2dJ1Wu0f0+ABwjHcRzarWSQwQbPi=MEJQpyXZ9w@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2 1/4] Add virtio Admin Virtqueue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 27, 2022 at 10:47 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>
> On 1/27/2022 3:03 PM, Jason Wang wrote:
> > On Thu, Jan 27, 2022 at 6:25 PM Max Gurtovoy <mgurtovoy@nvidia.com> wro=
te:
> >>
> >> On 1/27/2022 5:14 AM, Jason Wang wrote:
> >>> =E5=9C=A8 2022/1/24 =E4=B8=8B=E5=8D=885:39, Max Gurtovoy =E5=86=99=E9=
=81=93:
> >>>> In one of the many use cases a user wants to manipulate features and
> >>>> configuration of the virtio devices regardless of the device type
> >>>> (net/block/console). Some of this configuration is generic enough. i=
.e
> >>>> Number of MSI-X vectors of a virtio PCI VF device. There is a need t=
o do
> >>>> such features query and manipulation by its parent PCI PF.
> >>>>
> >>>> Currently virtio specification defines control virtqueue to manipula=
te
> >>>> features and configuration of the device it operates on. However,
> >>>> control virtqueue commands are device type specific, which makes it =
very
> >>>> difficult to extend for device agnostic commands.
> >>>>
> >>>> To support this requirement in elegant way, this patch introduces a =
new
> >>>> admin virtqueue. Admin virtqueue will use the same command format fo=
r
> >>>> all
> >>>> types of virtio devices.
> >>>>
> >>>> Manipulate features via admin virtqueue is asynchronous, scalable, e=
asy
> >>>> to extend and doesn't require additional and expensive on-die resour=
ces
> >>>> to be allocated for every new feature that will be added in the futu=
re.
> >>>>
> >>>> Subsequent patches make use of this admin virtqueue.
> >>>>
> >>>> Reviewed-by: Parav Pandit <parav@nvidia.com>
> >>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> >>>> ---
> >>>>    admin-virtq.tex | 89 ++++++++++++++++++++++++++++++++++++++++++++=
+++++
> >>>>    content.tex     |  9 +++--
> >>>>    2 files changed, 96 insertions(+), 2 deletions(-)
> >>>>    create mode 100644 admin-virtq.tex
> >>>>
> >>>> diff --git a/admin-virtq.tex b/admin-virtq.tex
> >>>> new file mode 100644
> >>>> index 0000000..1a41c22
> >>>> --- /dev/null
> >>>> +++ b/admin-virtq.tex
> >>>> @@ -0,0 +1,89 @@
> >>>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio
> >>>> Device / Admin Virtqueues}
> >>>> +
> >>>> +Admin virtqueue is used to send administrative commands to manipula=
te
> >>>> +various features of the device and/or to manipulate various feature=
s,
> >>>> +if possible, of another device within the same group (e.g. PCI VFs =
of
> >>>> +a parent PCI PF device are grouped together. These devices can be
> >>>> +optionally managed by its parent PCI PF using its admin virtqueue.)=
.
> >>>> +
> >>>> +Use of Admin virtqueue is negotiated by the VIRTIO_F_ADMIN_VQ
> >>>> +feature bit.
> >>>> +
> >>>> +Admin virtqueue index may vary among different device types.
> >>>> +
> >>>> +Regardless of device offering VIRTIO_F_IN_ORDER, admin queue comman=
d
> >>>> buffers
> >>>> +are used by the device in out of order manner.
> >>>> +
> >>>> +The Admin command set defines the commands that may be issued only
> >>>> to the admin
> >>>> +virtqueue. Each virtio device that advertises the VIRTIO_F_ADMIN_VQ
> >>>> feature, MUST
> >>>> +support all the mandatory admin commands. A device MAY support also
> >>>> one or more
> >>>> +optional admin commands. All commands are of the following form:
> >>>
> >>> Do we need a way for advertising the supported optional commands (or
> >>> features bits)? Otherwise dealing with the compatibility will result
> >>> of per command probing.
> >>>
> >>>
> >>>> +
> >>>> +\begin{lstlisting}
> >>>> +struct virtio_admin_cmd {
> >>>> +        /* Device-readable part */
> >>>> +        u16 command;
> >>>
> >>> Two questions:
> >>>
> >>> 1) It looks to me it's better to have a explicit device_id here other
> >>> than embed it in each command
> >> this was already discussed.
> >>
> >> We agreed that some commands are not referring to different device so
> >> no, we don't need to put it in generic structure.
> >>
> >> I'm not against putting such id but we don't have an exact idea how wi=
ll
> >> SF device_id will look like.
> >>
> >> Maybe it will be some 128 bit uuid ? maybe u64 ?
> > How do you know u16 is sufficient for command?
>
> it's sufficient for VFs and this is the subject of the proposed commands.

So VIRTIO_ADMIN_CAPS_IDENTIFY maps to 3 commands:

VIRTIO_ADMIN_PCI_SRIOV_ATTRS,
VIRTIO_ADMIN_PCI_VF_INTERRUPT_CONFIG_SET,
VIRTIO_ADMIN_PCI_VF_INTERRUPT_CONFIG_GET

Unless you do 1:1 mapping between cap bit and command, you will be
short of commands if you're using u16.

>
> When you'll add SF to virtio spec we'll create new commands for it with
> SF_id.
>
> Again, this was discussed with Parav in V1 and was close. Please don't
> re-open.

I don't think so, you can reserve a special device id for the PF itself.

>
> >
> >>   how can we guess ?
> > You know it's you but not me that tries to propose this solution, right=
?
> I'm proposing a solution but you ask questions that we answer but
> somehow they are asked again.
> >
> >>
> >>> 2) virtio-net cvq use class/command which seems more elegant, e.g all
> >>> commands belongs to MSI could be grouped into the same class
> >> why can't we do it in u16 command opcode ?
> > Where did you see I say you can't use u16?
>
> you suggest to replace it to class + command.
>
> I don't understand why.
>
> If it's not mandatory, please ack.
>
>
> >
> >> are you open for changes or
> >> should we copy/paste from net cvq ?
> > Net cvq comes first, it's natural to ask why you do things differently.
>
> I answered why.
>
> Admin command set has a different purpose.
>
> >
> >> Let's ask differently. Why we need class/command structure ? why is it
> >> more elegant ?
> > Don't you see my reply above?
> >
> > "
> > commands belongs to MSI could be grouped into the same class
> > "
>
> It's doesn't explain why class A + commands 1, 2 is better than opcodes
> 1 + 2 without a class.

Well, if you read how cvq work it's not hard to get the conclusion,

It's easier to be mapped to a feature bit. You just map a class and that's =
all.

Otherwise, you need to feature X:  command A,B,C,D ....

>
>
> >
> >>>
> >>>> +        u8 command_specific_data[];
> >>>> +
> >>>> +        /* Device-writable part */
> >>>> +        u8 status;
> >>>> +        u8 command_specific_error;
> >>>
> >>> I wonder the reason why not using a single field for the above two
> >>> fields. (Or any value for separating command specific error out, we
> >>> don't do that for virtio-net cvq).
> >> each command have its own specific errors.
> >>
> >> virtio net cvq is not generic - it's a net device cvqueue.
> > We're talking about the command format, not its semantics, right?
> >
> > It's command format is pretty general.
>
> in the Admin command set we would like to have better format that will
> allow users/drivers to better understand device error.
>
> It is very common in many HW devices and specs out there.
>
> I hope it doesn't critical for you as a concept.
>
> >
> >> To make it generic we need to separate.
> >>
> >>>
> >>>> +        u8 command_specific_result[];
> >>>> +};
> >>>> +\end{lstlisting}
> >>>> +
> >>>> +The following table describes the generic Admin status codes:
> >>>> +
> >>>> +\begin{tabular}{|l|l|l|}
> >>>> +\hline
> >>>> +Opcode & Status & Description \\
> >>>> +\hline \hline
> >>>> +00h   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
> >>>> +\hline
> >>>> +01h   & VIRTIO_ADMIN_STATUS_CS_ERR    & command specific error  \\
> >>>> +\hline
> >>>> +02h   & VIRTIO_ADMIN_STATUS_COMMAND_UNSUPPORTED    & unsupported or
> >>>> invalid opcode  \\
> >>>> +\hline
> >>>> +\end{tabular}
> >>>> +
> >>>> +The \field{command} and \field{command_specific_data} are
> >>>> +set by the driver, and the device sets the \field{status}, the
> >>>> +\field{command_specific_error} and the \field{command_specific_resu=
lt},
> >>>> +if needed.
> >>>> +
> >>>> +The \field{command_specific_error} should be inspected by the drive=
r
> >>>> only if \field{status} is set to
> >>>> +VIRTIO_ADMIN_STATUS_CS_ERR by the device. In this case, the content
> >>>> of \field{command_specific_error}
> >>>> +holds the command specific error. If \field{status} is not set to
> >>>> VIRTIO_ADMIN_STATUS_CS_ERR, the
> >>>> +\field{command_specific_error} value is undefined.
> >>>> +
> >>>> +The following table describes the Admin command set:
> >>>> +
> >>>> +\begin{tabular}{|l|l|l|}
> >>>> +\hline
> >>>> +Opcode & Command & M/O \\
> >>>> +\hline \hline
> >>>> +0000h   & VIRTIO_ADMIN_CAPS_IDENTIFY    & M  \\
> >>>> +\hline
> >>>> +0001h - 7FFFh   & Generic admin cmds    & -  \\
> >>>> +\hline
> >>>> +8000h - FFFFh   & Reserved    & - \\
> >>>> +\hline
> >>>> +\end{tabular}
> >>>
> >>> See above, I'd suggest to use class/command as virtio-net cvq.
> >> see my comment above.
> I answered above.
> >>>
> >>>> +
> >>>> +\subsection{VIRTIO ADMIN CAPS IDENTIFY command}\label{sec:Basic
> >>>> Facilities of a Virtio Device / Admin Virtqueues / VIRTIO ADMIN CAPS
> >>>> IDENTIFY command}
> >>>> +
> >>>> +The VIRTIO_ADMIN_CAPS_IDENTIFY command has no command specific data
> >>>> set by the driver.
> >>>> +This command upon success, returns a data buffer that describes
> >>>> information about the supported
> >>>> +admin capabilities by the device. This information is of form:
> >>>> +\begin{lstlisting}
> >>>> +struct virtio_admin_caps_identify_result {
> >>>> +       /*
> >>>> +        * caps[0] - Bit 0x0 - Bit 0x7 are reserved
> >>>> +        * caps[1] - Bit 0x0 - Bit 0x7 are reserved
> >>>> +        * caps[2] - Bit 0x0 - Bit 0x7 are reserved
> >>>> +        * ....
> >>>> +        * caps[8191] - Bit 0x0 - Bit 0x7 are reserved
> >>>> +        */
> >>>> +       u8 caps[8192];
> >>>> +};
> >>>
> >>> Ok, so I see the identify command. But I wonder if we can do that via
> >>> the feature bits?
> >> It doesn't scale. I tried it. It doesn't work.
> > What prevents you from improving the scalability instead of trying to
> > revinting a duplicated mechanism?
>
> It was already discussed.
>
> Spec doesn't scale, too many constrains between command-A,B,C and
> feature 44,45, 46 and for transport X, Y, Z.

What I meant is, if you feel the current feature negotiation doesn't
scale, you can improve it instead of reinventing it partially (e.g no
negotiation) .

Thanks

>
> >
> > Thanks
> >
> >>
> >> Thanks.
> >>
> >>> Thanks
> >>>
> >>>
> >>>> +\end{lstlisting}
> >>>> diff --git a/content.tex b/content.tex
> >>>> index 32de668..c524fab 100644
> >>>> --- a/content.tex
> >>>> +++ b/content.tex
> >>>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilitie=
s
> >>>> of a Virtio Device / Feature B
> >>>>    \begin{description}
> >>>>    \item[0 to 23] Feature bits for the specific device type
> >>>>    -\item[24 to 40] Feature bits reserved for extensions to the queu=
e and
> >>>> +\item[24 to 41] Feature bits reserved for extensions to the queue a=
nd
> >>>>      feature negotiation mechanisms
> >>>>    -\item[41 and above] Feature bits reserved for future extensions.
> >>>> +\item[42 and above] Feature bits reserved for future extensions.
> >>>>    \end{description}
> >>>>      \begin{note}
> >>>> @@ -449,6 +449,8 @@ \section{Exporting Objects}\label{sec:Basic
> >>>> Facilities of a Virtio Device / Expo
> >>>>    types. It is RECOMMENDED that devices generate version 4
> >>>>    UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> >>>>    +\input{admin-virtq.tex}
> >>>> +
> >>>>    \chapter{General Initialization And Device
> >>>> Operation}\label{sec:General Initialization And Device Operation}
> >>>>      We start with an overview of device initialization, then expand
> >>>> on the
> >>>> @@ -6847,6 +6849,9 @@ \chapter{Reserved Feature
> >>>> Bits}\label{sec:Reserved Feature Bits}
> >>>>      that the driver can reset a queue individually.
> >>>>      See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
> >>>> Virtqueue Reset}.
> >>>>    +  \item[VIRTIO_F_ADMIN_VQ (41)] This feature indicates that
> >>>> +  the device supports administration virtqueue negotiation.
> >>>> +
> >>>>    \end{description}
> >>>>      \drivernormative{\section}{Reserved Feature Bits}{Reserved
> >>>> Feature Bits}
> >>>
> >>> This publicly archived list offers a means to provide input to the
> >>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>
> >>> In order to verify user consent to the Feedback License terms and
> >>> to minimize spam in the list archive, subscription is required
> >>> before posting.
> >>>
> >>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>> List help: virtio-comment-help@lists.oasis-open.org
> >>> List archive:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgu=
rtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1b7=
db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat=
a=3DhkU2cd8o0F%2FTH%2F%2BHA8GQzVKZHPIDpuHBLMgVbjQSvN4%3D&amp;reserved=3D0
> >>> Feedback License:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3DjqtoxmxY5oMIJ8X4R%2FCADdAwYHFNP%2Fix%2Frue8xqf8%2F0%3D&amp;reserved=
=3D0
> >>> List Guidelines:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%=
7Cmgurtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp=
;sdata=3Da3bGp1iZqbK8dy2zMV3Umypft1kIL%2Bugjc8sZRZaX1M%3D&amp;reserved=3D0
> >>> Committee:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%4=
0nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1b7db39efd9=
ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DH5cM=
IMFYWJT1AVO9%2FLrJ8KDidyuFhuE%2Bb7xFTlKNDLI%3D&amp;reserved=3D0
> >>> Join OASIS:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cc=
8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%=
7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DRY2TmLGYxJLQkX6GQVU=
xXOL7GeoWR6EqL8kStesrmD0%3D&amp;reserved=3D0
> >>>
> >
> > This publicly archived list offers a means to provide input to the
> >
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >
> >
> > In order to verify user consent to the Feedback License terms and
> >
> > to minimize spam in the list archive, subscription is required
> >
> > before posting.
> >
> >
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >
> > List help: virtio-comment-help@lists.oasis-open.org
> >
> > List archive: https://nam11.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D0=
4%7C01%7Cmgurtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d=
15727340c1b7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000&amp;sdata=3DhkU2cd8o0F%2FTH%2F%2BHA8GQzVKZHPIDpuHBLMgVbjQSvN4%3D&amp;re=
served=3D0
> >
> > Feedback License: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;=
data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%=
7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000&amp;sdata=3DjqtoxmxY5oMIJ8X4R%2FCADdAwYHFNP%2Fix%2Frue8xqf8%2F0=
%3D&amp;reserved=3D0
> >
> > List Guidelines: https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;=
data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%=
7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000&amp;sdata=3Da3bGp1iZqbK8dy2zMV3Umypft1kIL%2Bugjc8sZRZaX1M%3D&am=
p;reserved=3D0
> >
> > Committee: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda=
ta=3DH5cMIMFYWJT1AVO9%2FLrJ8KDidyuFhuE%2Bb7xFTlKNDLI%3D&amp;reserved=3D0
> >
> > Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvid=
ia.com%7Cc8efa048a41e4be4d35508d9e195694e%7C43083d15727340c1b7db39efd9ccc17=
a%7C0%7C0%7C637788855745609706%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DRY2TmLGYx=
JLQkX6GQVUxXOL7GeoWR6EqL8kStesrmD0%3D&amp;reserved=3D0
> >
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

