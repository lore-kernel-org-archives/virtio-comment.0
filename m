Return-Path: <virtio-comment-return-3231-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 301A69867F8
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Jul 2022 07:53:28 +0000 (UTC)
From: "Gittinger Joerg (XC-ECO/ESH2 ETAS-VOS/XEO-ARA2)"
	<Joerg.Gittinger@de.bosch.com>
Date: Fri, 15 Jul 2022 07:53:23 +0000
Message-ID: <AM7PR10MB3939BC9ED3C824E8075AF9D1CD8B9@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
References: <AM7PR10MB393991E00607F2D6ACE978DBCDA19@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB393952B517ACE6A88F279BDECDBB9@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
 <Ys1OztCwkBFN/aev@stefanha-x1.localdomain>
In-Reply-To: <Ys1OztCwkBFN/aev@stefanha-x1.localdomain>
MIME-Version: 1.0
Subject: =?iso-8859-1?Q?RE:_[virtio-comment]_RE:_virtio-device_in_=B5C_of_a_SoC?=
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Stefan,

> > Maybe making a concrete proposal is a better way to handle such a propo=
sal.
> > Please let me know if this is appropriate or not - just give me some=20
> > feedback, sort of either "Go away, we'll never support something like=
=20
> > this" or "Yes, this use case sounds valid. Let us refine/see how we cou=
ld support this".
>
> Hi Joerg,
> This is the right mailing list. Maybe the people who are interested in si=
milar use cases are busy right now, but don't be discouraged!
>
> Your proposal sounds like it's within the scope of VIRTIO and makes sense=
 in specific circumstances. The next step to making this more=20
> concrete is to send a specification patch (https://github.com/oasis-tcs/v=
irtio-spec/) for review and voting.

Thanks a lot for the feedback. Then we'll elaborate a concrete specificatio=
n change and feed it into the github virtio-spec project.

> >=20
> > Proposal about:=20
> > ---------------
> >=20
> > Extending virtio-mmio transport by explicit synchronization.
> >=20
> > Use case:=20
> > ---------
> >=20
> > If virtio device is implemented on a different CPU than virtio driver=
=20
> > and accesses to MMIO region by the driver cannot be "trapped" by the=20
> > device, the need for additional synchronization between virtio driver=
=20
> > and device is given.
> > The current virtio MMIO transport specification implicitly expects=20
> > especially during device initialization that virtio device=20
> > synchronously responds to interactive MMIO register write operations by=
 the driver.
> > In case of a device implemented by a hypervisor this means the=20
> > hypervisor traps accesses to the MMIO region of the driver implemented =
in a guest.
> > In case of a device implemented on a different CPU this does not work=
=20
> > out anymore. For such a case dedicated device initialization steps=20
> > require additional synchronization of MMIO write operations by the driv=
er.
>
> In Linux there is the VIRTIO-based rpmsg inter-processor messaging bus:
> https://docs.kernel.org/staging/rpmsg.html
>
> It's not developed as part of the VIRTIO spec and unfortunately I don't k=
now much about how it works, but it came to mind=20
> when I read about your usecase. I believe it does not notifications (inte=
rrupts) though, so maybe your use case is different.

Yes, I have had a close look on rpmsg as well. The same applies to the Open=
AMP approach and all the different chip vendors=20
(NXP, TI, ...) implementing their flavor of rpmsg. After analysis these app=
roaches are at least for our use cases not=20
appropriate to provide an hardware-independent interchangeable solution to =
inter-processor-communication.

The item I am confused about most is that they claim to be based on VIRTIO,=
 but this is IMHO not the case. They
reuse the vring data structure but I do not comprehend how this implies VIR=
TIO, which is in my eyes fundamentally based=20
on this driver <-> device model and the interaction between them. Rpmsg doe=
s not at all touch this. Additionally,
"VIRTIO-based" suggests that there is a standard on which it is built upon =
but there is no rpmsg standard. There is no
rpmsg driver which could be easily run on a VIRTIO device or a potential rp=
msg device run on a =B5C CPU of a different chip vendor.

Another questionable item is they implement a mixture of SoC state manageme=
nt (starting/stopping CPU cores) and application=20
communication which might not always be intended to be integrated into a si=
ngle software instance from architecture=20
perspective.

The third downside is that these approaches just define an API or provide a=
 library which must potentially licensed.
This is also not a favored architecture model. VIRTIO on the other hand def=
ines a standard which supports any implementation
and if devices/drivers are developed conforming to this standard. Driver/De=
vice binaries from different contributors are supposed=20
to be able to work together.
Therefore we would prefer VIRTIO, if it would support a transport across CP=
Us on a SoC sharing memory. Especially
because it would open up possibilities for a whole bunch of different devic=
e types defined by the standard.

> >=20
> > Design proposal:
> > ----------------
> >=20
> > 1. Introduce a new device feature bit indicating requirement for=20
> >    synchronization when using the MMIO transport.
> >=20
> >    E.g. VIRTIO_F_MMIO_SYNCHRONIZE. This feature bit indicates that the =
device
> >    requires MMIO synchronization. It must be defined in the first 32 fe=
ature=20
> >    bits of the device.=20
> >=20
> > 2. Driver requirements for VIRTIO_F_MMIO_SYNCHRONIZE:
> >=20
> >    a. The driver must read the first 32 device feature bits at first in=
 order
> >       to identify if MMIO access must be synchronized.
> >    b. In case VIRTIO_F_MMIO_SYNCHRONIZE is indicated by the device, the
> >       driver must wait for the synchronization acknowledgement by the d=
evice
> >       after writing to:=20
> >         DeviceFeaturesSel
> >         DriverFeaturesSel
> >         DriverFeatures
> >         QueueSel
> >         Status
> >         QueueDescHigh
> >         QueueDriverHigh
> >         QueueDeviceHigh
> >         SHMSel
> >         SHMLenHigh
> >         SHMBaseHigh
> >         QueueReset
> >=20
> > 3. The MMIO synchronization
> >=20
> >    The MMIO synchronization is realized by 2 additional registers in th=
e
> >    MMIO region:
> >=20
> >         DriverSyncWatermark (RW)
> >         DeviceSyncWatermark (R)
> >=20
> >    The synchronization works this way:=20
> >    Whenever the driver has written to the registers listed in section 2=
.=20
> >    above, it increments the value in DriverSyncWatermark by one.
> >    The driver does not continue with reading/writing any MMIO registers=
=20
> >    before the device has set the DeviceSyncWatermark to the same value =
as=20
> >    in DriverSyncWatermark. By updating DeviceSyncWatermark to the same
> >    value as DriverSyncWatermark the device indicates acknowledgement of
> >    the change to MMIO registers by the driver.
>
> On some CPU architectures there are memory wait instructions for monitori=
ng the contents of a memory location.=20
> DriverSyncWatermark and DeviceSyncWatermark look like ideal targets for t=
his type of CPU instruction.

I actually don't know these instructions. The SoC architectures we had a lo=
ok on don't even share caches=20
between =B5P and =B5C CPU cores, so DRAM (and possibly SRAM) at the lowest =
level is the only common resource to=20
synchronize on. But if there are synchronous instructions waiting on memory=
 change, even better.

> > 4. Issues
> >=20
> >    - Driver initiated device reset at start of device initialization:
> >=20
> >      According to the specification, the driver must reset the device
> >      before reading the DeviceFeatures. This is before it knows that
> >      the device needs synchronization.
> >      In this case the driver must restart the device initialization,
> >      i.e. reinitiate device reset, this time waiting for=20
> >      acknowledgement of the device.
>
> This sounds fine. It doesn't stop your approach from working.
>
> >=20
> >    - driver -> device notification of queue updates, i.e. QueueNotify:
> >=20
> >      If the driver would have to wait for device acknowledgement of=20
> >      updates to QueueNotify after device initialization phase, this
> >      would have signification impact on the performance and would=20
> >      probably be not accepted by users. Therefore the requirement for=
=20
> >      synchronization on updates to QueueNotify is dropped.
> >      Instead, the device is supposed to periodically check for updates=
=20
> >      on QueueNotify or check the physical memory location of the
> >      driver queues directly for updates.
>
> The queue index or VIRTIO_F_NOTIFICATION_DATA value may be overwritten by=
 the driver by the time=20
> the device sees it. If the device needs to poll anyway > then it might as=
 well poll the vring.=20
> QueueNotify can be skipped entirely and is unnecessary with VIRTIO_F_MMIO=
_SYNCHRONIZE.

Yes. I agree.

> How do Used Buffer Notifications (typically device->driver interrupts) wo=
rk? Are they skipped too=20
> and the driver polls the vrings?

I'd like to keep the requirements low as I am not sure if and how =B5C -> =
=B5P interrupts can be configured.
Therefore yes, I'd suggest to skip that for now. But actually I don't know =
how e.g. Linux would
handle a driver polling mode therefore this is something we need to investi=
gate further. Good point.

Thanks,
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

