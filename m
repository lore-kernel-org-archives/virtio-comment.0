Return-Path: <virtio-comment-return-8035-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52148C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:01:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8D08C2AEDF
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:01:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BB10986B35
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:01:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4EF00986B29; Mon, 30 Oct 2023 11:01:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F9B6986B2A
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7e82tF9iMgirfTRV3ArVlA-1
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
In-Reply-To: <87bkckrva2.fsf@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231027133236.1350124-1-parav@nvidia.com>
 <PH0PR12MB54810FFF99577FB6B7FEA51BDCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231027102358-mutt-send-email-mst@kernel.org>
 <87bkckrva2.fsf@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 30 Oct 2023 12:01:28 +0100
Message-ID: <87wmv4qsqf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] Re: [PATCH] conformance: Add missing virtqueue
 reset conformance references

On Fri, Oct 27 2023, Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Oct 27 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> I think we can merge it as editorial actually. Cornelia?
>
> I agree. (Someone should probably merge the voted issues on the 1.4
> branch first.)

But what I'll do is removing the "Fixes:" line and close the github
issue manually. We should use github issues for voting only, not for
editorial changes (we need some way to distinguish between the two, and
I'd rather have a straightforward way to do so.)


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

