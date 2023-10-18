Return-Path: <virtio-comment-return-7806-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B209DCDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:25:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 15A10157EE6
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:25:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC3F898689F
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:25:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D9BFB986898; Wed, 18 Oct 2023 10:25:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA1CB986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CKHoouq3Mdedhjr7djjDWA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
Cc: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
 <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 18 Oct 2023 12:25:23 +0200
Message-ID: <87sf68cjn0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Tuesday, October 17, 2023 5:55 PM
>>=20
>> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
>> > @@ -440,6 +440,38 @@ \subsubsection{Virtqueue
>> > Re-enable}\label{sec:Basic Facilities of a Virtio Devic  as during
>> > initial virtqueue discovery, but optionally with different  parameters=
.
>> >
>> > +\subsection{Dynamic Virtqueues}\label{sec:Basic Facilities of a
>> > +Virtio Device / Virtqueues / Dynamic Virtqueues}
>> > +
>> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the
>> > +virtqueues during the device initialization sequence, i.e. after the
>> > +device sets the FEATURES_OK status bit and before the driver setting =
the
>> DRIVER_OK status bit.
>>=20
>> _Or_ if a virtqueue has been reset and the driver wants to re-enable it,=
 right?
>>=20
> Well no. Because above text is for "enablement", and not re-enablement.
> If the driver want to reset and re-enable, it must be enabled in first pl=
ace before setting driver_ok.
> VQ not enabled before driver ok, cannot be reset, and hence cannot be re-=
enabled.
>
> So I think above text is fine because it says about "enables" and not "re=
-enables".
>
>> > +
>> > +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver can avoid
>> > +enabling the virtqueues before setting the DRIVER_OK status bit; the
>> > +driver can enable the specific virtqueues after the driver has set th=
e
>> DRIVER_OK status bit.
>>=20
>> "the driver is not required to enable every virtqueue it wants to use be=
fore
>> setting the DRIVER_OK status bit; it can choose to enable a virtqueue ev=
en after
>> it has set the DRIVER_OK status bit."
>>=20
> Sounds good. Will change it.
>
>> > +The virtqueue enable mechanism is transport specific.
>>=20
>> Would that be the same mechanism as for re-enabling a queue after a queu=
e
>> reset? I guess I'm missing the relationship here...
>>=20
> Yes, it is same.
> There is no change in enabling/re-enabling the virtqueue after/before DRI=
VER_OK with/without _dynamic bit.
> So no extra text added here.

This is not really clear to me just from this text, especially if you
just wrote above that enabling or re-enabling is something
different... my understanding would be:

- if neither dynamic vqs nor queue reset are supported or negotiated,
  the only way to enable a vq is before DRIVER_OK, during setup
- both of these features rely on the transport supporting enabling
  individual queues (either a queue that has not been enabled before, or
  a queue that has been reset)
- the transport is supposed to use the same mechanism for either

Did I get it right? If so, I think we should make it a bit more clear.

(...)

>> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable
>> > +the required number of virtqueues before setting the DRIVER_OK status=
 bit.
>>=20
>> What does "required" mean here? It just chooses to enable the queues it =
wants
>> to use, right?
> Right.
> Required meaning, whatever number of queues that driver choose to enable,=
 those must be enabled before driver_ok.
> So it is "required by the driver".
> Would that be ok?

I'd write it as "the driver MUST enable any virtqueue it plans to use"
or something like that.

(...)

>> We currently have a device normative statement:
>>=20
>> "The device MUST NOT consume buffers or send any used buffer notificatio=
ns to
>> the driver before DRIVER_OK."
>>=20
>> I guess we need to extend that to not doing that for not-yet-enabled que=
ues in
>> the dynamic virtqueue case? There's a (transport-specific) point in time=
 when
>> the driver tells the device that the queue is ready, right?
>
> We don=E2=80=99t need extend this text because device does not know anyth=
ing about the disabled queue, so it cannot consume any buffer from it anywa=
y.
> Above line only applied to the enabled virtqueue.

My point is: DRIVER_OK signals that the driver is done with its setup
and the device may start to interact with the queue. Depending on the
mechanism the transport uses for enabling the queue, it may "know" about
the queue before the driver is ready -- it might need to wait until the
driver has completed enabling of the queue. Not sure if that is worth
spelling out.


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

