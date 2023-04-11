Return-Path: <virtio-comment-return-5359-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7E5C7619A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 08:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E72D6603C2
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 08:05:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E18C29863C9
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 08:05:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D58EE983DFF; Tue, 11 Apr 2023 08:05:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5EAD2986366
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 08:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: e2Z8WiHrPGq3zJW_EOCc3A-1
From: Cornelia Huck <cohuck@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>, virtio-dev@lists.oasis-open.org,
 virtio-comment@lists.oasis-open.org
Cc: Parav Pandit <parav@nvidia.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, David Edmondson
 <david.edmondson@oracle.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>
In-Reply-To: <336f9b36-6704-51a6-0097-22381c623b8b@linux.alibaba.com>
Organization: Red Hat GmbH
References: <20230323152422.113103-1-hengqi@linux.alibaba.com>
 <336f9b36-6704-51a6-0097-22381c623b8b@linux.alibaba.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 11 Apr 2023 10:05:11 +0200
Message-ID: <87o7nukfns.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v14] virtio-net: support the virtqueue
 coalescing moderation

On Thu, Mar 23 2023, Heng Qi <hengqi@linux.alibaba.com> wrote:

> Hi all! If after reviewing it you feel it meets the necessary 
> requirements, I kindly request a vote.
>
> Thanks a lot!
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/166

So this has been voted upon and accepted, but we have further discussion
downthread.

Should we merge the voted-upon version now and do further changes on
top, or wait for the discussion to conclude first so that we can merge
all of it in one go?


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

