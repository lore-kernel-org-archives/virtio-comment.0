Return-Path: virtio-comment-return-1869-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 790DD98628D
	for <virtio-comment@lists.oasis-open.org>; Tue,  1 Jun 2021 11:47:39 +0000 (UTC)
Date: Tue, 1 Jun 2021 13:47:31 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210601134731.0b73d7b1.cohuck@redhat.com>
In-Reply-To: <20210504181307.2820901-1-jiang.wang@bytedance.com>
References: <20210504181307.2820901-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: fix a display for
 num_buffers
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Jiang Wang <jiang.wang@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue,  4 May 2021 18:13:07 +0000
Jiang Wang <jiang.wang@bytedance.com> wrote:

> One of num_buffers does not display correctly in
> the html. The _b becomes a subscript b. This will
> prevent it to be searched by using keyword num_buffers.
> 
> Fix it by add an escape character.
> 
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---
>  content.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index b72bad0..21fb4c4 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3595,7 +3595,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  the packet (including the header) is spread over.
>  
>  If a receive packet is spread over multiple buffers, the device
> -MUST use all buffers but the last (i.e. the first $num_buffers -
> +MUST use all buffers but the last (i.e. the first $num\_buffers -
>  1$ buffers) completely up to the full length of each buffer
>  supplied by the driver.
>  

This looks a bit better in the output, but I'm wondering whether using
"\field{num_buffers} - 1" would be a more consistent way.


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

