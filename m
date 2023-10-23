Return-Path: <virtio-comment-return-7920-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECD9C001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:28:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8FF7519090C
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:28:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72E44986917
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:28:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 571A9986677; Mon, 23 Oct 2023 14:28:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47974986678
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 14:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: N9Gj7OgnP-WoMGoDkNihcA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
 <xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 23 Oct 2023 16:27:55 +0200
Message-ID: <87wmvdbehg.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Mon, Oct 23 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> open.org> On Behalf Of Cornelia Huck
>> Sent: Monday, October 23, 2023 7:27 PM
>
>> Well, there are  still comments from me here that post-date v4 (please wait for
>> a bit before posting another version!), so I'll continue waiting for them to be
>> addressed first.
> The last one was [1].
> Which I replied few days ago at [2].
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00240.html
> [2] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00242.html

I still have some open questions from <87sf68cjn0.fsf@redhat.com> (first
and last paragraph.)


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

