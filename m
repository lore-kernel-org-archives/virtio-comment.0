Return-Path: <virtio-comment-return-6850-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1834EB64DD
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 08:10:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 017A42AFFE
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 08:10:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF1499867C4
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 08:09:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E0A019867C1; Thu, 13 Jul 2023 08:09:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF2989867C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jul 2023 08:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Y-4NvOZXN2uAh0z4ulb-yw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "virtio-dev@lists.oasis-open.org"
 <virtio-dev@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB5481634F6AA8E6553D5D0463DC36A@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: Red Hat GmbH
References: <20230712222405.455201-1-parav@nvidia.com>
 <20230712222405.455201-4-parav@nvidia.com>
 <20230712184051-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481634F6AA8E6553D5D0463DC36A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 13 Jul 2023 10:09:47 +0200
Message-ID: <87351ss050.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] RE: [PATCH 3/4] virtio-net: Use table to describe inner hash to rfc
 mapping

On Wed, Jul 12 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Wednesday, July 12, 2023 6:41 PM
>> Hmm. escapechar did not work then?
>
>  Forgot to mention, I tried it, it didn't work.

It seemed to work for me (at least in the pdf) -- I'd prefer that one as
a minimal change.


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

