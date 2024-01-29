Return-Path: <virtio-comment-return-9022-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BDAC47DB3
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 14:55:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8AEF72CAF7
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 14:55:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D75D986873
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 14:55:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 73641983F75; Mon, 29 Jan 2024 14:55:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 636D5986871
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Jan 2024 14:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Z85t8JQfOniiMC4WTRVmxA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Shujun Xue <shujunxue@google.com>, virtio-dev@lists.oasis-open.org,
 virtio-comment@lists.oasis-open.org
Cc: Shujun Xue <shujunxue@google.com>, Slava Malyugin <slavamn@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
In-Reply-To: <CAB6OiKgcWwH_qprNv6Z=F4=Hc2PckoCqQEJCGgkgNVL9Xx4k5A@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <CAB6OiKgcWwH_qprNv6Z=F4=Hc2PckoCqQEJCGgkgNVL9Xx4k5A@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 29 Jan 2024 15:55:19 +0100
Message-ID: <87cytkkx48.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [virtio-dev] [PATCH] Define the DEVICE ID of Virtio Cpu balloon
 device as 47.

On Tue, Jan 23 2024, Shujun Xue <shujunxue@google.com> wrote:

> The Virtio CPU balloon device is a primitive device for managing guest
> CPU capacity: the device asks for certain CPU cores to be online,
> offline or throttled, and the driver performs the requested operation.
> This allows the guest to adapt to changes in allowance of underlying
> CPU capacity.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/187

>
> Signed-off-by: Shujun Xue <shujunxue@google.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..87f0238 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  45         &   SPI master \\
>  \hline
> +47         &   CPU balloon device \\
> +\hline
>  \end{tabular}
>
>  Some of the devices above are unspecified by this document,

I'm holding off voting for now until the status of the OASIS
infrastructure migration is clear (sigh).


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

