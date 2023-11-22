Return-Path: <virtio-comment-return-8555-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD297C61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:42:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 012882AEDF
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:42:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D24E79868A4
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:42:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEA4D986384; Wed, 22 Nov 2023 13:42:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF3C1986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: knHRNCJFPoerbX1yHh99Ng-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com, Parav Pandit <parav@nvidia.com>, Heng Qi
 <hengqi@linux.alibaba.com>
In-Reply-To: <20231110123853.2093309-4-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-4-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Nov 2023 14:42:13 +0100
Message-ID: <874jhdlxai.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v6 3/5] virtio-net: Add flow filter group life cycle
 commands

On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:

> @@ -2596,6 +2606,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  Each array entry of \field{types} represents supported match fields of
>  the packet by the device.
>  
> +\subparagraph{Flow Filter Group Add}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
> +
> +The command VIRTIO_NET_CTRL_FF_GROUP_ADD adds a new flow filter
> +group with the supplied group identifier \field{id} with assigned
> +priority \field{priority}.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_group_add {
> +        le16 priority;	/* higher the value, higher priority */
> +        le16 id;
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Flow Filter Group Delete}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
> +
> +The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the
> +flow filter group that has been previously added using command
> +VIRTIO_NET_CTRL_FF_GROUP_ADD. Flow filter group is
> +identified using a group identifier \field{id}.

"The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the flow filter group
identified by the group identifier \field{id} previously added using the
command VIRTIO_NET_CTRL_FF_GROUP_ADD."

> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_group_del {
> +        le16 id;
> +};
> +\end{lstlisting}
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}


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

