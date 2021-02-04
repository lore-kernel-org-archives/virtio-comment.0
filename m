Return-Path: virtio-comment-return-1713-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5EA9A98660B
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Feb 2021 10:16:33 +0000 (UTC)
Date: Thu, 4 Feb 2021 11:16:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210204111625.4700dd1e.cohuck@redhat.com>
In-Reply-To: <20210204074600.1926789-1-vivek.kasireddy@intel.com>
References: <20210203111532.69ee4033.cohuck@redhat.com>
	<20210204074600.1926789-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] content: Request to reserve device ID
 37 for Dmabuf device
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: virtio-comment@lists.oasis-open.org, Dongwon Kim <dongwon.kim@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed,  3 Feb 2021 23:46:00 -0800
Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

> The Dmabuf device can be used to share a dmabuf created in the Guest
> with the Host.
> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 1ca24c1..c1ba683 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2846,6 +2846,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  35         &   Watchdog \\
>  \hline
> +37         &   Dmabuf device \\
> +\hline
>  \end{tabular}
>  
>  Some of the devices above are unspecified by this document,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

In order to request a vote, please follow the process outlined at
https://github.com/oasis-tcs/virtio-spec#use-of-github-issues.


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

