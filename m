Return-Path: virtio-comment-return-1481-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A62B98614C
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Oct 2020 09:25:47 +0000 (UTC)
Date: Thu, 29 Oct 2020 10:25:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20201029102536.4c8965a8.cohuck@redhat.com>
In-Reply-To: <20201021135847.15236-1-robert.bradford@intel.com>
References: <20201021135847.15236-1-robert.bradford@intel.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] content: Reserve virtio-watchog device
 ID
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Bradford <robert.bradford@intel.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 21 Oct 2020 14:58:47 +0100
Rob Bradford <robert.bradford@intel.com> wrote:

> Reserve an ID for a watchdog device which may be used to ensure that the
> guest is responsive. This is equivalent of a hardware watchdog device
> and will trigger the reboot of the guest if the the host does not
> periodic ping from the the guest.
> 
> Signed-off-by: Rob Bradford <robert.bradford@intel.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index bc26674..6f8ec8f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2819,6 +2819,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  33         &   NitroSecureModule \\
>  \hline
> +35         &   Watchdog \\
> +\hline
>  \end{tabular}
>  
>  Some of the devices above are unspecified by this document,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Time to vote on this (and the patch reserving 34 for I2C?)


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

