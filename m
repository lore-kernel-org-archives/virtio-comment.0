Return-Path: <mst@redhat.com>
Date: Mon, 1 Aug 2022 16:54:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 5/5] Add transport vq number for virtio blk and net
Message-ID: <20220801165342-mutt-send-email-mst@kernel.org>
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
 <20220801093216.362119-6-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220801093216.362119-6-lingshan.zhu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 01, 2022 at 05:32:16PM +0800, Zhu Lingshan wrote:
> This commit add the queue number of the transport virtqueue
> for virtio_blk and virtio_net
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>

I think I prefer a transport register for this.
Otherwise, you most document that other devices must not offer
the feature bit.


> ---
>  content.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 2d4816d..2536d2a 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3801,6 +3801,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
>  \item[2(N-1)] receiveqN
>  \item[2(N-1)+1] transmitqN
>  \item[2N] controlq
> +\item[2N+1] transportq
>  \end{description}
>  
>   N=1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, otherwise N is set by
> @@ -3808,6 +3809,8 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
>  
>   controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
>  
> + transportq only exists if VIRTIO_F_TRANSPT_VQ set
> +
>  \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
>  
>  \begin{description}
> @@ -5387,11 +5390,14 @@ \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
>  \item[0] requestq1
>  \item[\ldots]
>  \item[N-1] requestqN
> +\item[N] transportq
>  \end{description}
>  
>   N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
>   \field{num_queues}.
>  
> + transportq only exists if VIRTIO_F_TRANSPT_VQ set.
> +
>  \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
>  
>  \begin{description}
> -- 
> 2.35.3

