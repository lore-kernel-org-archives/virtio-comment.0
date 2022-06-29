Return-Path: <virtio-comment-return-3198-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A6E19867A9
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Jun 2022 10:01:32 +0000 (UTC)
From: "Gittinger Joerg (XC-ECO/ESH2)" <Joerg.Gittinger@de.bosch.com>
Date: Wed, 29 Jun 2022 10:01:28 +0000
Message-ID: <AM7PR10MB393952B517ACE6A88F279BDECDBB9@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
References: <AM7PR10MB393991E00607F2D6ACE978DBCDA19@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB393991E00607F2D6ACE978DBCDA19@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Subject: [virtio-comment] =?iso-8859-1?Q?RE:_virtio-device_in_=B5C_of_a_SoC?=
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

> I have a concrete request for a use-case to support by virtio, but am not=
 sure where and how to discuss it.=20
> So please let me know if this mailing list is not the proper place.

Maybe making a concrete proposal is a better way to handle such a proposal.
Please let me know if this is appropriate or not - just give me some feedba=
ck, sort of either
"Go away, we'll never support something like this" or
"Yes, this use case sounds valid. Let us refine/see how we could support th=
is".

Proposal about:=20
---------------

Extending virtio-mmio transport by explicit synchronization.

Use case:=20
---------

If virtio device is implemented on a different CPU than virtio driver and=
=20
accesses to MMIO region by the driver cannot be "trapped" by the device,=20
the need for additional synchronization between virtio driver and device=20
is given.
The current virtio MMIO transport specification implicitly expects especial=
ly=20
during device initialization that virtio device synchronously responds to=
=20
interactive MMIO register write operations by the driver.
In case of a device implemented by a hypervisor this means the hypervisor=
=20
traps accesses to the MMIO region of the driver implemented in a guest.
In case of a device implemented on a different CPU this does not work out=
=20
anymore. For such a case dedicated device initialization steps require=20
additional synchronization of MMIO write operations by the driver.

Design proposal:
----------------

1. Introduce a new device feature bit indicating requirement for=20
   synchronization when using the MMIO transport.

   E.g. VIRTIO_F_MMIO_SYNCHRONIZE. This feature bit indicates that the devi=
ce
   requires MMIO synchronization. It must be defined in the first 32 featur=
e=20
   bits of the device.=20

2. Driver requirements for VIRTIO_F_MMIO_SYNCHRONIZE:

   a. The driver must read the first 32 device feature bits at first in ord=
er
      to identify if MMIO access must be synchronized.
   b. In case VIRTIO_F_MMIO_SYNCHRONIZE is indicated by the device, the
      driver must wait for the synchronization acknowledgement by the devic=
e
      after writing to:=20
        DeviceFeaturesSel
        DriverFeaturesSel
        DriverFeatures
        QueueSel
        Status
        QueueDescHigh
        QueueDriverHigh
        QueueDeviceHigh
        SHMSel
        SHMLenHigh
        SHMBaseHigh
        QueueReset

3. The MMIO synchronization

   The MMIO synchronization is realized by 2 additional registers in the
   MMIO region:

        DriverSyncWatermark (RW)
        DeviceSyncWatermark (R)

   The synchronization works this way:=20
   Whenever the driver has written to the registers listed in section 2.=20
   above, it increments the value in DriverSyncWatermark by one.
   The driver does not continue with reading/writing any MMIO registers=20
   before the device has set the DeviceSyncWatermark to the same value as=
=20
   in DriverSyncWatermark. By updating DeviceSyncWatermark to the same
   value as DriverSyncWatermark the device indicates acknowledgement of
   the change to MMIO registers by the driver.


4. Issues

   - Driver initiated device reset at start of device initialization:

     According to the specification, the driver must reset the device
     before reading the DeviceFeatures. This is before it knows that
     the device needs synchronization.
     In this case the driver must restart the device initialization,
     i.e. reinitiate device reset, this time waiting for=20
     acknowledgement of the device.

   - driver -> device notification of queue updates, i.e. QueueNotify:

     If the driver would have to wait for device acknowledgement of=20
     updates to QueueNotify after device initialization phase, this
     would have signification impact on the performance and would=20
     probably be not accepted by users. Therefore the requirement for=20
     synchronization on updates to QueueNotify is dropped.
     Instead, the device is supposed to periodically check for updates=20
     on QueueNotify or check the physical memory location of the
     driver queues directly for updates.

Regards,

Joerg Gittinger

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

