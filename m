Return-Path: <virtio-comment-return-7954-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C62AC25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:18:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4DCC02B06B
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:18:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 281579869ED
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:18:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0BD6C9869E3; Wed, 25 Oct 2023 10:18:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F07999869E4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dLpMgEpuOmO15M6nciDFYg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
 <xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com>
 <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 25 Oct 2023 12:18:16 +0200
Message-ID: <87r0ljatuf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Wed, Oct 25 2023, Parav Pandit <parav@nvidia.com> wrote:

> Hi Cornelia,
>
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Monday, October 23, 2023 8:52 PM
>> To: Cornelia Huck <cohuck@redhat.com>; Michael S. Tsirkin
>> <mst@redhat.com>
>> Cc: virtio-comment@lists.oasis-open.org; hengqi@linux.alibaba.com;
>> xuanzhuo@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>
>> Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabli=
ng
>> virtqueue after DRIVER_OK stage
>>=20
>>=20
>> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> > open.org> On Behalf Of Cornelia Huck
>> > Sent: Monday, October 23, 2023 8:31 PM
>> >
>> > On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
>> >
>> > >> From: Cornelia Huck <cohuck@redhat.com>
>> > >> Sent: Monday, October 23, 2023 7:58 PM
>> > >
>> > >> On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:
>> > >>
>> > >> >> From: virtio-comment@lists.oasis-open.org
>> > >> >> <virtio-comment@lists.oasis- open.org> On Behalf Of Cornelia
>> > >> >> Huck
>> > >> >> Sent: Monday, October 23, 2023 7:27 PM
>> > >> >
>> > >> >> Well, there are  still comments from me here that post-date v4
>> > >> >> (please wait for a bit before posting another version!), so I'll
>> > >> >> continue waiting for them to be addressed first.
>> > >> > The last one was [1].
>> > >> > Which I replied few days ago at [2].
>> > >> >
>> > >> > [1]
>> > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00
>> > >> > 24
>> > >> > 0.h
>> > >> > tml [2]
>> > >> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00
>> > >> > 24
>> > >> > 2.h
>> > >> > tml
>> > >>
>> > >> I still have some open questions from <87sf68cjn0.fsf@redhat.com>
>> > >> (first and last paragraph.)
>> > >
>> > > Above link is not accessible to me. =E2=98=B9
>> >
>> > That's not a link, but a message id... many mail clients support
>> > searching by it, and you can also get it from lore:
>> >
>> > https://lore.kernel.org/all/87sf68cjn0.fsf@redhat.com/
>> >
>> > > I addressed your comments/questions in v4.
>> > > Can you please check v4 if they are addressed? I rewrote as you
>> > > suggested in
>> > v3.
>> >
>> > This was for points you did not agree with. (Again, it might be
>> > helpful to wait with posting a new version until discussion has
>> > somewhat
>> > concluded.)
>> Sure, will wait next time.
>>=20
>> Your comment was,
>> =3D=3D=3D=3D=3D
>> This is not really clear to me just from this text, especially if you ju=
st wrote
>> above that enabling or re-enabling is something different... my understa=
nding
>> would be:
>>=20
>> - if neither dynamic vqs nor queue reset are supported or negotiated,
>>   the only way to enable a vq is before DRIVER_OK, during setup
>> - both of these features rely on the transport supporting enabling
>>   individual queues (either a queue that has not been enabled before, or
>>   a queue that has been reset)
>> - the transport is supposed to use the same mechanism for either
>>=20
>> Did I get it right? If so, I think we should make it a bit more clear.
>> =3D=3D=3D=3D=3D
>>=20
>> Above is clarified in below wording without complicating the queue_reset=
 here.
>>=20
>> Does that look ok to you?
>>=20
>> +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver enables the
>> +virtqueues during the device initialization sequence, i.e. after the
>> +device sets the FEATURES_OK status bit and before the driver setting th=
e
>> DRIVER_OK status bit.
>> +
>> +When VIRTIO_F_RING_DYNAMIC is negotiated, the driver is not required to
>> +enable every virtqueue it wants to use before setting the DRIVER_OK
>> +status bit; the driver can choose to enable a virtqueue even after the
>> +driver has set the DRIVER_OK status bit. The virtqueue enable mechanism=
 is
>> transport specific.
>> +
>
> Can you please respond?
> We must make progress with this and the flow filters which are depending =
on this for a long time now.

I will not be able to look at this before Friday.


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

