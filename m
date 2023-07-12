Return-Path: <virtio-comment-return-6829-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C53AEB64DD
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 12:22:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D36D741EED
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 12:22:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CDA9D9867C5
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 12:22:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C4005986663; Wed, 12 Jul 2023 12:22:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B297F98671F
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Jul 2023 12:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: muIE5kq_N6yHqOKg_Z3NOg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, Yuri Benditovich
 <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230703152711.106008-1-hengqi@linux.alibaba.com>
Organization: Red Hat GmbH
References: <20230703152711.106008-1-hengqi@linux.alibaba.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 12 Jul 2023 14:22:26 +0200
Message-ID: <87pm4xjp4t.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v21] virtio-net: support inner header hash

On Mon, Jul 03 2023, Heng Qi <hengqi@linux.alibaba.com> wrote:

(...)

> +\paragraph{Inner Header Hash}
> +\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Inner Header Hash}
> +
> +If VIRTIO_NET_F_HASH_TUNNEL has been negotiated, the driver can send the command
> +VIRTIO_NET_CTRL_HASH_TUNNEL_SET to configure the calculation of the inner header hash.
> +
> +struct virtnet_hash_tunnel {
> +    le32 enabled_tunnel_types;
> +};
> +
> +#define VIRTIO_NET_CTRL_HASH_TUNNEL 7
> + #define VIRTIO_NET_CTRL_HASH_TUNNEL_SET 0

This needs to be wrapped in \begin{lstlisting}..\end{lstlisting}, can do
so when applying.

(...)

> +Encapsulation types applicable for inner header hash:
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2784    (1 << 0) /* \hyperref[intro:gre_rfc2784]{[GRE_rfc2784]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_2890    (1 << 1) /* \hyperref[intro:gre_rfc2890]{[GRE_rfc2890]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_7676    (1 << 2) /* \hyperref[intro:gre_rfc7676]{[GRE_rfc7676]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_GRE_UDP     (1 << 3) /* \hyperref[intro:gre_in_udp_rfc8086]{[GRE-in-UDP]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN       (1 << 4) /* \hyperref[intro:vxlan]{[VXLAN]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN_GPE   (1 << 5) /* \hyperref[intro:vxlan_gpe]{[VXLAN-GPE]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_GENEVE      (1 << 6) /* \hyperref[intro:geneve]{[GENEVE]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_IPIP        (1 << 7) /* \hyperref[intro:ipip]{[IPIP]} */
> +#define VIRTIO_NET_HASH_TUNNEL_TYPE_NVGRE       (1 << 8) /* \hyperref[intro:nvgre]{[NVGRE]} */
> +\end{lstlisting}

I'm afraid this one doesn't come out quite as intended, we'll end up
with verbatim "\hyperref" text instead of a link. Anyone have a good
idea on how to fix that?

I'd prefer to push this now with the first issue addressed and to do an
(editorial) patch on top to deal with the second issue (unless someone
can come up with a really trivial fix for it, then I can apply that
straightaway.)


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

