Return-Path: <virtio-comment-return-3099-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E344098664C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Jun 2022 11:59:36 +0000 (UTC)
From: "Gittinger Joerg (XC-ECO/ESH2)" <Joerg.Gittinger@de.bosch.com>
Date: Fri, 3 Jun 2022 11:59:33 +0000
Message-ID: <AM7PR10MB393991E00607F2D6ACE978DBCDA19@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Subject: [virtio-comment] =?iso-8859-1?Q?virtio-device_in_=B5C_of_a_SoC?=
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

I have a concrete request for a use-case to support by virtio, but am not s=
ure where and how to discuss it. So please let me know if this mailing list=
 is not the proper place. In detail I would like to get answers to:
1) Is this the proper mailing list/place to discuss?
2) Is the use case worth to discuss or is it out of the scope of virtio?
3) How should it be discussed: with individual design proposals/code/patche=
s or with sort of a concise design document?

The roughly outlined use case we are interested in is this:=20
On many embedded System-on-Chips (SoCs) nowadays microcontrollers for real-=
time OS (RTOS) and micro processors for Rich OS like Linux share access to =
a common region in RAM. The idea is that if the RTOS on the =B5C would impl=
ement virtio-device(s) using MMIO transport as a shared memory in RAM, virt=
io-drivers implemented in Linux could directly communicate with the device =
in the RTOS on the =B5C (yes, given the precondition that all queues + buff=
ers are in common RAM and if cross-processor IRQs exist). There would be no=
 hypervisor, the MMIO transport resides in a RAM area. Virtio devices like =
crypto, socket, entropy, net,... could be implemented on the RTOS and used =
by a rich OS like Linux out-of-the-box on such SoCs.

Unfortunately this is currently not supported with virtio MMIO transport, b=
ecause for instance the feature and queue negotiation sequences at device i=
nitialization phase implicitly require synchronous actions by the device on=
 single MMIO-write operations performed by the driver which cannot be accom=
plished with pure memory accesses. For instance the sequence:

driver -> device: write IDX to register DeviceFeaturesSel
driver <- device: read register DeviceFeatures (<-- value dependent on IDX)

will not succeed because the driver running on a different processor would =
have to wait until the device had recognized IDX and had written the correc=
t feature bits word to the DeviceFeatures register in the common MMIO RAM. =
Supporting this use case with virtio with the existing MMIO transport would=
 require extending MMIO with additional synchronization options between suc=
h write and read operations. Or a completely new synchronous MMIO transport=
 would be required.

Best regards + appreciating your comments
Joerg

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

