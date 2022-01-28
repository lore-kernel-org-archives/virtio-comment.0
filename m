Return-Path: <virtio-comment-return-2666-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B274A98659C
	for <virtio-comment@lists.oasis-open.org>; Fri, 28 Jan 2022 15:52:30 +0000 (UTC)
Message-ID: <4d89812d-aca6-3f05-b0b8-ec9db83050fa@redhat.com>
Date: Fri, 28 Jan 2022 16:52:25 +0100
MIME-Version: 1.0
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-3-stevensd@chromium.org>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <20220124125625.3706347-3-stevensd@chromium.org>
Subject: Re: [virtio-comment] [PATCH 2/2] virtio-balloon: add a responsive
 host feature
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: David Stevens <stevensd@chromium.org>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 24.01.22 13:56, David Stevens wrote:
> Add a feature bit that the device can use to indicate that it will
> monitor and respond to memory pressure in the guest. This flag allows
> the driver to assume that the device will provide memory when necessary
> and will not permanently remove memory from the guest via inflating the
> balloon.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  content.tex | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 3aeb319d31a7..dcb2b71a2b6a 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -5451,6 +5451,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
>      page reporting. A virtqueue for reporting free guest memory is present.
>  \item[ VIRTIO_BALLOON_F_EVENT_VQ(6) ] A virtqueue for sending events from
>      the driver to the device.
> +\item[ VIRTIO_BALLOON_F_RESPONSIVE_HOST(7) ] The device will respond to memory
> +    pressure in the guest by deflating the balloon.

s/HOST/DEVICE/ ?

>  
>  \end{description}
>  
> @@ -5471,6 +5473,14 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
>  bit, and if the driver did not accept this feature bit, the
>  device MAY signal failure by failing to set FEATURES_OK
>  \field{device status} bit when the driver writes it.
> +
> +If the device offers the VIRTIO_BALLOON_F_RESPONSIVE_HOST feature
> +bit, it MUST also offer the VIRTIO_BALLOON_F_STATS_VQ and
> +VIRTIO_BALLOON_F_EVENT_VQ feature bits. Although the device may not
> +always be able to immediately respond to memory pressure in the
> +guest, the device SHOULD be able to fully deflate the balloon if
> +memory pressure persists in the guest.

Hm. If you take a look at the history of memory ballooning, it is even
*desired* for the VM to have memory pressure.

The hypervisor has memory pressure, instead of swapping random stuff, it
inflates the memory balloon of the VMs.

The VMs will be *under memory pressure* and either shrink the pagecache
or start swapping what they consider least valuable. Reclaim under
memory pressure.

So memory pressure is intended, you just don't want to destabilize the
VMs. Maybe you actually didn't intend to phrase it that way here?



-- 
Thanks,

David / dhildenb


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

