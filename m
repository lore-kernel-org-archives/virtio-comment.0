Return-Path: <virtio-comment-return-9070-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F9EC48295
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 15:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A710642A68
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 15:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 875C89865C1
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 15:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A1969864BA; Mon,  5 Feb 2024 15:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE1749864C1
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Feb 2024 15:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RYSnUHQSMJSmGQYefdJcLw-1
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
In-Reply-To: <20240116082825-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 05 Feb 2024 16:19:32 +0100
Message-ID: <874jenj5vf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text

On Tue, Jan 16 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
>> 
>> > From: Cornelia Huck <cohuck@redhat.com>
>> > Sent: Tuesday, January 16, 2024 6:08 PM
>> > To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org;
>> > mst@redhat.com
>> > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
>> > yuri.benditovich@daynix.com
>> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation text
>> > 
>> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>> > 
>> > >> From: Cornelia Huck <cohuck@redhat.com>
>> > >> Sent: Tuesday, January 16, 2024 4:33 PM
>> > >> To: Parav Pandit <parav@nvidia.com>;
>> > >> virtio-comment@lists.oasis-open.org;
>> > >> mst@redhat.com
>> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
>> > >> yuri.benditovich@daynix.com
>> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
>> > >> calculation text
>> > >>
>> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>> > >>
>> > >> >> From: Cornelia Huck <cohuck@redhat.com>
>> > >> >> Sent: Monday, January 15, 2024 10:14 PM
>> > >> >
>> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
>> > >> >> > +The driver MUST consider size of field \field{struct
>> > >> >> > +virtio_net_hdr}
>> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
>> > >> >> > +bytes if
>> > >> >> not.
>> > >> >> > +
>> > >> >>
>> > >> >> Requiring the driver to consider the size of something to be its
>> > >> >> actual size seems a bit odd :) I don't think we need this, as the

My comment here still holds.

>> > >> >> length can be derived from looking at the definitions, and is
>> > >> >> already spelled out explicitly, if you consider my suggestion above.
>> > >> > We need this because tx side also needs to refer to the
>> > >> > virtio_net_hdr in
>> > >> patch 2 to be same as that of the rx side.
>> > >> > And hence, this normative sets base line for tx side too. Relying
>> > >> > on rest of the
>> > >> receive packet normative is not enough.
>> > >>
>> > >> Hm, why? If struct virtio_net_hdr is well-defined, its size is
>> > >> well-defined as well, and we do not need to state it explictly?
>> > > Because,
>> > > the size of virtio_net_hdr is derived from the rx side features.
>> > > Today there is no normative line that says that even though you are using A,
>> > B, C Rx features, due to which your tx side virtio_net_hdr also changes.
>> > > The 2nd patch in this series adds this explicit normative as explained in the
>> > cover letter.
>> > 
>> > Let's step back a bit.
>> > 
>> > struct virtio_net_hdr is defined at the beginning of the "Device Operation"
>> > section; the definition clearly says that the last three fields depend on
>> > VIRTIO_NET_F_HASH_REPORT being negotiated. The device and the driver
>> > agree on whether HASH_REPORT is negotiated, and therefore should also
>> > agree on the size of virtio_net_hdr?
>> > 
>> Do you imply that device operation description is enough to not add normative?
>> If so, for this case and possibly new things if we write as device operation, would it be enough?
>> 
>> > Or is the problem that we did not state explicitly that the last three fields of
>> > virtio_net_hdr do not exist without HASH_REPORT (and are not merely
>> > invalid)? If yes, we should spell this out, instead of adding normative
>> > statements about what the size of virtio_net_hdr should be considered to be.
>> This suggested normative is added in this patch.
>> 
>> > If virtio_net_hdr has a fixed size, we shouldn't need the second patch, either.
>> The fact that HASH_REPORT is only for the rx, if we have to go back in time, there is no need for the tx to force also to follow the rx virtio_net_hdr.
>> There is no explicit normative indicating the virtio_net_hdr for the TX is forced by the RX even though it has no relation to hash report.
>> 
>> If you say device operation is enough, than I am sort of lost of when normative is needed, and when device operation is enough.
>
>
> Generally we start adding normatives when we see that something is
> unclear. But I think generally I agree with Parav, if someone has
> the time to write the normative, it's all good.

So if we really want to have normatives, can we come up with something
that reads less weirdly? I currently lack the capacity to suggest
something.


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

