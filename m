Return-Path: virtio-comment-return-577-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA30E985B7E
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Dec 2018 08:13:40 +0000 (UTC)
Date: Mon, 3 Dec 2018 09:13:32 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20181203091332.17796057.cohuck@redhat.com>
In-Reply-To: <20181202141628.384085-1-yuri.benditovich@daynix.com>
References: <20181202141628.384085-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH] virtio-net: changing
 VIRTIO_NET_F_RSC_EXT from 38 to 61
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun,  2 Dec 2018 16:16:28 +0200
Yuri Benditovich <yuri.benditovich@daynix.com> wrote:

> Changing feature bit per TC request.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  content.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index 17d83af..8f5c2ab 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2526,7 +2526,7 @@ features.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> -\item[VIRTIO_NET_F_RSC_EXT(38)] Device can process duplicated ACKs
> +\item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>      and report number of coalesced segments and duplicated ACKs
>  
>  \end{description}

Acked-by: Cornelia Huck <cohuck@redhat.com>

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

