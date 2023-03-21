Return-Path: <virtio-comment-return-4961-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3CAC6FD20
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 22:16:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CF8FF67049
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 22:16:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6B1E98643F
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 22:16:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9F77398631B; Tue, 21 Mar 2023 22:16:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DBA498643E
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ts2B9DLBOBGCC-JMl_D0RA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679437002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yI5zhPrOL2SBuzmo4DO8wKcMvAaoBKZWyYe+QYKsT4=;
        b=w+zcN1RVOtH1LEsZxNt7NElI1EVvoPMbkSf6Dexm/39dK/gBi4Svsor3X/RB+l0G/R
         vaG2qZz6MBDg/SWsBD70ktLD0nvwIjjrED8Uu6R8WeXrC/M5pIxKrt0zgFH/QAy+01HG
         xqPc1AvxPdE4vwUZc7ytwymMV47lX5NuQ5qZr5JJN4q++RbOFSMf72gmWHexhnM01YS4
         EVi7xLO9yHsa0tyEeXFHDAB6LAUk0pw1tldNswQ7vCuk6Ijo7dxznMjeC84VhloB0V1m
         KSJn5Fu9RZ+hHIMF8kvMaCSVqbDoFLKGOPbX58mlBwY1aTkJOULQ5hf7VQYmt6hJchcv
         DWoA==
X-Gm-Message-State: AO0yUKX2wBtV48c0PNcMsJeGZsEf5CdSXScXm7JLlvzQgAbUAMRYZ/Zy
	kc1+zm8pFuBlDbscUxX599eB/ZEtH04BIJ4X3FNelnTFiIRiHeQG9C8KjaY0HGZ9fvkjQ+BNdQu
	5/4Z/oBDdwzdvKLKWS1g0VkscLRt3FZN4bg==
X-Received: by 2002:a1c:7418:0:b0:3ed:6693:1388 with SMTP id p24-20020a1c7418000000b003ed66931388mr3579365wmc.18.1679437001711;
        Tue, 21 Mar 2023 15:16:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set9F1sGP+2+d/qLkjWpWxxOIUn0e3tgHnzGL3trxlLi1I1owjTOCv+xzSWRZwXVjzkOPyjpb/w==
X-Received: by 2002:a1c:7418:0:b0:3ed:6693:1388 with SMTP id p24-20020a1c7418000000b003ed66931388mr3579348wmc.18.1679437001284;
        Tue, 21 Mar 2023 15:16:41 -0700 (PDT)
Date: Tue, 21 Mar 2023 18:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230321180052-mutt-send-email-mst@kernel.org>
References: <20230321215834.225856-1-parav@nvidia.com>
 <20230321215834.225856-9-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230321215834.225856-9-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 8/8] virtio-net: Describe RSS using receive queue
 handle

On Tue, Mar 21, 2023 at 11:58:34PM +0200, Parav Pandit wrote:
> The content of indirection table and unclassified_queue which are
> based on math calculation historically. To better describe this, to
> avoid intermixing array index with virtqueue index and to use virtqueue
> number
> 
> introduce a field rq_handle (receive queue handle) and refer them
> to describe unclassified_queue and indirection_table fields.
> 
> As part of it, have the example that uses non zero virtqueue
> number which helps to have better mapping between receiveX
> object with virtqueue number and the actual value in the
> indirection table.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> changelog:
> v2->v3:
> - moved rq_handle definition before using it
> - removed duplicate example as rq_handle is now described first
> v0->v1:
> - new patch suggested by Michael Tsirkin
> ---
>  device-types/net/description.tex | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 435c1fc..3de8994 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1442,10 +1442,19 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \field{indirection_table} array.
>  Number of entries in \field{indirection_table} is (\field{indirection_table_mask} + 1).
>  
> -Field \field{unclassified_queue} contains the 0-based index of
> -the receive virtqueue to place unclassified packets in. Index 0 corresponds to receiveq1.
> +\begin{lstlisting}
> +le16 rq_handle;
> +\end{lstlisting}
> +
> +\field{rq_handle} is a receive virtqueue handle. It is calculated as
> +virtqueue number divided by two. For example a receive virtqueue handle
> +value of 3 corresponds to virtqueue number 6 maps to receiveq4.
> +
> +Field \field{unclassified_queue} contains the receive queue
> +handle \field{rq_handle} described above.

You dropped *which* queue this refers to.

And it's still kind of complex and non-standard. E.g. what does 
\begin{lstlisting}
le16 rq_handle;
\end{lstlisting}
mean exactly? Apparently nothing ...

I feel what we keep there is really the virtqueue number itself.
Just stored in this strage format.

And all this talk about handles kind of seems to add yet another
term to learn. Where in fact all it is, is just a different way
to store vqn.

So my idea was this: we say something like:


\field{unclassified_queue} contains the virtqueue number of the
receive queue to place unclassified packets in.
\field{indirection_table} contains an array of virtqueue numbers of
receive queues.

Both \field{unclassified_queue} and \field{indirection_table} use the
following format for the virtqueue numbers:
\begin{lstlisting}
struct rss_virtqueue_number {
	le16 vqn_16_1 : 15; /* Bits 16 to 1 of the virtqueue number */
	le16 reserved : 1; /* Set to 0 */
}
\end{lstlisting}
for example, a value of 3 corresponds to virtqueue number 6 and maps to receiveq4.



and then everywhere else we just say it keeps a vq number, we
already explained it is using this format once no need to repeat that.

WDYT?


>  
> -Field \field{indirection_table} contains an array of 0-based indices of receive virtqueues. Index 0 corresponds to receiveq1.
> +Field \field{indirection_table} contains an array of receive
> +queue handles described above in \field{rq_handle}.
>  
>  A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>  
> @@ -1455,7 +1464,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  
>  A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the feature VIRTIO_NET_F_RSS has not been negotiated.
>  
> -A driver MUST fill the \field{indirection_table} array only with indices of enabled queues. Index 0 corresponds to receiveq1.
> +A driver MUST fill the \field{indirection_table} array only with
> +the \field{rq_handle} corresponding to the enabled receive virtqueues.
>  
>  The number of entries in \field{indirection_table} (\field{indirection_table_mask} + 1) MUST be a power of two.
>  
> @@ -1468,7 +1478,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \begin{itemize}
>  \item Calculate the hash of the packet as defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}.
>  \item If the device did not calculate the hash for the specific packet, the device directs the packet to the receiveq specified by \field{unclassified_queue} of virtio_net_rss_config structure.
> -\item Apply \field{indirection_table_mask} to the calculated hash and use the result as the index in the indirection table to get 0-based number of destination receiveq.
> +\item Apply \field{indirection_table_mask} to the calculated hash
> +and use the result as the index in the indirection table to get
> +\field{rq_handle}.
>  \item If the destination receive queue is being reset (See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}), the device MUST drop the packet.
>  \end{itemize}
>  
> -- 
> 2.26.2


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

