Return-Path: virtio-comment-return-574-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23E5F985DED
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Nov 2018 20:10:08 +0000 (UTC)
Date: Fri, 30 Nov 2018 15:10:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181130150810-mutt-send-email-mst@kernel.org>
References: <20181015094130.244529-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015094130.244529-1-yuri.benditovich@daynix.com>
Subject: Re: [virtio-comment] content: RSC extension support for virtio-net
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Oct 15, 2018 at 12:41:30PM +0300, Yuri Benditovich wrote:
> Allocates feature bit for extended RSC (receive
> side coalescing) support. If the device supports
> this feature, it is able to process duplicated
> ACKs and report number of coalesced TCP segments
> amd number of received duplicated ACKs.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/20
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  content.tex | 39 ++++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index be18234..17d83af 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2525,6 +2525,10 @@ features.
>  
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> +
> +\item[VIRTIO_NET_F_RSC_EXT(38)] Device can process duplicated ACKs
> +    and report number of coalesced segments and duplicated ACKs
> +
>  \end{description}
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}

So I went to apply this and I noticed that other devices started
growing from bit 64 downward. So e.g. VIRTIO_NET_F_STANDBY is bit 62
now. Is it to late to tweak this bit to match? E.g. to use bit 61?
Or was some driver with this feature already get released?

-- 
MST

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

