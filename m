Return-Path: <virtio-comment-return-5086-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFBAC74A5B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Mar 2023 09:15:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 08FFE82C63
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Mar 2023 09:15:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E20129864A4
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Mar 2023 09:15:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D1BFC98649F; Wed, 29 Mar 2023 09:15:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BED079864A3
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Mar 2023 09:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: X_ocP1pAPdW5osPbNSIqqw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, mst@redhat.com,
 virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com
Cc: sgarzare@redhat.com, virtio-comment@lists.oasis-open.org,
 shahafs@nvidia.com, Parav Pandit <parav@nvidia.com>, Jiri Pirko
 <jiri@nvidia.com>
In-Reply-To: <20230328201754.440974-4-parav@nvidia.com>
Organization: Red Hat GmbH
References: <20230328201754.440974-1-parav@nvidia.com>
 <20230328201754.440974-4-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 29 Mar 2023 11:15:44 +0200
Message-ID: <87tty3ncjj.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v9 3/8] transport-mmio: Rename QueueNum register

On Tue, Mar 28 2023, Parav Pandit <parav@nvidia.com> wrote:

> Currently specification uses virtqueue index and number
> interchangeably to refer to the virtqueue.
>
> It is better to always refer to it the virtqueue in consistent manner.
>
> Two registers QueueNumMax and QueueNum actually reflects the queue size
> or queue depth indicating max and actual number of entries in the queue.
>
> These are further named differently between pci and mmio transport.
> PCI transport indicates queue size as queue_size.
>
> To bring consistency between pci and mmio transport, and to avoid
> confusion between number and index, rename the QueueNumMax and QueueNum
> registers to QueueSizeMax and QueueSize respectively.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
>
> ---
> changelog:
> v8->v9:
> - added field tag to indicate field name instead of English word
> v0->v1:
> - replaced references of QueueNumMax to QueueSizeMax
> - replaced references of QueueNum to QueueSize
> - added note for renamed fields old name suggested by @Michael Tsirkin
> ---
>  transport-mmio.tex | 44 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/transport-mmio.tex b/transport-mmio.tex
> index f884a2c..9b450b8 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -110,24 +110,32 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>    \hline
>    \mmioreg{QueueSel}{Virtual queue index}{0x030}{W}{%
>      Writing to this register selects the virtual queue that the
> -    following operations on \field{QueueNumMax}, \field{QueueNum}, \field{QueueReady},
> +    following operations on \field{QueueSizeMax},
> +    \field{QueueSize}, \field{QueueReady},

I'm not sure it is worthwile keeping the lines short so aggressively
(after all, it does not affect the generated html/pdf), especially as it
makes the diff a bit harder to read, but I don't have a strong objection
to it.

On the whole,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

