Return-Path: <virtio-comment-return-7752-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC48CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 11:58:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 82667129206
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 11:58:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B5D2986858
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 11:58:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 70CBA98684E; Tue, 17 Oct 2023 11:58:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F020986850
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 11:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7f5wwBXhM_aGwQPu1kAQVg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
Cc: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
 <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
 <virtio@lists.oasis-open.org>
In-Reply-To: <PH0PR12MB5481879853042186FAF4787BDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231002051601.6626-1-parav@nvidia.com>
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54817941AFA95235ECEE745ADCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481879853042186FAF4787BDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Oct 2023 13:58:25 +0200
Message-ID: <874jipe9zy.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue
 after DRIVER_OK

On Mon, Oct 16 2023, Parav Pandit <parav@nvidia.com> wrote:

> + virtio TC.
>
> Hi Michael, Cornelia,
>
> Its been many days, the voting request is not raised for this small patch.
>
> Are you receiving this email?
> By any chance, this email has gone to spam/junk directory in your mailbox?
>
> Xuan, Eugenio acked so I at least two mailboxes received in non-junk directory.
> I noticed ballot request created 5 days ago for github issue 175, https://www.oasis-open.org/committees/ballot.php?id=3798.
>
> I suspect that, this email is not reaching you for some reason.
>
> Added virtio TC to see if the 3rd ping reaches you.
>
> Flow filters feature is waiting for a while now which depends on this series as users are not able to scale their performance.
>
> Is there anything more to take care in this patch?
> Please let me know if I need to fix something in this patch.

This is the first time I noticed this, let me check.


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

