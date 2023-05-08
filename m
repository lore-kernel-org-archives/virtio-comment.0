Return-Path: <virtio-comment-return-5835-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9356DC77B75
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 09:51:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E5454C6119
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 09:50:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC19A986400
	for <virtio-comment@archiver.kernel.org>; Mon,  8 May 2023 09:50:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D2AD89862A9; Mon,  8 May 2023 09:50:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BCAFD9863BD
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 May 2023 09:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZFFrbm8RPwKdqFi9PfyI1Q-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, mst@redhat.com,
 virtio-dev@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, Parav Pandit
 <parav@nvidia.com>
In-Reply-To: <20230505163712.589460-1-parav@nvidia.com>
Organization: Red Hat GmbH
References: <20230505163712.589460-1-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 08 May 2023 11:50:48 +0200
Message-ID: <87wn1jcft3.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [PATCH] admin: Fix reference and table formation

On Fri, May 05 2023, Parav Pandit <parav@nvidia.com> wrote:

> This patch brings three fixes.
>
> 1. Opcode table has 3 columns, only two were enumerated. Due to this
> pdf generation script stops. Fix it and also have resizeable description
> column as it needs wrap.
>
> 2. Status description column content needs to wrap. Without it pdf
>    does not read good. Fix it by having resizeable description column.
>
> 3. Fix the broken link to the Device groups.
>
> This fix is for [1].
>
> [1] https://lore.kernel.org/virtio-comment/cover.1683301091.git.mst@redhat.com/T/#t
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  admin.tex | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Let's push this as an editorial change once the main series is merged.


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

