Return-Path: <virtio-comment-return-9072-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D76DC48297
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:02:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A490860270
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:02:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BE429868A0
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:02:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7142898686F; Tue,  6 Feb 2024 17:02:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E59B986875
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Feb 2024 17:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Fiyu3AVvNdWiSAG_2uXouQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
In-Reply-To: <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <874jenj5vf.fsf@redhat.com>
 <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 06 Feb 2024 18:02:29 +0100
Message-ID: <87bk8til0a.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: RE: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text

On Mon, Feb 05 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, February 5, 2024 8:50 PM
>> 
>> On Tue, Jan 16 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
>> >>
>> >> > From: Cornelia Huck <cohuck@redhat.com>
>> >> > Sent: Tuesday, January 16, 2024 6:08 PM
>> >> > To: Parav Pandit <parav@nvidia.com>;
>> >> > virtio-comment@lists.oasis-open.org;
>> >> > mst@redhat.com
>> >> > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
>> >> > yuri.benditovich@daynix.com
>> >> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
>> >> > calculation text
>> >> >
>> >> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>> >> >
>> >> > >> From: Cornelia Huck <cohuck@redhat.com>
>> >> > >> Sent: Tuesday, January 16, 2024 4:33 PM
>> >> > >> To: Parav Pandit <parav@nvidia.com>;
>> >> > >> virtio-comment@lists.oasis-open.org;
>> >> > >> mst@redhat.com
>> >> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
>> >> > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
>> >> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
>> >> > >> calculation text
>> >> > >>
>> >> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>> >> > >>
>> >> > >> >> From: Cornelia Huck <cohuck@redhat.com>
>> >> > >> >> Sent: Monday, January 15, 2024 10:14 PM
>> >> > >> >
>> >> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
>> >> > >> >> > +The driver MUST consider size of field \field{struct
>> >> > >> >> > +virtio_net_hdr}
>> >> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
>> >> > >> >> > +bytes if
>> >> > >> >> not.
>> >> > >> >> > +
>> >> > >> >>
>> >> > >> >> Requiring the driver to consider the size of something to be
>> >> > >> >> its actual size seems a bit odd :) I don't think we need
>> >> > >> >> this, as the
>> 
>> My comment here still holds.
>>
> It is a variable length data structure with few trailing fields as not valid.
> The "actual size" depends on negotiated feature bit, which is what is written here.
>  
> How about below?
>
> When calculating the size of \field{struct virtio_net_hdr}, the driver must consider all the fields
> inclusive up to \field{padding_reserved}, i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated,
> and 12 bytes if not.

It's up to padding_reserved with F_HASH_REPORT and up to num_buffers if
not, isn't it?


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

