Return-Path: <virtio-comment-return-7918-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C078FC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:57:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 207F3129208
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:57:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6E14986884
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:57:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CCDBB986676; Mon, 23 Oct 2023 13:57:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCCE5986677
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 13:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cKTOqhdcOt2n5z0oYcXWkQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
 <xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 23 Oct 2023 15:57:19 +0200
Message-ID: <87zg09bfwg.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:

> Hi Michael, Cornelia,
>
>> From: Parav Pandit
>> Sent: Thursday, October 19, 2023 7:27 PM
>> 
>> Hi Cornelia, Michael,
>> 
>> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> > open.org> On Behalf Of Parav Pandit
>> > Sent: Wednesday, October 18, 2023 4:43 PM
>> >
>> > > From: Cornelia Huck <cohuck@redhat.com>
>> > > Sent: Wednesday, October 18, 2023 4:34 PM
>> >
>> > > On Wed, Oct 18 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> > >
>> > > > On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
>> > > >> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
>> > > >>
>> > > >> >> From: Cornelia Huck <cohuck@redhat.com>
>> > > >> >> Sent: Tuesday, October 17, 2023 5:55 PM
>> > > >> >>
>> > > >> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
>> > > >> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver
>> > > >> >> > +MUST enable the required number of virtqueues before
>> > > >> >> > +setting the
>> > > DRIVER_OK status bit.
>> > > >> >>
>> > > >> >> What does "required" mean here? It just chooses to enable the
>> > > >> >> queues it wants to use, right?
>> > > >> > Right.
>> > > >> > Required meaning, whatever number of queues that driver choose
>> > > >> > to
>> > > enable, those must be enabled before driver_ok.
>> > > >> > So it is "required by the driver".
>> > > >> > Would that be ok?
>> > > >>
>> > > >> I'd write it as "the driver MUST enable any virtqueue it plans to use"
>> > > >> or something like that.
>> > > >>
>> > > >> (...)
>> > > >
>> > > > It would have to be SHOULD - we can't add new MUST requirements
>> > > > not contingent on a feature bit, we can give recommendation based
>> > > > on existing installed base.
>> > >
>> > It is not just installed base.
>> > Spec clearly says that:
>> > "Perform device-specific setup, including discovery of virtqueues for
>> > the device, optional per-bus setup, reading and possibly writing the
>> > device's virtio configuration space, and population of virtqueues."
>> >
>> > There is no feature bit or any text that says "population of
>> > virtqueues" can be done later outside of the device initialization phase.
>> > Only reference is _F_RESET bit which is only for re-enabling. (not enabling).
>> >
>> > > Then I wonder whether we need to add any normative statement at all
>> > > -- prior to the introduction of this new feature, the driver had to
>> > > enable anything it wanted to use before DRIVER_OK, and if it does
>> > > not negotiate the new feature, nothing changes. Spelling that out in
>> > > non-normative sections should be enough?
>> > It is already implied in the spec that queues must be enabled before
>> > DRIVER_OK.
>> > So what is written in normative is not changing any behavior.
>> > It is only making the implied behavior explicit.
>> >
>> > If it says SHOULD, that means, one can enable the queue for the first
>> > time after DRIVER_OK stage too.
>> > And that would violate the "Driver Requirements: Device Initialization".
>> >
>> 
>> I have addressed the comments of v3 in v4 at [1].
>> The device requirement is kept as MUST to keep it aligned with the "driver
>> requirements section".'
>> 
>> [1] https://lore.kernel.org/virtio-comment/20231017143135.758523-1-
>> parav@nvidia.com/T/#mc49b6e54186c5f1b1e8c743bc440ca0cc0938212
>> 
>> Please review.
>
> If no comments in v4 which was a week ago, please raise the voting ballot.

Well, there are  still comments from me here that post-date v4 (please
wait for a bit before posting another version!), so I'll continue
waiting for them to be addressed first.

>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00183.html
>
> Parav


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

