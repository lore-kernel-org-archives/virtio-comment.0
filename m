Return-Path: <virtio-comment-return-2750-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E9189863C3
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Feb 2022 11:43:56 +0000 (UTC)
Message-ID: <28ad66f8-48f7-2734-d018-bc30746b232a@nvidia.com>
Date: Wed, 9 Feb 2022 13:43:45 +0200
MIME-Version: 1.0
References: <20220124093918.34371-1-mgurtovoy@nvidia.com>
 <20220124093918.34371-2-mgurtovoy@nvidia.com>
 <1b77bbb8-a488-a2a8-1374-b8691356ac15@redhat.com>
 <7baddbd5-71af-d207-3e61-a842b5844fa0@nvidia.com>
 <CACGkMEv48vLgR9Ok9AB-yf1eURo_8w6HyqiKKxyavGwKpK2mSQ@mail.gmail.com>
 <ce62cf49-893b-ad59-7759-c5e5ad940aae@nvidia.com>
 <CACGkMEv_E7h2dJ1Wu0f0+ABwjHcRzarWSQwQbPi=MEJQpyXZ9w@mail.gmail.com>
 <2b3bd770-7ea4-e99b-9b00-3a2c386a3a04@nvidia.com>
 <5d081346-9c29-b508-d4a7-f31fcbd5bfd7@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <5d081346-9c29-b508-d4a7-f31fcbd5bfd7@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2 1/4] Add virtio Admin Virtqueue
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 2/9/2022 4:45 AM, Jason Wang wrote:
>
> =E5=9C=A8 2022/1/30 =E4=B8=8B=E5=8D=886:31, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> On 1/28/2022 5:18 AM, Jason Wang wrote:
>>> On Thu, Jan 27, 2022 at 10:47 PM Max Gurtovoy <mgurtovoy@nvidia.com>=20
>>> wrote:
>>>>
>>>> On 1/27/2022 3:03 PM, Jason Wang wrote:
>>>>> On Thu, Jan 27, 2022 at 6:25 PM Max Gurtovoy=20
>>>>> <mgurtovoy@nvidia.com> wrote:
>>>>>> On 1/27/2022 5:14 AM, Jason Wang wrote:
>>>>>>> =E5=9C=A8 2022/1/24 =E4=B8=8B=E5=8D=885:39, Max Gurtovoy =E5=86=99=
=E9=81=93:
>>>>>>>> In one of the many use cases a user wants to manipulate=20
>>>>>>>> features and
>>>>>>>> configuration of the virtio devices regardless of the device type
>>>>>>>> (net/block/console). Some of this configuration is generic=20
>>>>>>>> enough. i.e
>>>>>>>> Number of MSI-X vectors of a virtio PCI VF device. There is a=20
>>>>>>>> need to do
>>>>>>>> such features query and manipulation by its parent PCI PF.
>>>>>>>>
>>>>>>>> Currently virtio specification defines control virtqueue to=20
>>>>>>>> manipulate
>>>>>>>> features and configuration of the device it operates on. However,
>>>>>>>> control virtqueue commands are device type specific, which=20
>>>>>>>> makes it very
>>>>>>>> difficult to extend for device agnostic commands.
>>>>>>>>
>>>>>>>> To support this requirement in elegant way, this patch=20
>>>>>>>> introduces a new
>>>>>>>> admin virtqueue. Admin virtqueue will use the same command=20
>>>>>>>> format for
>>>>>>>> all
>>>>>>>> types of virtio devices.
>>>>>>>>
>>>>>>>> Manipulate features via admin virtqueue is asynchronous,=20
>>>>>>>> scalable, easy
>>>>>>>> to extend and doesn't require additional and expensive on-die=20
>>>>>>>> resources
>>>>>>>> to be allocated for every new feature that will be added in the=20
>>>>>>>> future.
>>>>>>>>
>>>>>>>> Subsequent patches make use of this admin virtqueue.
>>>>>>>>
>>>>>>>> Reviewed-by: Parav Pandit <parav@nvidia.com>
>>>>>>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>>>>>>> ---
>>>>>>>> =C2=A0=C2=A0=C2=A0 admin-virtq.tex | 89=20
>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>> =C2=A0=C2=A0=C2=A0 content.tex=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +=
++--
>>>>>>>> =C2=A0=C2=A0=C2=A0 2 files changed, 96 insertions(+), 2 deletions(=
-)
>>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 admin-virtq.tex
>>>>>>>>
>>>>>>>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..1a41c22
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/admin-virtq.tex
>>>>>>>> @@ -0,0 +1,89 @@
>>>>>>>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio
>>>>>>>> Device / Admin Virtqueues}
>>>>>>>> +
>>>>>>>> +Admin virtqueue is used to send administrative commands to=20
>>>>>>>> manipulate
>>>>>>>> +various features of the device and/or to manipulate various=20
>>>>>>>> features,
>>>>>>>> +if possible, of another device within the same group (e.g. PCI=20
>>>>>>>> VFs of
>>>>>>>> +a parent PCI PF device are grouped together. These devices can be
>>>>>>>> +optionally managed by its parent PCI PF using its admin=20
>>>>>>>> virtqueue.).
>>>>>>>> +
>>>>>>>> +Use of Admin virtqueue is negotiated by the VIRTIO_F_ADMIN_VQ
>>>>>>>> +feature bit.
>>>>>>>> +
>>>>>>>> +Admin virtqueue index may vary among different device types.
>>>>>>>> +
>>>>>>>> +Regardless of device offering VIRTIO_F_IN_ORDER, admin queue=20
>>>>>>>> command
>>>>>>>> buffers
>>>>>>>> +are used by the device in out of order manner.
>>>>>>>> +
>>>>>>>> +The Admin command set defines the commands that may be issued=20
>>>>>>>> only
>>>>>>>> to the admin
>>>>>>>> +virtqueue. Each virtio device that advertises the=20
>>>>>>>> VIRTIO_F_ADMIN_VQ
>>>>>>>> feature, MUST
>>>>>>>> +support all the mandatory admin commands. A device MAY support=20
>>>>>>>> also
>>>>>>>> one or more
>>>>>>>> +optional admin commands. All commands are of the following form:
>>>>>>> Do we need a way for advertising the supported optional commands=20
>>>>>>> (or
>>>>>>> features bits)? Otherwise dealing with the compatibility will=20
>>>>>>> result
>>>>>>> of per command probing.
>>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +\begin{lstlisting}
>>>>>>>> +struct virtio_admin_cmd {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-readable par=
t */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 command;
>>>>>>> Two questions:
>>>>>>>
>>>>>>> 1) It looks to me it's better to have a explicit device_id here=20
>>>>>>> other
>>>>>>> than embed it in each command
>>>>>> this was already discussed.
>>>>>>
>>>>>> We agreed that some commands are not referring to different=20
>>>>>> device so
>>>>>> no, we don't need to put it in generic structure.
>>>>>>
>>>>>> I'm not against putting such id but we don't have an exact idea=20
>>>>>> how will
>>>>>> SF device_id will look like.
>>>>>>
>>>>>> Maybe it will be some 128 bit uuid ? maybe u64 ?
>>>>> How do you know u16 is sufficient for command?
>>>> it's sufficient for VFs and this is the subject of the proposed=20
>>>> commands.
>>> So VIRTIO_ADMIN_CAPS_IDENTIFY maps to 3 commands:
>>>
>>> VIRTIO_ADMIN_PCI_SRIOV_ATTRS,
>>> VIRTIO_ADMIN_PCI_VF_INTERRUPT_CONFIG_SET,
>>> VIRTIO_ADMIN_PCI_VF_INTERRUPT_CONFIG_GET
>>>
>>> Unless you do 1:1 mapping between cap bit and command, you will be
>>> short of commands if you're using u16.
>>
>> 2^16 admin commands are more than enough.
>
>
> You introduce 65536 cap bits via identify. And you use u16 for command.
>
> But you map 3 commands to a single cap bit. You will be short of=20
> commands. Isn't it?

No we just don't use all the bits in the identify. Identify has 2^16=20
bits to be able to cover all we need.

>
>
>>
>>
>>>
>>>> When you'll add SF to virtio spec we'll create new commands for it=20
>>>> with
>>>> SF_id.
>>>>
>>>> Again, this was discussed with Parav in V1 and was close. Please don't
>>>> re-open.
>>> I don't think so, you can reserve a special device id for the PF=20
>>> itself.
>>
>> can you propose something concrete ?
>>
>> are you sure by 100% that sf_id is 32 bit ? can the TG ack on that ?
>
>
> I meant for command without and destination. You can reserve a special=20
> ID for that.
>
> Regarding the bit, if you think 32bit is not sufficient, let's just=20
> use 64bit, or reserving some bytes in the command.

So 64bit size is acked by TG for vdev_id ?


>
>
>>
>>>
>>>>>> =C2=A0=C2=A0 how can we guess ?
>>>>> You know it's you but not me that tries to propose this solution,=20
>>>>> right?
>>>> I'm proposing a solution but you ask questions that we answer but
>>>> somehow they are asked again.
>>>>>>> 2) virtio-net cvq use class/command which seems more elegant,=20
>>>>>>> e.g all
>>>>>>> commands belongs to MSI could be grouped into the same class
>>>>>> why can't we do it in u16 command opcode ?
>>>>> Where did you see I say you can't use u16?
>>>> you suggest to replace it to class + command.
>>>>
>>>> I don't understand why.
>>>>
>>>> If it's not mandatory, please ack.
>>>>
>>>>
>>>>>> are you open for changes or
>>>>>> should we copy/paste from net cvq ?
>>>>> Net cvq comes first, it's natural to ask why you do things=20
>>>>> differently.
>>>> I answered why.
>>>>
>>>> Admin command set has a different purpose.
>>>>
>>>>>> Let's ask differently. Why we need class/command structure ? why=20
>>>>>> is it
>>>>>> more elegant ?
>>>>> Don't you see my reply above?
>>>>>
>>>>> "
>>>>> commands belongs to MSI could be grouped into the same class
>>>>> "
>>>> It's doesn't explain why class A + commands 1, 2 is better than=20
>>>> opcodes
>>>> 1 + 2 without a class.
>>> Well, if you read how cvq work it's not hard to get the conclusion,
>>>
>>> It's easier to be mapped to a feature bit. You just map a class and=20
>>> that's all.
>>>
>>> Otherwise, you need to feature X:=C2=A0 command A,B,C,D ....
>>
>> But I just added one feature bit: the existence of the AQ.
>>
>> in your suggestion I'll need to add for each feature:
>>
>> Feature X can be negotiated only if AQ feature is negotiated.
>>
>> And if feature X will have a small extension so a new feature will be=20
>> needed and it will say:
>>
>> Feature Y can be negotiated in feature X and feature AQ are negotiated.
>>
>> or if feature X and feature Y are mutual exclusive then:
>>
>> feature X can't be negotiated if feature Y is negotiated.
>>
>> feature X can be negotiated only if feature AQ is negotiated.
>
>
> This is how virtqueue works for all the existing device. It's as=20
> simple as depending the feature to another feature which indicates the=20
> existing of a specific type of virtqueue.

It is not simple and not scale.

>
>
>>
>>
>> and this is a small example. We will have more and more Admin=20
>> functionality and this will be impossible to scale.
>>
>> A simple identify command solve this.
>>
>>>
>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_da=
ta[];
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-writable par=
t */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 status;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_er=
ror;
>>>>>>> I wonder the reason why not using a single field for the above two
>>>>>>> fields. (Or any value for separating command specific error out, we
>>>>>>> don't do that for virtio-net cvq).
>>>>>> each command have its own specific errors.
>>>>>>
>>>>>> virtio net cvq is not generic - it's a net device cvqueue.
>>>>> We're talking about the command format, not its semantics, right?
>>>>>
>>>>> It's command format is pretty general.
>>>> in the Admin command set we would like to have better format that will
>>>> allow users/drivers to better understand device error.
>>>>
>>>> It is very common in many HW devices and specs out there.
>>>>
>>>> I hope it doesn't critical for you as a concept.
>>>>
>>>>>> To make it generic we need to separate.
>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command_specific_re=
sult[];
>>>>>>>> +};
>>>>>>>> +\end{lstlisting}
>>>>>>>> +
>>>>>>>> +The following table describes the generic Admin status codes:
>>>>>>>> +
>>>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>>>> +\hline
>>>>>>>> +Opcode & Status & Description \\
>>>>>>>> +\hline \hline
>>>>>>>> +00h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_OK=C2=A0=C2=A0=C2=A0 & succ=
essful completion=C2=A0 \\
>>>>>>>> +\hline
>>>>>>>> +01h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_CS_ERR=C2=A0=C2=A0=C2=A0 & =
command specific=20
>>>>>>>> error=C2=A0 \\
>>>>>>>> +\hline
>>>>>>>> +02h=C2=A0=C2=A0 & VIRTIO_ADMIN_STATUS_COMMAND_UNSUPPORTED=C2=A0=
=C2=A0=C2=A0 &=20
>>>>>>>> unsupported or
>>>>>>>> invalid opcode=C2=A0 \\
>>>>>>>> +\hline
>>>>>>>> +\end{tabular}
>>>>>>>> +
>>>>>>>> +The \field{command} and \field{command_specific_data} are
>>>>>>>> +set by the driver, and the device sets the \field{status}, the
>>>>>>>> +\field{command_specific_error} and the=20
>>>>>>>> \field{command_specific_result},
>>>>>>>> +if needed.
>>>>>>>> +
>>>>>>>> +The \field{command_specific_error} should be inspected by the=20
>>>>>>>> driver
>>>>>>>> only if \field{status} is set to
>>>>>>>> +VIRTIO_ADMIN_STATUS_CS_ERR by the device. In this case, the=20
>>>>>>>> content
>>>>>>>> of \field{command_specific_error}
>>>>>>>> +holds the command specific error. If \field{status} is not set to
>>>>>>>> VIRTIO_ADMIN_STATUS_CS_ERR, the
>>>>>>>> +\field{command_specific_error} value is undefined.
>>>>>>>> +
>>>>>>>> +The following table describes the Admin command set:
>>>>>>>> +
>>>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>>>> +\hline
>>>>>>>> +Opcode & Command & M/O \\
>>>>>>>> +\hline \hline
>>>>>>>> +0000h=C2=A0=C2=A0 & VIRTIO_ADMIN_CAPS_IDENTIFY=C2=A0=C2=A0=C2=A0 =
& M \\
>>>>>>>> +\hline
>>>>>>>> +0001h - 7FFFh=C2=A0=C2=A0 & Generic admin cmds=C2=A0=C2=A0=C2=A0 =
& - \\
>>>>>>>> +\hline
>>>>>>>> +8000h - FFFFh=C2=A0=C2=A0 & Reserved=C2=A0=C2=A0=C2=A0 & - \\
>>>>>>>> +\hline
>>>>>>>> +\end{tabular}
>>>>>>> See above, I'd suggest to use class/command as virtio-net cvq.
>>>>>> see my comment above.
>>>> I answered above.
>>>>>>>> +
>>>>>>>> +\subsection{VIRTIO ADMIN CAPS IDENTIFY command}\label{sec:Basic
>>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / VIRTIO ADMIN=20
>>>>>>>> CAPS
>>>>>>>> IDENTIFY command}
>>>>>>>> +
>>>>>>>> +The VIRTIO_ADMIN_CAPS_IDENTIFY command has no command specific=20
>>>>>>>> data
>>>>>>>> set by the driver.
>>>>>>>> +This command upon success, returns a data buffer that describes
>>>>>>>> information about the supported
>>>>>>>> +admin capabilities by the device. This information is of form:
>>>>>>>> +\begin{lstlisting}
>>>>>>>> +struct virtio_admin_caps_identify_result {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[0] - Bit 0x0 - =
Bit 0x7 are reserved
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[1] - Bit 0x0 - =
Bit 0x7 are reserved
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[2] - Bit 0x0 - =
Bit 0x7 are reserved
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ....
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * caps[8191] - Bit 0x0=
 - Bit 0x7 are reserved
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 caps[8192];
>>>>>>>> +};
>>>>>>> Ok, so I see the identify command. But I wonder if we can do=20
>>>>>>> that via
>>>>>>> the feature bits?
>>>>>> It doesn't scale. I tried it. It doesn't work.
>>>>> What prevents you from improving the scalability instead of trying to
>>>>> revinting a duplicated mechanism?
>>>> It was already discussed.
>>>>
>>>> Spec doesn't scale, too many constrains between command-A,B,C and
>>>> feature 44,45, 46 and for transport X, Y, Z.
>>> What I meant is, if you feel the current feature negotiation doesn't
>>> scale, you can improve it instead of reinventing it partially (e.g no
>>> negotiation) .
>>
>> We're adding an identify command for the admin command set.
>>
>> did you review it ?
>
>
> Yes, but what I meant is that we've already had a feature negotiation=20
> mechanism. We should improve it instead of reinventing another one.

I've explained the scale issue.


>
> Thanks
>
>
>>
>>>
>>> Thanks
>>>
>>>>> Thanks
>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>
>>>>>>>> +\end{lstlisting}
>>>>>>>> diff --git a/content.tex b/content.tex
>>>>>>>> index 32de668..c524fab 100644
>>>>>>>> --- a/content.tex
>>>>>>>> +++ b/content.tex
>>>>>>>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic=20
>>>>>>>> Facilities
>>>>>>>> of a Virtio Device / Feature B
>>>>>>>> =C2=A0=C2=A0=C2=A0 \begin{description}
>>>>>>>> =C2=A0=C2=A0=C2=A0 \item[0 to 23] Feature bits for the specific de=
vice type
>>>>>>>> =C2=A0=C2=A0=C2=A0 -\item[24 to 40] Feature bits reserved for exte=
nsions to=20
>>>>>>>> the queue and
>>>>>>>> +\item[24 to 41] Feature bits reserved for extensions to the=20
>>>>>>>> queue and
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature negotiation mechanisms
>>>>>>>> =C2=A0=C2=A0=C2=A0 -\item[41 and above] Feature bits reserved for =
future=20
>>>>>>>> extensions.
>>>>>>>> +\item[42 and above] Feature bits reserved for future extensions.
>>>>>>>> =C2=A0=C2=A0=C2=A0 \end{description}
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \begin{note}
>>>>>>>> @@ -449,6 +449,8 @@ \section{Exporting Objects}\label{sec:Basic
>>>>>>>> Facilities of a Virtio Device / Expo
>>>>>>>> =C2=A0=C2=A0=C2=A0 types. It is RECOMMENDED that devices generate =
version 4
>>>>>>>> =C2=A0=C2=A0=C2=A0 UUIDs as specified by \hyperref[intro:rfc4122]{=
[RFC4122]}.
>>>>>>>> =C2=A0=C2=A0=C2=A0 +\input{admin-virtq.tex}
>>>>>>>> +
>>>>>>>> =C2=A0=C2=A0=C2=A0 \chapter{General Initialization And Device
>>>>>>>> Operation}\label{sec:General Initialization And Device Operation}
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We start with an overview of device=
 initialization, then=20
>>>>>>>> expand
>>>>>>>> on the
>>>>>>>> @@ -6847,6 +6849,9 @@ \chapter{Reserved Feature
>>>>>>>> Bits}\label{sec:Reserved Feature Bits}
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that the driver can reset a queue i=
ndividually.
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See \ref{sec:Basic Facilities of a =
Virtio Device /=20
>>>>>>>> Virtqueues /
>>>>>>>> Virtqueue Reset}.
>>>>>>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 \item[VIRTIO_F_ADMIN_VQ (41)] This feat=
ure indicates that
>>>>>>>> +=C2=A0 the device supports administration virtqueue negotiation.
>>>>>>>> +
>>>>>>>> =C2=A0=C2=A0=C2=A0 \end{description}
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \drivernormative{\section}{Reserved=
 Feature Bits}{Reserved
>>>>>>>> Feature Bits}
>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>
>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>> before posting.
>>>>>>>
>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>> List archive:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3DpJ5nr6uphZoehnGnA0VSMX5eu2x%2Fgy%2BGp6eYNz6Pi0g%3D&amp;reserved=3D0=
=20
>>>>>>>
>>>>>>> Feedback License:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7=
Cmgurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340=
c1b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;=
sdata=3DXkaqrd0XlxyYl%2FLmxGS%2BylV7DYZr%2F7AeEQF5ht1EzAI%3D&amp;reserved=
=3D0=20
>>>>>>>
>>>>>>> List Guidelines:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C0=
1%7Cmgurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a=
mp;sdata=3DWJfH8kSdB3z14hiThyhKSU1m3xmGLRQ0UDvgwW0ITLI%3D&amp;reserved=3D0=
=20
>>>>>>>
>>>>>>> Committee:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy=
%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39ef=
d9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dlz=
exk08M1jvX3RXvA%2B56wlYc9wPV79JmSNPgvw0F8EU%3D&amp;reserved=3D0=20
>>>>>>>
>>>>>>> Join OASIS:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7=
Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C=
0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DGoUCz7VeXW9JC47bB=
ETePKDTAAyWqlHsjnCOAhhys1k%3D&amp;reserved=3D0=20
>>>>>>>
>>>>>>>
>>>>> This publicly archived list offers a means to provide input to the
>>>>>
>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>
>>>>>
>>>>>
>>>>> In order to verify user consent to the Feedback License terms and
>>>>>
>>>>> to minimize spam in the list archive, subscription is required
>>>>>
>>>>> before posting.
>>>>>
>>>>>
>>>>>
>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>
>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>
>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>
>>>>> List archive:=20
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgu=
rtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7=
db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat=
a=3DpJ5nr6uphZoehnGnA0VSMX5eu2x%2Fgy%2BGp6eYNz6Pi0g%3D&amp;reserved=3D0
>>>>>
>>>>> Feedback License:=20
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3DXkaqrd0XlxyYl%2FLmxGS%2BylV7DYZr%2F7AeEQF5ht1EzAI%3D&amp;reserved=3D0
>>>>>
>>>>> List Guidelines:=20
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%=
7Cmgurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp=
;sdata=3DWJfH8kSdB3z14hiThyhKSU1m3xmGLRQ0UDvgwW0ITLI%3D&amp;reserved=3D0
>>>>>
>>>>> Committee:=20
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%4=
0nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39efd9=
ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dlzex=
k08M1jvX3RXvA%2B56wlYc9wPV79JmSNPgvw0F8EU%3D&amp;reserved=3D0
>>>>>
>>>>> Join OASIS:=20
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Ce=
ac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%=
7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DGoUCz7VeXW9JC47bBET=
ePKDTAAyWqlHsjnCOAhhys1k%3D&amp;reserved=3D0
>>>>>
>>>
>>> This publicly archived list offers a means to provide input to the
>>>
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>>
>>>
>>> In order to verify user consent to the Feedback License terms and
>>>
>>> to minimize spam in the list archive, subscription is required
>>>
>>> before posting.
>>>
>>>
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>
>>> List help: virtio-comment-help@lists.oasis-open.org
>>>
>>> List archive:=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgurt=
ovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db=
39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DpJ5nr6uphZoehnGnA0VSMX5eu2x%2Fgy%2BGp6eYNz6Pi0g%3D&amp;reserved=3D0
>>>
>>> Feedback License:=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cmgu=
rtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7=
db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat=
a=3DXkaqrd0XlxyYl%2FLmxGS%2BylV7DYZr%2F7AeEQF5ht1EzAI%3D&amp;reserved=3D0
>>>
>>> List Guidelines:=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%7C=
mgurtovoy%40nvidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c=
1b7db39efd9ccc17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s=
data=3DWJfH8kSdB3z14hiThyhKSU1m3xmGLRQ0UDvgwW0ITLI%3D&amp;reserved=3D0
>>>
>>> Committee:=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%40n=
vidia.com%7Ceac245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39efd9cc=
c17a%7C0%7C0%7C637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dlzexk0=
8M1jvX3RXvA%2B56wlYc9wPV79JmSNPgvw0F8EU%3D&amp;reserved=3D0
>>>
>>> Join OASIS:=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Ceac=
245eba2584b108f4308d9eb763a85%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C=
637799715297571729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DGoUCz7VeXW9JC47bBETeP=
KDTAAyWqlHsjnCOAhhys1k%3D&amp;reserved=3D0
>>>
>>
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

